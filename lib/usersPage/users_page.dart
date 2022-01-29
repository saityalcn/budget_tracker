import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UsersPageState();
  }
}

class UsersPageState extends State{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Users"),
      ],
    );
  }
}