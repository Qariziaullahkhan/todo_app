import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/UI/screens/auth/sigin/sign_in.dart';
import 'package:todo_app/src/UI/screens/costomtum_field.dart';
import 'package:todo_app/src/UI/screens/homepage.dart';

class Singup_Screen extends StatefulWidget {
  const Singup_Screen({super.key});

  @override
  State<Singup_Screen> createState() => _Singup_ScreenState();
}

class _Singup_ScreenState extends State<Singup_Screen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/zia_11zon.jpg"),
                radius: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Costomtextfield(
                controller: namecontroller,
                labeltext: "Name",
                hinttext: "Name",
                icon: Icons.person,
              ),
              SizedBox(
                height: 20,
              ),
              Costomtextfield(
                controller: emailcontroller,
                labeltext: "Email",
                hinttext: "Email",
                icon: Icons.email,
              ),
              SizedBox(
                height: 20,
              ),
              Costomtextfield(
                controller: Phonecontroller,
                labeltext: "Phone number",
                hinttext: "phone number",
                maximum: TextInputType.number,
                phonelength: 11,
                icon: Icons.call,
              ),
              SizedBox(
                height: 20,
              ),
              Costomtextfield(
                controller: passwordcontroller,
                labeltext: "Password",
                hinttext: ":Password",
                obscuretext: true,
                icon: Icons.lock,
                icons: Icons.visibility,
              ),
              SizedBox(
                height: 20,
              ),
              Costomtextfield(
                controller: passwordcontroller,
                labeltext: "confirm Password",
                hinttext: "confirm password",
                obscuretext: true,
                icon: Icons.lock,
                icons: Icons.visibility,
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
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    FirebaseFirestore store = FirebaseFirestore.instance;

                    auth
                        .createUserWithEmailAndPassword(
                      email: emailcontroller.text.trim(),
                      password: passwordcontroller.text.trim(),
                    )
                        .then((value) async {
                      await store.collection("user").add({
                        "Name": namecontroller.text,
                        "Email": emailcontroller.text,
                        "Phone": Phonecontroller.text,
                        "Password": passwordcontroller.text,
                      });
                      print("this is valid");
                    }).onError((error, stackTrace) {
                      print("$error");
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => HomeScreen())));
                  },
                  child: Text(
                    "Sign up ",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(MaterialPageRoute(
                              builder: ((context) => Sigin_Screen())));
                        },
                        child: Text(
                          "Login in",
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
