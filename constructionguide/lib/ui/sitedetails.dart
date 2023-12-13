import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sitedetails extends StatefulWidget {
  final String? id;
  const Sitedetails({super.key, this.id});

  @override
  State<Sitedetails> createState() => _SitedetailsState();
}

class _SitedetailsState extends State<Sitedetails> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetSiteDetails(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<MainBloc, MainStates>(
            buildWhen: (previous, current) =>
                current is GetSiteDetails || current is SitedetailsSuccess,
            builder: (context, state) {
              if (state is GetSiteDetails) {
                return const CircularProgressIndicator();
              } else if (state is SitedetailsSuccess) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 1.1,
                                child:
                                    Image.asset("assets/images/images2.jpeg"),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "ID - ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.sitedetailsmodel.data!.sId
                                      .toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Site Location - ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.sitedetailsmodel.data!.siteLocation
                                      .toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Contact Person Name - ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(state
                                      .sitedetailsmodel.data!.contactPersonName
                                      .toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Phone number - ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(state
                                      .sitedetailsmodel.data!.siteContactPhone
                                      .toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Status - ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.sitedetailsmodel.data!.status
                                      .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container(
                color: Colors.white,
              );
            },
            listener: (context, state) {}));
  }
}
