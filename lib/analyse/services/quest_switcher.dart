import 'package:flutter/material.dart';
import 'package:mental_health_app/analyse/models/questions.dart';
import 'package:mental_health_app/analyse/screens/quiz_screen.dart';
import 'package:mental_health_app/analyse/services/analyse_services.dart';
import 'package:mental_health_app/screens/home.dart';

class QuestSwitcher {
  switchController(
      String emotion, String textClassification, BuildContext context) {
    switch (emotion) {
      case "Happy":
        if (textClassification == "Positive") {
          AnalyseServices analyseServices = AnalyseServices();
          analyseServices.checkAndUpdateUserMood("Normal");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Quiz2(
                  questionList: getDASS21question(), questionType: 'dass21')));
        }
        break;
      case "Sad":
        if (textClassification == "Positive") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Quiz2(
                  questionList: getDASS21question(), questionType: 'dass21')));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Quiz2(
                  questionList: getPHQ9question(), questionType: 'phq9')));
        }
        break;
      case "Angry":
        if (textClassification == "Positive") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Quiz2(
                  questionList: getDASS21question(), questionType: 'dass21')));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  Quiz2(questionList: getPSSquestion(), questionType: 'pss')));
        }
        break;
      case "Fearful":
        if (textClassification == "Positive") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Quiz2(
                  questionList: getDASS21question(), questionType: 'dass21')));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Quiz2(
                  questionList: getGAD7question(), questionType: 'gad7')));
        }
        break;
      case "Surprised":
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Quiz2(
                questionList: getDASS21question(), questionType: 'dass21')));

        break;
      case "Disgusted":
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Quiz2(
                questionList: getDASS21question(), questionType: 'dass21')));

        break;
      case "Neutral":
        if (textClassification == "Positive") {
          AnalyseServices analyseServices = AnalyseServices();
          analyseServices.checkAndUpdateUserMood("Normal");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Quiz2(
                  questionList: getDASS21question(), questionType: 'dass21')));
        }
        break;
    }
  }
}
