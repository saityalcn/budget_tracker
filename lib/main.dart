import 'package:budget_tracker/addExpensePage/add_expense_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'expensePage/expense_page.dart';
import 'expensesPage/expenses_page.dart';
import 'groupsPage/groups_page.dart';
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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('de', 'DE'),
        Locale('en', 'US'),
        Locale('tr', 'TR'),
      ],
      locale: Locale('tr'),
      title: 'Deneme',
      routes: {
        "/home": (context) => HomeScreen(),
        "/expenses": (context) => ExpensesPage(),
        "/expenseDetailPage" : (context) => ExpensePage(),
        "/add-expense": (context) => AddExpensePage(),
        "/groups-page": (context) => GroupsPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: GroupsPage(),
    );
  }
}
