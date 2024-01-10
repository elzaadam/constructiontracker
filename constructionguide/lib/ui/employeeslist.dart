import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/homepage.dart';
import 'package:constructionguide/ui/addemployees.dart';
import 'package:constructionguide/ui/editemployees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employeeslist extends StatefulWidget {
  final String? id;
  const Employeeslist({super.key, this.id});

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
                                            backgroundColor: Colors.orange,
                                            radius: 20,
                                            child: Icon(Icons.person)),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
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
                                      // SizedBox(
                                      //   width:
                                      //       MediaQuery.of(context).size.width /
                                      //           6,
                                      // ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: PopupMenuButton(
                                          onSelected: (value) {
                                            print(value);
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              PopupMenuItem(
                                                value: "Edit",
                                                child: const Text('Edit'),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => EditEmployees(
                                                              id: state
                                                                  .employeeslistmodel
                                                                  .data?[index]
                                                                  .sId
                                                                  .toString(),
                                                              workid: state
                                                                  .employeeslistmodel
                                                                  .data![index]
                                                                  .userId
                                                                  .toString())));
                                                },
                                              ),
                                              PopupMenuItem(
                                                value: "Delete",
                                                //child: const Text('Delete'),
                                                onTap: () {
                                                  BlocProvider.of<MainBloc>(
                                                          context)
                                                      .add(DeleteEmployees(
                                                          id: state
                                                              .employeeslistmodel
                                                              .data![index]
                                                              .sId
                                                              .toString()));
                                                },
                                                child: BlocConsumer<MainBloc,
                                                    MainStates>(
                                                  builder: (context, state) {
                                                    if (state is Loading) {
                                                      return const CircularProgressIndicator();
                                                    } else {
                                                      return const Text(
                                                          "Delete");
                                                    }
                                                  },
                                                  listener: (context, state) {
                                                    if (state
                                                        is DeleteEmployeeSuccess) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const Employeeslist()));
                                                    }
                                                  },
                                                ),

                                                // ElevatedButton(
                                                //   onPressed: () {
                                                //     showDialog(
                                                //       context: context,
                                                //       builder: (ctx) =>
                                                //           AlertDialog(
                                                //         title: const Text(
                                                //             "Alert Dialog Box"),
                                                //         content: const Text(
                                                //             "You have raised a Alert Dialog Box"),
                                                //         actions: <Widget>[
                                                //           TextButton(
                                                //             onPressed: () {
                                                //               Navigator.of(
                                                //                       ctx)
                                                //                   .pop();
                                                //             },
                                                //             child: Container(
                                                //               color: Colors
                                                //                   .green,
                                                //               padding:
                                                //                   const EdgeInsets
                                                //                       .all(
                                                //                       14),
                                                //               child:
                                                //                   const Text(
                                                //                       "okay"),
                                                //             ),
                                                //           ),
                                                //         ],
                                                //       ),
                                                //     );
                                                //   },
                                                //   child: const Text(
                                                //       "Show alert Dialog box"),

                                                // child: AlertDialog(
                                                //   title: const Text(
                                                //       'Do you want do delete the employee?'),
                                                //   actions: [
                                                //     TextButton(
                                                //         child: const Text(
                                                //             'Cancel'),
                                                //         onPressed: () {
                                                //           Navigator.push(
                                                //               context,
                                                //               MaterialPageRoute(
                                                //                   builder:
                                                //                       (context) =>
                                                //                           const Employeeslist()));
                                                //         }),
                                                //     TextButton(
                                                //       child: Text('Confirm'),
                                                //       onPressed: () {
                                                //         BlocProvider.of<
                                                //                     MainBloc>(
                                                //                 context)
                                                //             .add(DeleteEmployees(
                                                //                 id: state
                                                //                     .employeeslistmodel
                                                //                     .data![
                                                //                         index]
                                                //                     .sId
                                                //                     .toString()));
                                                //       },
                                                // child: BlocConsumer<
                                                //     MainBloc,
                                                //     MainStates>(
                                                //   builder:
                                                //       (context, state) {
                                                //     if (state
                                                //         is Loading) {
                                                //       return const CircularProgressIndicator();
                                                //     } else {
                                                //       return const Text(
                                                //           "Delete");
                                                //     }
                                                //   },
                                                //   listener:
                                                //       (context, state) {
                                                //     if (state
                                                //         is DeleteEmployeeSuccess) {
                                                //       Navigator.push(
                                                //           context,
                                                //           MaterialPageRoute(
                                                //               builder:
                                                //                   (context) =>
                                                //                       const Employeeslist()));
                                                //     }
                                                //   },
                                                // ),
                                                //     )

                                                //   ],
                                                // ),
                                              ),
                                            ];
                                          },
                                        ),
                                      ),
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
