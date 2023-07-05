import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/features/note/view/note_page.dart';
import 'package:note_taking_app/presentation/features/note/widgets/note_widget.dart';

void main() {
  group('ScrollTestingWidget', () {
    testWidgets('should not scroll with less items',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(
          home: NotePage(
        notes: List.generate(
            5,
            (index) => NoteModel(
                id: '$index',
                title: 'Notebook $index',
                titleSearch: ['T', 'Te', 'Tes'],
                description: 'Let\'s run some tests',
                createdBy: '002',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now())),
      )));

      await widgetTester.drag(find.byType(ListView), const Offset(0, -300));
      await widgetTester.pump();

      final firstNoteFinder = find.text('Notebook 0');
      expect(firstNoteFinder, findsOneWidget);
    });

    testWidgets('should scroll with more list of notes',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(
          home: NotePage(
        notes: List.generate(
            20,
            (index) => NoteModel(
                id: '$index',
                title: 'Notebook $index',
                titleSearch: ['T', 'Te', 'Tes'],
                description: 'Let\'s run some tests',
                createdBy: '002',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now())),
      )));

      await widgetTester.drag(find.byType(ListView), const Offset(0, -300));
      await widgetTester.pump();

      final firstNoteFinder = find.text('Notebook 0');
      final twentyNoteFinder = find.byType(NoteWidget);
      // final noteWidget = find.byType(NoteWidget);

      // result
      expect(firstNoteFinder, findsNothing);
      expect(twentyNoteFinder, findsWidgets);
      //expect(noteWidget, findsNWidgets(5));
    });

    testWidgets('show only only 3 on small screen size',
        (WidgetTester widgetTester) async {
      widgetTester.view.physicalSize = const Size(360.00, 640.00);
      await widgetTester.pumpWidget(MaterialApp(
          home: NotePage(
        notes: List.generate(
            3,
            (index) => NoteModel(
                id: '$index',
                title: 'Notebook $index',
                titleSearch: ['T', 'Te', 'Tes'],
                description: 'Let\'s run some tests',
                createdBy: '002',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now())),
      )));
      final threeNoteWidget = find.byType(NoteWidget);
      // expected values
      expect(threeNoteWidget, findsNWidgets(3));
    });

    testWidgets('Should throw an exception if note list is empty',
        (WidgetTester widgetTester) async {
      await widgetTester
          .pumpWidget(const MaterialApp(home: NotePage(notes: [])));
      // expected values
      expect(widgetTester.takeException(), isAssertionError);
    });
  });
}
