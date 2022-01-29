import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeBodyState();
  }

}

class HomeBodyState extends State{
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }
  Widget buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Center(child: buildTotalExpenseArea(1096.76)),
          buildLastExpensesArea(),
        ],
      ),
    );
  }

  Widget buildTotalExpenseArea(double totalExpense) {
    return Column(
      children: [
        const SizedBox(
          height: 60.0,
        ),
        Text(
          "₺" + totalExpense.toString(),
          style: const TextStyle(
              color: const Color(0xFF000000),
              fontSize: 35.0,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 60.0,
        ),
      ],
    );
  }

  Widget buildLastExpensesArea() {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                print("object");
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text("Son Harcamalar", style: const TextStyle(fontSize: 15.0)),
                  const SizedBox(
                    width: 3.0,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 14.0,
                  ),
                ],
              ),
            ),
          ],
        ),
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return buildListItem();
          },
          itemCount: 4,
          shrinkWrap: true,
        )
      ],
    );
  }


  Widget buildListItem() {
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
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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