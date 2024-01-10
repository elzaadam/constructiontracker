import 'dart:math';

import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/loginpage.dart';
import 'package:constructionguide/prefmanager/prefManager.dart';
import 'package:constructionguide/ui/addsite.dart';
import 'package:constructionguide/ui/assigningemployees.dart';
import 'package:constructionguide/ui/employeeslist.dart';
import 'package:constructionguide/ui/sitedetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, String? id});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetSiteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("My Project", style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
          //backgroundColor: Colors.orange,
          child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 20,
                child: Icon(Icons.person),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const Text(
                "Hello Manager",
                style: TextStyle(fontSize: 25),
              ),
            ],
          )),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              "Employees List",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Employeeslist()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () async {
              await PrefManager.clearToken();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Loginpage()));
            },
          )
        ],
      )),
      body: SingleChildScrollView(
        child: BlocConsumer<MainBloc, MainStates>(
          buildWhen: (previous, current) =>
              current is GetSiteList || current is SitelistSuccess,
          builder: (context, state) {
            if (state is GetSiteList) {
              return const CircularProgressIndicator();
            } else if (state is SitelistSuccess) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width / 1.1,
                    ),
                    Container(
                      color: Colors.white,
                      //height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Image.asset("assets/images/construction3.jpg"),
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
                          itemCount: state.sitelistmodel.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 15.0, bottom: 10, right: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    //height: MediaQuery.of(context).size.height / 8,
                                    //width: MediaQuery.of(context).size.width / 4,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.orange)),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10),

                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                              ),
                                              Text(state.sitelistmodel
                                                  .data![index].siteName
                                                  .toString()),
                                              Text(state
                                                  .sitelistmodel
                                                  .data![index]
                                                  .contactPersonName
                                                  .toString()),
                                              Text(state.sitelistmodel
                                                  .data![index].siteContactPhone
                                                  .toString()),
                                              Text(state.sitelistmodel
                                                  .data![index].status
                                                  .toString()),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      30),
                                            ]),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: PopupMenuButton(
                                            shadowColor: Colors.orange,
                                            onSelected: (value) {
                                              print(value);
                                            },
                                            itemBuilder:
                                                (BuildContext context) {
                                              return [
                                                PopupMenuItem(
                                                  value: "Site details",
                                                  child: const Text(
                                                      'Site details'),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => Sitedetails(
                                                                id: state
                                                                    .sitelistmodel
                                                                    .data![
                                                                        index]
                                                                    .sId,
                                                                position: state
                                                                    .sitelistmodel
                                                                    .data![
                                                                        index]
                                                                    .location
                                                                    .toString())));
                                                    // print(state.sitelistmodel
                                                    //     .data![index].sId);
                                                    // print('GEllo');
                                                    // print(state.sitelistmodel
                                                    //     .data![index].location
                                                    //     .toString());
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  value: "Assign Employees",
                                                  child: const Text(
                                                      'Assign Employees'),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const AssigningEmployees()));
                                                  },
                                                ),
                                              ];
                                            },
                                          ),
                                        ),
                                        // onTap: (){
                                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>))
                                        // },

                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => Sitedetails(
                                        //             id: state
                                        //                 .sitelistmodel.data![index].sId,
                                        //             position: state.sitelistmodel
                                        //                 .data![index].location
                                        //                 .toString())));
                                      ],
                                    ),
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
        width: MediaQuery.of(context).size.width / 3.5,
        child: FloatingActionButton(
          backgroundColor: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Addsite()));
          },
          //mini: true,
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
                "New Site",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
