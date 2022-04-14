import 'package:cubit/Domain/auth/model/login_response.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.loginResponse}) : super(key: key);

  final LoginResponse loginResponse;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.loginResponse.token.toString()),
      ),
      body: Text("Home Page"),
    );
  }
}
