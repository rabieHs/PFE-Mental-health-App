class Question {
  final String questionText;
  final List<Answer> answers;

  Question(this.questionText, this.answers);
}

class Answer {
  final String answerText;
  final int score;

  Answer(this.answerText, this.score);
}

List<Question> getPHQ9question() {
  List<Question> list = [];
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems... Feeling down, depressed, or hopeless?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems... Trouble falling or staying asleep, or sleeping too much?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems... Feeling tired or having little energy?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems... Poor appetite or overeating?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems...  Feeling bad about yourself -- or that you are a failure or have let yourself or your family down?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems...  Trouble concentrating on things, such as reading newspapers or watching television?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems...  Moving or speaking slowly that other could have noticed. Or the opposite -- being so figety or restless that you have been moving around a lot more than usual?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks how often have you been bothered by any of the following problems...  Thoughts that you would be better off dead, or of hurting yourself?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'If you have checked off any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));

  return list;
}

List<Question> getPSSquestion() {
  List<Question> list = [];
  list.add(Question(
      "In the last month, how often have you been upset because of something that happened unexpectedly?  ",
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you felt that you were unable to control the important things in your life? ',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you felt nervous and stressed? ', [
    Answer('Never', 0),
    Answer('Almost Never', 1),
    Answer('Sometimes', 2),
    Answer('Fairly Often', 3),
    Answer('Very Ften', 4),
  ]));
  list.add(Question(
      ' In the last month, how often have you felt confident about your ability to handle your personal problems? ',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you felt that things were going your way?',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you found that you could not cope with all the things that you had to do?',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you been able to control irritations in your life?',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you felt that you were on top of things?',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you felt that you were on top of things?',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));
  list.add(Question(
      'In the last month, how often have you felt difficulties were piling up so high that you could not overcome them?',
      [
        Answer('Never', 0),
        Answer('Almost Never', 1),
        Answer('Sometimes', 2),
        Answer('Fairly Often', 3),
        Answer('Very Ften', 4),
      ]));

  return list;
}

List<Question> getGAD7question() {
  List<Question> list = [];
  list.add(Question(
      'Over the last 2 weeks, how often have you been bothered by the following problem: Feeling nervous, anxious or on edge?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks, how often have you been bothered by the following problem: Not being able to stop or control worrying?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks, how often have you been bothered by the following problem: Worrying too much about different things?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks, how often have you been bothered by the following problem: Having trouble relaxing?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks, how often have you been bothered by the following problem: Being so restless that it is hard to sit still?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks, how often have you been bothered by the following problem: Becoming easily annoyed or irritable?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));
  list.add(Question(
      'Over the last 2 weeks, how often have you been bothered by the following problem: Feeling afraid as if something awful might happen?',
      [
        Answer('Not at all', 0),
        Answer('Several days', 1),
        Answer('More than half the days', 2),
        Answer('Nearly every day', 3),
      ]));

  return list;
}

List<Question> getDASS21question() {
  List<Question> list = [];
  list.add(Question('I felt sad', [
    Answer('Did not apply to me at all', 0),
    Answer('Applied to me SOMETIMES', 1),
    Answer('Applied to me OFTEN', 2),
    Answer('Applied to me very much', 3),
  ]));
  list.add(Question('I found myself getting upset by quite small things', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt hopeless about the future', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question(
      'I found myself getting impatient when I was delayed in any way', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that I was very low in spirits', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that I had nothing to look forward to', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I found life unsatisfying', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt nervous', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt tense or highly strung', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I found it difficult to relax', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that I was using a lot of nervous energy', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that I was close to panic', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question("I felt that I couldn't cope with everything", [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that I was losing control of my feelings', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that I was under a lot of stress', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I found it hard to wind down', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I was irritable', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that I was very tense', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question(
      "I felt that I couldn't handle the things that were happening to me", [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I found myself getting upset rather easily', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));
  list.add(Question('I felt that things were getting on top of me', [
    Answer('Not at all', 0),
    Answer('Several days', 1),
    Answer('More than half the days', 2),
    Answer('Nearly every day', 3),
  ]));

  return list;
}
