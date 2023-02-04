import 'package:flutter/material.dart';
import 'package:mental_health_app/quotes/models/quotes_model.dart';

class QuotesProvider extends ChangeNotifier {
  Quotes _quotes = Quotes(title: "", author: "", image: "");
  Quotes get quotes => _quotes;

  void setUser(String quotes) {
    _quotes = Quotes.fromJson(quotes);
    notifyListeners();
  }

  void setUserFromModel(Quotes quotes) {
    _quotes = quotes;
    notifyListeners();
  }
}
