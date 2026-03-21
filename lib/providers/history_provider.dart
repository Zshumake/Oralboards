import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/exam_result.dart';
import '../services/database_service.dart';

final examHistoryProvider =
    AsyncNotifierProvider<ExamHistoryNotifier, List<ExamResult>>(
  ExamHistoryNotifier.new,
);

class ExamHistoryNotifier extends AsyncNotifier<List<ExamResult>> {
  @override
  Future<List<ExamResult>> build() async {
    return DatabaseService.getAllResults();
  }

  Future<void> addResult(ExamResult result) async {
    await DatabaseService.insertExamResult(result);
    state = AsyncData(await DatabaseService.getAllResults());
  }

  Future<void> refresh() async {
    state = AsyncData(await DatabaseService.getAllResults());
  }

  Future<void> deleteResult(int id) async {
    await DatabaseService.deleteResult(id);
    state = AsyncData(await DatabaseService.getAllResults());
  }

  Future<List<ExamResult>> getResultsForCase(String caseId) async {
    return DatabaseService.getResultsForCase(caseId);
  }
}

/// Provider that returns the latest exam result for a specific case.
final latestCaseResultProvider =
    FutureProvider.family<ExamResult?, String>((ref, caseId) async {
  // Watch the history so this refreshes when results change
  ref.watch(examHistoryProvider);
  return DatabaseService.getLatestResultForCase(caseId);
});
