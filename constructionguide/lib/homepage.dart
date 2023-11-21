import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/loginpage.dart';
import 'package:constructionguide/prefmanager/prefManager.dart';
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
          const ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Employees List",
                style: TextStyle(fontSize: 20),
              )),
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
            return SizedBox(
              height: 800,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.sitelistmodel.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, left: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 120,
                          width: 60,
                          color: Colors.orange,
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 1, left: 20),
                                child: CircleAvatar(
                                    radius: 15, child: Icon(Icons.person)),
                              ),
                              const SizedBox(width: 25),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
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
                                    Text(state.sitelistmodel.data![index].status
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
