/*
* OpenTabu is an Open Source game developed by Leonardo Rignanese <dev.rignanese@gmail.com>
* GNU Affero General Public License v3.0: https://choosealicense.com/licenses/agpl-3.0/
* GITHUB: https://github.com/rignaneseleo/OpenTabu
* */
import 'dart:async';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:opentabu/model/word.dart';
import 'package:opentabu/persistence/data_reader.dart';

class CSVDataReader {
  static Future<List<Word>> readData() async {
    List<Word> _words = new List<Word>();

    String wordsCSV = await rootBundle.loadString('assets/csv/words.csv');

    List<List> words = CsvToListConverter().convert(wordsCSV);

    for (List row in words) _words.add(_createWord(List<String>.from(row)));

    return _words;
  }

  static Word _createWord(List<String> row) {
    print("Read the word '${row[0]}'");
    return new Word(
        row[0][0].toUpperCase() + row[0].substring(1), row.sublist(1));
  }
}
