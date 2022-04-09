class Expense {
  int? id;
  String? titleOfExpense;
  String? nameOfUser;
  double? cost;

  Expense(this.titleOfExpense, this.nameOfUser,this.cost);

  Expense.withId(this.id, this.nameOfUser, this.cost);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["titleOfExpense"] = titleOfExpense;
    map["nameOfUser"] = nameOfUser;
    map["cost"] = cost;

    return map;
  }

  Expense.fromMap(Map<String, dynamic> o) {
    id = o["id"];
    titleOfExpense = o["titleOfExpense"];
    nameOfUser = o["nameOfUser"];
    cost = o["cost"];
  }


}
