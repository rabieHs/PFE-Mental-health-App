import 'dart:math' as math;

import '../models/questions.dart';

class QuestionServices {
  String getscore(int score, String questionType, List<int> scoreList) {
    String? output;
    switch (questionType) {
      case ('phq9'):
        if (score >= 0 && score <= 10) {
          output = "Normal";
        } else {
          output = "Depression";
        }
        break;
      case ('gad7'):
        if (score >= 0 && score <= 8) {
          output = "Normal";
        } else {
          output = "Anxiety";
        }
        break;
      case ('pss'):
        if (score >= 0 && score <= 15) {
          output = "Normal";
        } else {
          output = "Stress";
        }
        break;
      case ('dass21'):
        List<List<int>> groups =
            List.generate(3, (i) => scoreList.sublist(i * 7, (i + 1) * 7));
        List<String> groupNames = ['Depression', 'Anxiety', 'Stress'];
        List<int> totalScores =
            groups.map((group) => group.reduce((a, b) => a + b)).toList();
        Map<String, int> groupScores =
            new Map.fromIterables(groupNames, totalScores);
        var highestScore = groupScores.entries
            .firstWhere((e) => e.value == groupScores.values.reduce(math.max));
        print(highestScore.key);
        output = highestScore.key;
        break;
    }
    return output!;
  }
}
