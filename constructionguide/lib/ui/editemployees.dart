import 'dart:ffi';

import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEmployees extends StatefulWidget {
  final String? id,workid;
  const EditEmployees({super.key, this.id,this.workid});

  @override
  State<EditEmployees> createState() => _EditEmployeesState();
}

class _EditEmployeesState extends State<EditEmployees> {
  String dropdownvalue = 'Male';

  var items = [
    'Male',
    'Female',
  ];
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetEmployeesList(id: widget.id,workid:widget.workid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'Name',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Gender",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    DropdownButton(
                      underline: const SizedBox.shrink(),
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'Address',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'State',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'District',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'Phone number',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'Daily wages',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              //controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'Overtime Amount',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.orange))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
          ]),
        ),
      ),
    );
  }
}
