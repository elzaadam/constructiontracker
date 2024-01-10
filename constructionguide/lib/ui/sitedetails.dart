import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/homepage.dart';
import 'package:constructionguide/ui/editsite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sitedetails extends StatefulWidget {
  final String? id, position;
  const Sitedetails({super.key, this.id, this.position});

  @override
  State<Sitedetails> createState() => _SitedetailsState();
}

class _SitedetailsState extends State<Sitedetails> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context)
        .add(GetSiteDetails(id: widget.id, position: widget.position));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Site Details"),
          backgroundColor: Colors.orange,
        ),
        body: BlocConsumer<MainBloc, MainStates>(
            buildWhen: (previous, current) =>
                current is GetSiteDetails || current is SitedetailsSuccess,
            builder: (context, state) {
              if (state is GetSiteDetails) {
                return const CircularProgressIndicator();
              } else if (state is SitedetailsSuccess) {
                return Column(
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
                              child: Image.asset("assets/images/images2.jpeg"),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Site Name - ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.sitedetailsmodel.data!.siteName
                                      .toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address - ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(state
                                      .sitedetailsmodel.data!.siteContactAddress
                                      .toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 35),
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Row(
                                children: [
                                  MaterialButton(
                                      minWidth: double.minPositive,
                                      color: Colors.orange,
                                      child: const Text('Edit'),
                                      onPressed: () {
                                        print("Id for site");
                                        print(state
                                            .sitedetailsmodel.data!.location
                                            .toString());
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditConstructionSite(
                                                      SiteName: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .siteName,
                                                      SiteLocation: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .siteLocation,
                                                      Work: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .work,
                                                      Address: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .siteContactAddress,
                                                      Phone_number: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .siteContactPhone
                                                          .toString(),
                                                      Contact_personname: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .contactPersonName,
                                                      editid: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .sId,
                                                      position: state
                                                          .sitedetailsmodel
                                                          .data!
                                                          .location
                                                          .toString(),
                                                    )));
                                        print(state
                                            .sitedetailsmodel.data!.location
                                            .toString());
                                      }),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container(
                color: Colors.white,
              );
            },
            listener: (context, state) {}));
  }
}
