class Quiz {
  const Quiz({required this.questions, required this.answers});

  final String questions;
  final List<String > answers;

  String get getQuestions => questions;
  List<String> get getAnswers => answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

const questions = [
  Quiz(
    questions: 'What are the main building blocks of Flutter UIs?',
    answers:
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  Quiz(
    questions: 'How are Flutter UIs built?', 
    answers: [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  Quiz(
    questions: 'What\'s the purpose of a StatefulWidget?',
    answers: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  Quiz(
    questions: 'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answers: [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  Quiz(
    questions: 'What happens if you change data in a StatelessWidget?',
    answers: [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  Quiz(
    questions: 'How should you update data inside of StatefulWidgets?',
    answers: [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];