
import 'package:flutter/material.dart';
import 'package:user_authentication/appwriteservices.dart';
import 'package:user_authentication/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Appwriteservices _appwriteService;

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appwriteService = Appwriteservices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlue),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              SizedBox(height: 35),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                  onPressed: () async {
                    if (namecontroller.text.isNotEmpty &&
                        emailcontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty) {
                      try {
                        await _appwriteService.registerUser(
                          emailcontroller.text,
                          passwordcontroller.text,
                          namecontroller.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                        namecontroller.clear();
                        emailcontroller.clear();
                        passwordcontroller.clear();
                      } catch (e) {
                        print('Error adding user: $e');
                      }
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}