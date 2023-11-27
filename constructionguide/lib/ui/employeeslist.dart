import 'package:constructionguide/bloc/mainbloc.dart';
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
      body: BlocConsumer<MainBloc, MainStates>(
        buildWhen: (previous, current) =>
            current is GetEmployeesList || current is EmployeeslistSuccess,
        builder: (context, state) {
          if (state is GetEmployeesList) {
            return const CircularProgressIndicator();
          } else if (state is EmployeeslistSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 2,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.employeeslistmodel.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, left: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 1, left: 20),
                                child: CircleAvatar(
                                    radius: 2, child: Icon(Icons.person)),
                              ),
                              const SizedBox(width: 45),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    //Text(state.employeeslistmodel.data![index].nam),
                                    Text(state
                                        .employeeslistmodel.data![index].name
                                        .toString()),
                                    Text(state
                                        .employeeslistmodel.data![index].status
                                        .toString()),
                                    Text(state.employeeslistmodel.data![index]
                                        .userId!.phone
                                        .toString()),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                    );
                    //child: Text("Item $index: $item"));
                  }),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
