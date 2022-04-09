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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Center(child: buildTotalExpenseArea(1096.76)),
            buildLastExpensesArea(),
          ],
        ),
      ),
    );
  }

  Widget buildTotalExpenseArea(double totalExpense) {
    return Column(
      children: [
        const SizedBox(
          height: 80.0,
        ),
        Text(
          "₺" + totalExpense.toString(),
          style: const TextStyle(
              color: const Color(0xFF000000),
              fontSize: 35.0,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 80.0,
        ),
      ],
    );
  }

  Widget buildLastExpensesArea() {
    int itemsLength = 6;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Son Harcamalar", style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w800,color: Colors.black)),
              const SizedBox(
                width: 3.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/expenses");
                },
                child: Row(
                  children: const [
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("Tümü", style: const TextStyle(fontSize: 15.0,color: Colors.black54)),
                    SizedBox(
                      width: 3.0,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 14.0,
                        color: Colors.black54
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return buildListItem("Lorem Ipsum", "Lorem Ipsum");
            },
            itemCount: (itemsLength < 5) ? itemsLength : 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        )
      ],
    );
  }


  Widget buildListItem(String title, String nameOfExpenser) {
    double price = 12.89;
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/expenseDetailPage');
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(nameOfExpenser),
      trailing: Text(
        "\$" + price.toString(),
        style: const TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 18.0),
      ),
    );
  }

}