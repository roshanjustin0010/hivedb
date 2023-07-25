import 'package:dbsample/db/functions/db_functions.dart';
import 'package:dbsample/screens/home/widgets/addstudemt.dart';
import 'package:dbsample/screens/home/widgets/liststudent.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hive Demo'),
        ),
        body: const Column(
          children: [AddStudent(), Expanded(child: ListStudent())],
        ),
      ),
    );
  }
}
