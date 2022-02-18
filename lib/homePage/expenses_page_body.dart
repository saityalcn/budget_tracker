import 'package:flutter/material.dart';

class ExpensesPageBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpensesPageBodyState();
  }
}

class ExpensesPageBodyState extends State {
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
          buildExpensesWithDayHeader(date,38.67),
          const SizedBox(height: 10.0),
          buildExpenseListElement(),
          buildExpenseListElement(),
          buildExpenseListElement(),
        ],
      ),
    );
  }

  Widget buildExpensesWithDayHeader(String date, double totalExpense){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$date",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),
        /*Text(
          "₺${totalExpense.toString()}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),*/
      ],
    );
  }
  Widget buildExpenseListElement() {
    double price = 12.89;
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/expenseDetailPage');
      },
      leading: CircleAvatar(
        child: Image.network("https://pbs.twimg.com/profile_images/1465239664802025477/W7BQLaN2_400x400.jpg"),
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
