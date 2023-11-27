import 'package:flutter/material.dart';

class Addsite extends StatefulWidget {
  const Addsite({super.key});

  @override
  State<Addsite> createState() => _AddsiteState();
}

class _AddsiteState extends State<Addsite> {
  final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("New Site"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Project Name',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.orange))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.orange))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Address',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.orange))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'City',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.orange))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_month),
                      hintText: 'Project Started',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.orange)),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Project Value',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.orange))),
                  ),
                ),

                // TextField(
                //     controller: dateController,
                //     decoration: const InputDecoration(
                //         icon: Icon(Icons.calendar_today),
                //         labelText: "Enter Date"),
                //     readOnly: true,
                //     onTap: () async {
                //       DateTime? pickedDate = await showDatePicker(
                //         context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(2000),
                //         lastDate: DateTime.now(),
                //         builder: (BuildContext context, Widget? child) {
                //           return Theme(
                //             data: ThemeData.light().copyWith(
                //               colorScheme: ColorScheme.fromSwatch(
                //                 primarySwatch: Colors.red,
                //                 // primaryColorDark: Colors.teal,
                //                 accentColor: Colors.yellow,
                //               ),
                //               dialogBackgroundColor: Colors.white,
                //             ),
                //             child: child!,
                //           );
                //         },
                //       );

                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Client Name',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.orange))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Client Mobile number',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.orange))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
