import 'package:flutter/material.dart';
import 'package:user_authentication/appwriteservices.dart';
import 'package:user_authentication/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Appwriteservices _appwriteService;

  void initState() {
    super.initState();
    _appwriteService = Appwriteservices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          GestureDetector(
            onTap: () async {
              try {
                await _appwriteService.logoutUser();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } catch (e) {
                print(e);
              }
            },

            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text("Home Screen")),
    );
  }
}