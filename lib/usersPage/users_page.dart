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
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:15,
        itemBuilder: (BuildContext context, int index){
          return buildUserListItem("Ahmet Yılmaz", 123.45,"https://irmaklarmarket.com/wp-content/uploads/2016/04/Business-man-1.png");
        }
    );
  }

  Widget buildUserListItem(String title, double quantityOfExpense,String linkOfImage){
    //String expenseText = generateExpenseString(quantityOfExpense);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 2.0),
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          leading: CircleAvatar(child: Image.network(linkOfImage),backgroundColor: Colors.transparent),
          title: Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),),
          trailing: buildTrailing(quantityOfExpense),
          onTap: (){
            print(title);
          },
        ),
      ),
    );
  }

  String generateExpenseString(double expense){
    int intExpense = int.parse(expense.toString());
    print(intExpense);
    return "abc";
  }

  Widget buildTrailing(double quantityOfExpense){
    return SizedBox(
      width: 110.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("₺" + quantityOfExpense.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }


}