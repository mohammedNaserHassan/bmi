class Record{
  String weight,length,date,time;
  Record({this.length,this.weight,this.date,this.time});

  toMap(){
    return {
      'time': this.time,
      'date': this.date,
      'length': this.length,
      'weight': this.weight,
    };
  }
  Record.fromMap(Map<String,dynamic> map){
    weight = map['weight'];
    length = map['length'];
    time = map['time'];
    date = map['date'];
  }
}