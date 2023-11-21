import 'package:constructionguide/bloc/mainbloc.dart';
import 'package:constructionguide/homepage.dart';
import 'package:constructionguide/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final TextEditingController usernamecontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 200,
                backgroundImage: AssetImage('assets/images/login2.jpeg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                      hintText: 'UserName',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.lock,
                        color: Colors.orange,
                      ),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 1,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              SizedBox(
                height: screenSize.height / 30,
              ),
              const Text(
                'Forget Password?',
                style: TextStyle(color: Colors.orange),
              ),
              SizedBox(
                height: screenSize.height / 30,
              ),
              MaterialButton(
                color: Colors.yellow,
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(VerifyAccount(
                    name: usernamecontroller.text,
                    password: passwordcontroller.text,
                  ));
                },
                child: BlocConsumer<MainBloc, MainStates>(
                    buildWhen: (previous, current) => current is Loading,
                    builder: (context, state) {
                      if (state is Loading) {
                        return const CircularProgressIndicator();
                      } else {
                        return const Text("Login");
                      }
                    },
                    listenWhen: (previous, current) => current is LoginSuccess,
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()));
                      } else {
                        

                        print('Error');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Signup()));
                      }
                    }),
              ),
              SizedBox(
                height: screenSize.height / 30,
              ),
              const Text("Don't Have An Account"),
              InkWell(
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.orange),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
