import 'package:dbsample/db/functions/db_functions.dart';
import 'package:dbsample/db/models/datamodel.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String name;
  final String age;

  TextEditingController nameupController = TextEditingController();
  TextEditingController ageupController = TextEditingController();
  final int index;
  final int? id;

  CustomDialog(
      {super.key,
      required this.index,
      required this.name,
      required this.age,
      required this.id}) {
    nameupController.text = name;
    ageupController.text = age;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Two Text Fields'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameupController,
            decoration: const InputDecoration(labelText: 'Enter value 1'),
          ),
          TextField(
            controller: ageupController,
            decoration: const InputDecoration(labelText: 'Enter value 2'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // When the "Submit" button is pressed, retrieve the values from the text fields
            String name = nameupController.text;
            String age = ageupController.text;
            int ind = index;

            // Do something with the entered values
            print('Value 1: $name');
            print('Value 2: $age');
            print(ind);
            updateStudent(ind, StudentModel(id: id, name: name, age: age));

            // Close the dialog
            Navigator.of(context).pop();
          },
          child: const Text('Submit'),
        ),
        TextButton(
          onPressed: () {
            // Close the dialog when the "Cancel" button is pressed
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
