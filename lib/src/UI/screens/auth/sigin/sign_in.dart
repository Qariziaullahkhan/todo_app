import 'package:flutter/material.dart';
import 'package:todo_app/src/UI/screens/auth/signup/sign_up.dart';
import 'package:todo_app/src/UI/screens/costomtum_field.dart';

class Sigin_Screen extends StatefulWidget {
  const Sigin_Screen({super.key});

  @override
  State<Sigin_Screen> createState() => _Sigin_ScreenState();
}

class _Sigin_ScreenState extends State<Sigin_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signin"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Costomtextfield(
                hinttext: "Email",
                labeltext: "Email",
                icon: Icons.email,
              ),
              SizedBox(
                height: 20,
              ),
              Costomtextfield(
                hinttext: "Password",
                labeltext: "Password",
                icon: Icons.lock,
                icons: Icons.visibility,
                // icons: const Icon(Icons.visibility),
                // obscuretext: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: Size(270, 57),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: Text(
                    "Login in ",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "Dont't have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => Singup_Screen()),
                            ),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
