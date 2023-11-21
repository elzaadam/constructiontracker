import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool? checkedvalue = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80, left: 50),
            child: CircleAvatar(
              radius: 125,
              backgroundImage: AssetImage('assets/images/signin.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Email Id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: const Icon(Icons.lock),
                  suffixIconColor: Colors.orange,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            height: screenSize.height / 80,
          ),
          Row(
            children: [
              Checkbox(
                  activeColor: Colors.orange,
                  value: checkedvalue,
                  onChanged: (newvalue) {
                    setState(() {
                      checkedvalue = newvalue;
                    });
                  }),
              const Text(
                "By Signing Up, You Are Agree To Our Terms & Privacy Policy",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          SizedBox(
            height: screenSize.height / 80,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                height: screenSize.height / 20,
                width: screenSize.width * 0.95,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
