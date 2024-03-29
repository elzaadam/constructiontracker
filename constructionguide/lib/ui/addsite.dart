import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class Addsite extends StatefulWidget {
  const Addsite({super.key});

  @override
  State<Addsite> createState() => _AddsiteState();
}

class _AddsiteState extends State<Addsite> {
  final TextEditingController projectnamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController valuecontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController clientname = TextEditingController();
  final TextEditingController location = TextEditingController();
  bool? checkedValue = false;
  Position? _currentPosition;
  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentPosition = position;
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("New Site"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                TextFormField(
                  controller: projectnamecontroller,
                  decoration: InputDecoration(
                      hintText: 'Project Name',
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
                  controller: citycontroller,
                  decoration: InputDecoration(
                      hintText: 'City',
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
                    controller: dateController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_month),
                      hintText: 'Project Started',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.orange)),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.fromSwatch(
                                primarySwatch: Colors.orange,
                                // primaryColorDark: Colors.teal,
                                accentColor: Colors.yellow,
                              ),
                              dialogBackgroundColor: Colors.white,
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat("yyyy - MM - dd").format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      } else {
                        print("Date not selected");
                      }
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextFormField(
                  controller: valuecontroller,
                  decoration: InputDecoration(
                      hintText: 'Project Value',
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
                  controller: clientname,
                  decoration: InputDecoration(
                      hintText: 'Client Name',
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phonenumbercontroller,
                  decoration: InputDecoration(
                      hintText: 'Client Mobile number',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.orange))),
                  validator: (value) {
                    if (value!.length > 10) {
                      return 'Please enter the phone number';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.orange,
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue;
                          });
                        }),
                    const Text(
                      "Set your current location as your site location ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),

                checkedValue != false
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            _currentPosition == null
                                ? const SizedBox.shrink()
                                : Text(_currentPosition!.latitude.toString()),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2),
                            _currentPosition == null
                                ? const SizedBox.shrink()
                                : Text(_currentPosition!.longitude.toString()),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.orange,
                  onPressed: () {
                    //print("hello");
                    //print(_currentPosition!.latitude.toString());
                    BlocProvider.of<MainBloc>(context).add(VerifyNewSite(
                      siteName: projectnamecontroller.text,
                      //password: passwordcontroller,
                      work: valuecontroller.text,
                      siteLocation: addresscontroller.text,
                      siteContactAddress: citycontroller.text,
                      siteContactPhone: phonenumbercontroller.text,
                      contactPersonName: clientname.text,
                      lat: _currentPosition!.latitude.toString(),
                      lon: _currentPosition!.longitude.toString(),
                    ));
                  },
                  child: BlocConsumer<MainBloc, MainStates>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return const CircularProgressIndicator();
                      } else {
                        return const Text("Add Site");
                      }
                    },
                    listener: (context, state) {
                      if (state is AddSiteSuccess) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()));
                      }
                    },
                  ),
                ),

                //child: const Text("ADD SITE"))
              ],
            ),
          ),
        ));
  }
}
