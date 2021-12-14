class Meal{
  String name,amount,date,time;
  Meal({this.name,this.amount,this.date,this.time});

  toMap(){
    return {
      'time': this.time,
      'date': this.date,
      'name': this.name,
      'amount': this.amount,
    };
  }
  Meal.fromMap(Map<String,dynamic> map){
    time = map['time'];
    date = map['date'];
    name = map['name'];
    amount = map['amount'];
  }
}