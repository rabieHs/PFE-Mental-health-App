// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:mental_health_app/feed/models/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksServices {
  List<Tasks>? tasks;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getTasks1(String mood) async {
    List<Tasks> _tasks;

    QuerySnapshot taskSnapshot = await _firestore
        .collection(mood)
        .doc('Tasks')
        .collection('Tasks')
        .get();
    _tasks = taskSnapshot.docs.map((doc) {
      Map<String, dynamic> _data = doc.data() as Map<String, dynamic>;
      return Tasks.fromMap(_data);
    }).toList();

    print(_tasks.first.title);
    return _tasks;
  }

  Future<List<Tasks>> saveDatalocally(String mood) async {
    List<Tasks> newTasks;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString('moodType', mood);
    final _oldTasks = _preferences.getString('tasks');
    if (_oldTasks != null) {
      print('old tasks was found');
    } else {
      print('tasks null');
    }

    List<Tasks> _tasks = await getTasks1(mood);
    //
    List<Tasks> tasks = _oldTasks != null
        ? (jsonDecode(_oldTasks) as List<dynamic>)
            .map((e) => Tasks.fromJson(e))
            .toList()
        : [];
    final savedTaskType = _preferences.getString('taskType');
    if (tasks.every((task) => task.isCompleted == true) ||
        savedTaskType != mood) {
      _preferences.remove('tasks');
      _preferences.setString('taskType', mood).then((value) {
        print('type updated');
      });
      newTasks = getRandomTasks(_tasks);
      _preferences.setString('tasks', jsonEncode(newTasks)).then((value) {
        print('new tasks added');
      });
      return newTasks;
    } else {
      return tasks;
    }
  }

  getRandomTasks(List<Tasks> _tasks) {
    List<Tasks> savingTasks = [];

    savingTasks.add(_tasks[Random().nextInt(_tasks.length)]);
    savingTasks.add(_tasks[Random().nextInt(_tasks.length)]);
    savingTasks.add(_tasks[Random().nextInt(_tasks.length)]);

    print("saving tasks:${savingTasks.length}");
    return savingTasks;
  }

  void updateTaskStatus(Tasks task, int index) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final jsonString = _prefs.getString('tasks');
    final List<Tasks> tasks = jsonString != null
        ? List<Tasks>.from(jsonDecode(jsonString).map((t) => Tasks.fromJson(t)))
        : [];
    final taskIndex = tasks.indexWhere((t) => t.title == task.title);
    print(taskIndex);
    tasks[index] = task.copyWith(isCompleted: true);
    _prefs.setString('tasks', jsonEncode(tasks));
  }
}
