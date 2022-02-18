import 'package:budget_tracker/homePage/expenses_page_body.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ExpensesPageState();
  }

}

class ExpensesPageState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ExpensesPageBody(),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w800),
      title: Text("Harcamalar"),
    );
  }

}