import 'package:dbsample/db/functions/db_functions.dart';
import 'package:dbsample/db/models/datamodel.dart';
import 'package:dbsample/screens/dashboard/update.dart';
import 'package:flutter/material.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (context, List<StudentModel> studentList, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = studentList[index];
            return ListTile(
              leading: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          index: index,
                          name: data.name,
                          age: data.age,
                          id: data.id,
                        );
                      },
                    );
                  }),
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  if (data.id != null) {
                    deleteStudent(data.id!);
                  } else {
                    print('id not found');
                  }
                },
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: studentList.length,
        );
      },
    );
  }
}
