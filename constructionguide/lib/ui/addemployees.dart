import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/ui/employeeslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Addemployees extends StatefulWidget {
  const Addemployees({super.key});

  @override
  State<Addemployees> createState() => _AddemployeesState();
}

class _AddemployeesState extends State<Addemployees> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController dailywagecontroller = TextEditingController();
  final TextEditingController overtimeamountcontroller =
      TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController districtcontroller = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();
  String dropdownvalue = 'Male';

  var items = [
    'Male',
    'Female',
  ];

  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(Categorylist());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("New Employee"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: namecontroller,
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
                  controller: addresscontroller,
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
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: 'Password',
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
                  keyboardType: TextInputType.number,
                  controller: dailywagecontroller,
                  decoration: InputDecoration(
                      hintText: 'Daliy Wage',
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
                  keyboardType: TextInputType.number,
                  controller: overtimeamountcontroller,
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
                BlocBuilder<MainBloc, MainStates>(
                    buildWhen: (previous, current) {
                  return current is CategorylistSuccess;
                }, builder: (context, state) {
                  if (state is CategorylistSuccess) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Category",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 10,
                            ),
                            DropdownButton(
                              underline: const SizedBox.shrink(),
                              // Initial Value
                              value: context.read<MainBloc>().workId,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: state.categorymodel.data!.map((items) {
                                return DropdownMenuItem(
                                  value: items.sId,
                                  child: Text(items.name!),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  print(newValue);
                                  context.read<MainBloc>().workId = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phonenumbercontroller,
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
                  controller: districtcontroller,
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
                  controller: statecontroller,
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
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      BlocProvider.of<MainBloc>(context).add(VerifyNewEmployee(
                        name: namecontroller.text,
                        gender: dropdownvalue,
                        address: addresscontroller.text,
                        password: passwordcontroller.text,
                        dailywage: dailywagecontroller.text,
                        overtimeAmount: overtimeamountcontroller.text,
                        phonenumber: phonenumbercontroller.text,
                        district: districtcontroller.text,
                        state: statecontroller.text,
                      ));
                    },
                    child: BlocConsumer<MainBloc, MainStates>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text(
                            "Add Employee",
                            style: TextStyle(fontSize: 17),
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is AddEmployeeSuccess) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Employeeslist()));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        // BlocConsumer<MainBloc, MainStates>(buildWhen: (previous, current) =>
        // ,)
        );
  }
}
