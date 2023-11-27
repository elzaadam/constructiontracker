import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/loginpage.dart';
import 'package:constructionguide/prefmanager/prefManager.dart';
import 'package:constructionguide/ui/addsite.dart';
import 'package:constructionguide/ui/employeeslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

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
          const DrawerHeader(
              child: Text(
            "Hello Manager",
            style: TextStyle(fontSize: 25),
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
      body: BlocConsumer<MainBloc, MainStates>(
        buildWhen: (previous, current) =>
            current is GetSiteList || current is SitelistSuccess,
        builder: (context, state) {
          if (state is GetSiteList) {
            return const CircularProgressIndicator();
          } else if (state is SitelistSuccess) {
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 2,
                width: MediaQuery.of(context).size.width / 1.1,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.sitelistmodel.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, left: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            //height: MediaQuery.of(context).size.height / 8,
                            //width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange)),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: CircleAvatar(
                                      radius: 2, child: Icon(Icons.person)),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40,
                                      ),
                                      Text(state
                                          .sitelistmodel.data![index].siteName
                                          .toString()),
                                      Text(state.sitelistmodel.data![index]
                                          .contactPersonName
                                          .toString()),
                                      Text(state.sitelistmodel.data![index]
                                          .siteContactPhone
                                          .toString()),
                                      Text(state
                                          .sitelistmodel.data![index].status
                                          .toString()),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      );

                      //child: Text("Item $index: $item"));
                    }),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
        listener: (context, state) {},
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Addsite()));
        },
        //mini: true,
        child: const Text(
          "New Site",
        ),
      ),
    );
  }
}
