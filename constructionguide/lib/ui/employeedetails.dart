import 'package:flutter/material.dart';

class Employeedetails extends StatefulWidget {
  final String? id;
  const Employeedetails({super.key, this.id});

  @override
  State<Employeedetails> createState() => _EmployeedetailsState();
}

class _EmployeedetailsState extends State<Employeedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 150,
        width: 75,
        color: Colors.blue,
      ),
    );
  }
}
