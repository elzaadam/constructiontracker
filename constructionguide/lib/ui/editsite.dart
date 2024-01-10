import 'dart:ffi';

import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class EditConstructionSite extends StatefulWidget {
  final String? editid,
      SiteName,
      SiteLocation,
      Work,
      Address,
      Contact_personname,
      Phone_number,
      position;

  const EditConstructionSite(
      {super.key,
      this.editid,
      this.SiteName,
      this.SiteLocation,
      this.Work,
      this.Address,
      this.Phone_number,
      this.Contact_personname,
      this.position});

  @override
  State<EditConstructionSite> createState() => _EditConstructionSiteState();
}

class _EditConstructionSiteState extends State<EditConstructionSite> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController valuecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController contactpersonnamecontroller =
      TextEditingController();

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

  //final TextEditingController location_lat_loncontroller =
  //TextEditingController();
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetSiteDetails(id: widget.editid));
    print("hello");
    print(widget.position.toString());
    namecontroller.text = widget.SiteName.toString();
    locationcontroller.text = widget.SiteLocation.toString();
    valuecontroller.text = widget.Work.toString();
    addresscontroller.text = widget.Address.toString();
    phonenumbercontroller.text = widget.Phone_number.toString();
    contactpersonnamecontroller.text = widget.Contact_personname.toString();
    //location_lat_lon.text = widget.latitude.toString();
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Edit Site Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
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
              TextFormField(
                keyboardType: TextInputType.name,
                controller: locationcontroller,
                decoration: InputDecoration(
                    hintText: 'Location',
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
              TextFormField(
                keyboardType: TextInputType.name,
                controller: valuecontroller,
                decoration: InputDecoration(
                    hintText: 'Work',
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
              TextFormField(
                keyboardType: TextInputType.name,
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
                height: MediaQuery.of(context).size.height / 40,
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
                height: MediaQuery.of(context).size.height / 40,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: contactpersonnamecontroller,
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
                    "Do you want to set your current location \nas your site location ",
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
                height: MediaQuery.of(context).size.height / 20,
              ),
              MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.orange,
                  onPressed: () {
                    BlocProvider.of<MainBloc>(context).add(VerifyEdittedSite(
                      siteName: namecontroller.text,
                      siteLocation: locationcontroller.text,
                      work: valuecontroller.text,
                      siteContactAddress: addresscontroller.text,
                      siteContactPhone: phonenumbercontroller.text,
                      contactPersonName: contactpersonnamecontroller.text,
                      lat: _currentPosition!.latitude.toString(),
                      lon: _currentPosition!.longitude.toString(),
                      id: widget.editid,
                    ));
                  },
                  child: BlocConsumer<MainBloc, MainStates>(
                      builder: (context, state) {
                    if (state is EditSiteloading) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Text("Confirm");
                    }
                  }, listener: (context, state) {
                    if (state is EdittingSiteSuccess) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()));
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
