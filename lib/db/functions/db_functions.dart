import 'package:dbsample/db/models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final id = await studentDB.add(value);
  value.id = id;
  print(id);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  print(value.toString());
}

Future<void> getAllStudents() async {
  print('inside getall');
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.delete(id);
  getAllStudents();
}

Future<void> updateStudent(int index, StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.putAt(index, value);
  getAllStudents();
}
