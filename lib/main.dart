import 'package:budget_tracker/addExpensePage/add_expense_page.dart';
import 'package:flutter/material.dart';
import 'expensePage/expense_page.dart';
import 'homePage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deneme',
      routes: {
        "/expenseDetailPage" : (context) => ExpensePage(),
        "/add-expense": (context) => AddExpensePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }
}
