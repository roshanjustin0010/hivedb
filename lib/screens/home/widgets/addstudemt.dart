import 'package:dbsample/db/functions/db_functions.dart';
import 'package:dbsample/db/models/datamodel.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'name'),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _ageController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'age'),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              onAddcliked();
              _nameController.clear();
              _ageController.clear();
            },
            child: const Text('add student')),
      ]),
    );
  }

  Future<void> onAddcliked() async {
    final name = _nameController.text;
    final age = _ageController.text;
    if (name.isEmpty || age.isEmpty) {
      return;
    } else {
      final student = StudentModel(name: name, age: age);
      print('$name $age');
      addStudent(student);
    }
  }
}
