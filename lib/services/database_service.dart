import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/exam_result.dart';
import '../models/exam_transcript.dart';

class DatabaseService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'pmr_boards.db');

    return openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE exam_results (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            caseId TEXT NOT NULL,
            caseTitle TEXT NOT NULL,
            date TEXT NOT NULL,
            overallScore REAL NOT NULL,
            timeElapsedSeconds INTEGER NOT NULL,
            sectionScoresJson TEXT NOT NULL,
            redFlagCount INTEGER NOT NULL,
            totalConceptsHit INTEGER NOT NULL,
            totalConceptsMissed INTEGER NOT NULL
          )
        ''');
        await _createV2Tables(db);
        await _createV3Tables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) await _createV2Tables(db);
        if (oldVersion < 3) await _createV3Tables(db);
      },
    );
  }

  static Future<void> _createV2Tables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS exam_transcripts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        examResultId INTEGER NOT NULL,
        sectionId TEXT NOT NULL,
        conversationJson TEXT NOT NULL,
        FOREIGN KEY (examResultId) REFERENCES exam_results(id) ON DELETE CASCADE
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS study_feedback_results (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        caseId TEXT NOT NULL,
        sectionId TEXT NOT NULL,
        date TEXT NOT NULL,
        score INTEGER NOT NULL,
        missedConceptsJson TEXT NOT NULL,
        redFlagsJson TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS practice_goals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        description TEXT NOT NULL,
        targetValue REAL NOT NULL,
        targetDomain TEXT,
        createdAt TEXT NOT NULL,
        deadlineAt TEXT,
        isCompleted INTEGER NOT NULL DEFAULT 0
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS practice_log (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        caseId TEXT NOT NULL,
        mode TEXT NOT NULL
      )
    ''');
  }

  static Future<void> _createV3Tables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS review_schedule (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        caseId TEXT NOT NULL UNIQUE,
        nextReviewDate TEXT NOT NULL,
        intervalDays REAL NOT NULL DEFAULT 1.0,
        easeFactor REAL NOT NULL DEFAULT 2.5,
        reviewCount INTEGER NOT NULL DEFAULT 0,
        lastScore REAL,
        lastReviewDate TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS custom_cases (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        caseId TEXT NOT NULL UNIQUE,
        title TEXT NOT NULL,
        sectionsJson TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL
      )
    ''');
  }

  // --- Exam Results ---

  static Future<int> insertExamResult(ExamResult result) async {
    final db = await database;
    return db.insert('exam_results', result.toMap());
  }

  static Future<ExamResult?> getResultById(int id) async {
    final db = await database;
    final maps =
        await db.query('exam_results', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return ExamResult.fromMap(maps.first);
  }

  static Future<List<ExamResult>> getAllResults() async {
    final db = await database;
    final maps = await db.query('exam_results', orderBy: 'date DESC');
    return maps.map((m) => ExamResult.fromMap(m)).toList();
  }

  static Future<List<ExamResult>> getResultsForCase(String caseId) async {
    final db = await database;
    final maps = await db.query(
      'exam_results',
      where: 'caseId = ?',
      whereArgs: [caseId],
      orderBy: 'date DESC',
    );
    return maps.map((m) => ExamResult.fromMap(m)).toList();
  }

  static Future<ExamResult?> getLatestResultForCase(String caseId) async {
    final db = await database;
    final maps = await db.query(
      'exam_results',
      where: 'caseId = ?',
      whereArgs: [caseId],
      orderBy: 'date DESC',
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return ExamResult.fromMap(maps.first);
  }

  static Future<int> deleteResult(int id) async {
    final db = await database;
    await db.delete('exam_transcripts',
        where: 'examResultId = ?', whereArgs: [id]);
    return db.delete('exam_results', where: 'id = ?', whereArgs: [id]);
  }

  // --- Transcripts ---

  static Future<void> insertTranscripts(
      int examResultId, Map<String, List<Map<String, String>>> messagesBySection) async {
    final db = await database;
    final batch = db.batch();
    for (final entry in messagesBySection.entries) {
      batch.insert('exam_transcripts', {
        'examResultId': examResultId,
        'sectionId': entry.key,
        'conversationJson': json.encode(entry.value),
      });
    }
    await batch.commit(noResult: true);
  }

  static Future<List<ExamTranscript>> getTranscriptsForResult(
      int examResultId) async {
    final db = await database;
    final maps = await db.query(
      'exam_transcripts',
      where: 'examResultId = ?',
      whereArgs: [examResultId],
    );
    return maps.map((m) => ExamTranscript.fromMap(m)).toList();
  }

  // --- Study Feedback ---

  static Future<int> insertStudyFeedback({
    required String caseId,
    required String sectionId,
    required int score,
    required List<String> missedConcepts,
    required List<String> redFlags,
  }) async {
    final db = await database;
    return db.insert('study_feedback_results', {
      'caseId': caseId,
      'sectionId': sectionId,
      'date': DateTime.now().toIso8601String(),
      'score': score,
      'missedConceptsJson': json.encode(missedConcepts),
      'redFlagsJson': json.encode(redFlags),
    });
  }

  static Future<List<Map<String, dynamic>>> getAllStudyFeedback() async {
    final db = await database;
    return db.query('study_feedback_results', orderBy: 'date DESC');
  }

  // --- Practice Log ---

  static Future<void> logPractice(String caseId, String mode) async {
    final db = await database;
    await db.insert('practice_log', {
      'date': DateTime.now().toIso8601String().substring(0, 10),
      'caseId': caseId,
      'mode': mode,
    });
  }

  static Future<List<String>> getPracticeDates() async {
    final db = await database;
    final maps = await db.rawQuery(
        'SELECT DISTINCT date FROM practice_log ORDER BY date DESC');
    return maps.map((m) => m['date'] as String).toList();
  }

  // --- Goals ---

  static Future<int> insertGoal(Map<String, dynamic> goal) async {
    final db = await database;
    return db.insert('practice_goals', goal);
  }

  static Future<List<Map<String, dynamic>>> getAllGoals() async {
    final db = await database;
    return db.query('practice_goals',
        where: 'isCompleted = 0', orderBy: 'createdAt DESC');
  }

  static Future<void> completeGoal(int id) async {
    final db = await database;
    await db.update('practice_goals', {'isCompleted': 1},
        where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteGoal(int id) async {
    final db = await database;
    await db.delete('practice_goals', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> getExamCountSince(DateTime since) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM exam_results WHERE date >= ?',
      [since.toIso8601String()],
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  // --- Review Schedule (Spaced Repetition) ---

  static Future<void> upsertReviewSchedule(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('review_schedule', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getAllReviewSchedules() async {
    final db = await database;
    return db.query('review_schedule', orderBy: 'nextReviewDate ASC');
  }

  static Future<Map<String, dynamic>?> getReviewSchedule(
      String caseId) async {
    final db = await database;
    final maps = await db.query('review_schedule',
        where: 'caseId = ?', whereArgs: [caseId]);
    return maps.isEmpty ? null : maps.first;
  }

  // --- Custom Cases ---

  static Future<int> insertCustomCase(Map<String, dynamic> data) async {
    final db = await database;
    return db.insert('custom_cases', data);
  }

  static Future<List<Map<String, dynamic>>> getAllCustomCases() async {
    final db = await database;
    return db.query('custom_cases', orderBy: 'updatedAt DESC');
  }

  static Future<void> updateCustomCase(
      String caseId, Map<String, dynamic> data) async {
    final db = await database;
    await db.update('custom_cases', data,
        where: 'caseId = ?', whereArgs: [caseId]);
  }

  static Future<void> deleteCustomCase(String caseId) async {
    final db = await database;
    await db.delete('custom_cases', where: 'caseId = ?', whereArgs: [caseId]);
  }
}
