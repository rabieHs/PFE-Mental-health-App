import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  final _texttonum = 'assets/texttonum.txt';

  final int _maxlen = 256;

  final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<UNKNOWN>';

  Map<String, int>? _dict;

  Interpreter? _interpreter;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('model.tflite');
    print("interpreter loaded successfully");
  }

  Future<void> _LoadDictionary() async {
    final vocab = await rootBundle.loadString(_texttonum);
    var dict = <String, int>{};
    final vocabList = vocab.split('\n');
    for (var i = 0; i < vocabList.length; i++) {
      var entry = vocabList[i].trim().split(' ');
      dict[entry[0]] = int.parse(entry[1]);
    }
    _dict = dict;

    print('dictionary loaded successfully $_dict');
  }

  Future<List<List<double>>> tokenizeINputText(String text) async {
    final toks = text.split(' ');
    await _LoadDictionary();

    var vec = List<double>.filled(_maxlen, _dict![pad]!.toDouble());

    var index = 0;
    if (_dict!.containsKey(start)) {
      vec[index] = _dict![start]!.toDouble();
      index++;
    }

    for (var tok in toks) {
      if (index > _maxlen) {
        break;
      }
      vec[index] = _dict!.containsKey(tok)
          ? _dict![tok]!.toDouble()
          : _dict![unk]!.toDouble();
      index++;
    }
    print(vec);
    return [vec];
  }

  Future<List<List<double>>> classify(String rawText) async {
    List<List<double>> input = await tokenizeINputText(rawText);

    var output = [
      [0.0, 0.0]
    ];
    if (_interpreter == null) {
      print("null interpreter :(");
    }
    _interpreter!.run(input, output);
    print(output);
    var result = 0;

    // if ((output[0][0]) > (output[0][1])) {
    //   result = 0;
    // } else {
    //   result = 1;
    // }
    // print(result);
    return output;
  }
}
