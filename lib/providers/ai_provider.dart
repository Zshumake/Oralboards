import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/gemini_service.dart';
import 'settings_provider.dart';

/// Stores feedback results per section id.
/// Value is either a FeedbackAnalysis or an error String.
final feedbacksProvider =
    StateProvider<Map<String, dynamic>>((ref) => {});

/// Tracks which section IDs are currently generating feedback.
final generatingFeedbackForProvider =
    StateProvider<Set<String>>((ref) => {});

/// Gets AI feedback for a specific section.
Future<void> getFeedback(
  WidgetRef ref,
  String sectionId,
  String transcript,
  String modelAnswer,
) async {
  final apiKey = ref.read(apiKeyProvider).valueOrNull ?? '';
  if (apiKey.isEmpty) {
    ref.read(feedbacksProvider.notifier).update((state) {
      final next = Map<String, dynamic>.from(state);
      next[sectionId] = 'Please set your API Key in Settings to get AI feedback.';
      return next;
    });
    return;
  }
  if (transcript.trim().isEmpty) {
    ref.read(feedbacksProvider.notifier).update((state) {
      final next = Map<String, dynamic>.from(state);
      next[sectionId] = 'Please record or type an answer first.';
      return next;
    });
    return;
  }

  // Mark as generating
  ref.read(generatingFeedbackForProvider.notifier).update((state) {
    final next = Set<String>.from(state);
    next.add(sectionId);
    return next;
  });

  final result = await generateFeedback(transcript, modelAnswer, apiKey);

  // Store result
  ref.read(feedbacksProvider.notifier).update((state) {
    final next = Map<String, dynamic>.from(state);
    next[sectionId] = result;
    return next;
  });

  // Remove from generating
  ref.read(generatingFeedbackForProvider.notifier).update((state) {
    final next = Set<String>.from(state);
    next.remove(sectionId);
    return next;
  });
}

/// Clears feedback for a specific section.
void clearFeedback(WidgetRef ref, String sectionId) {
  ref.read(feedbacksProvider.notifier).update((state) {
    final next = Map<String, dynamic>.from(state);
    next.remove(sectionId);
    return next;
  });
}

/// Resets all AI state.
void resetAiState(WidgetRef ref) {
  ref.read(feedbacksProvider.notifier).state = {};
  ref.read(generatingFeedbackForProvider.notifier).state = {};
}
