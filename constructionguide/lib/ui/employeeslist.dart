import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/ui/addemployees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employeeslist extends StatefulWidget {
  const Employeeslist({super.key});

  @override
  State<Employeeslist> createState() => _EmployeeslistState();
}

class _EmployeeslistState extends State<Employeeslist> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetEmployeesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Employees List"),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<MainBloc, MainStates>(
          buildWhen: (previous, current) =>
              current is GetEmployeesList || current is EmployeeslistSuccess,
          builder: (context, state) {
            if (state is GetEmployeesList) {
              return const CircularProgressIndicator();
            } else if (state is EmployeeslistSuccess) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width / 1.1,
                    ),
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Image.asset("assets/images/employee.jpg"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width / 1.1,
                    ),
                    SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: state.employeeslistmodel.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, bottom: 10, right: 15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  //height: MediaQuery.of(context).size.height /
                                  // 6.2,
                                  width: MediaQuery.of(context).size.width / 4,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.orange)),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: CircleAvatar(
                                            radius: 2,
                                            child: Icon(Icons.person)),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  30,
                                            ),
                                            //Text(state.employeeslistmodel.data![index].nam),
                                            Text(state.employeeslistmodel
                                                .data![index].name
                                                .toString()),
                                            Text(state.employeeslistmodel
                                                .data![index].status
                                                .toString()),
                                            Text(state.employeeslistmodel
                                                .data![index].userId!.phone
                                                .toString()),
                                            Text(state.employeeslistmodel
                                                .data![index].gender
                                                .toString()),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30),
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            //child: Text("Item $index: $item"));
                          }),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (context, state) {},
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: FloatingActionButton(
            backgroundColor: Colors.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Addemployees()));
            },
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Add Employees",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
