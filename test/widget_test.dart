import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmr_oral_boards/app.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: PmrOralBoardsApp()),
    );
    expect(find.text('PM&R Oral Boards'), findsOneWidget);
  });
}
