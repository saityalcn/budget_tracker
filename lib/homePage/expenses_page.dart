import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpensesPageState();
  }
}

class ExpensesPageState extends State {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        child: Column(
          children: [
            buildExpensesWithDay("21.07.2022"),
            buildExpensesWithDay("20.07.2022"),
            buildExpensesWithDay("19.07.2022"),
          ],
        ),
      ),
    );
  }

  Widget buildExpensesWithDay(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$date",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10.0),
          buildExpenseListElement(),
          buildExpenseListElement(),
          buildExpenseListElement(),
        ],
      ),
    );
  }

  Widget buildExpenseListElement() {
    double price = 12.89;
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/expenseDetailPage');
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
      title: Text(
        "Migros",
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("Sait (Harcama Yapanın Adı)"),
      trailing: Text(
        "₺" + price.toString(),
        style: const TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 18.0),
      ),
    );
  }
}
