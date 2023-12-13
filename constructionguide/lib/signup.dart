import 'package:constructionguide/loginpage.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool? checkedvalue = false;
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
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
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the first name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the last name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Email Id',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.length > 10) {
                    return 'Please enter the phone number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.lock),
                      suffixIconColor: Colors.orange,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid password!';
                    }
                    return null;
                  }),
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
            Container(
              height: screenSize.height / 20,
              width: screenSize.width * 0.95,
              color: Colors.white,
              child: ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate();
                    if (!isValid!) {
                      return;
                    }
                    _formKey.currentState?.save();

                    //const Loginpage();
                  },
                  child: const Text("Submit",
                      style: TextStyle(color: Colors.orange))),
            ),
          ]),
        ),
      ),
    );
  }
}
