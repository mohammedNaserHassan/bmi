class Food{
  String name,category,calory,photo,unit;
  Food({this.calory,this.name,this.photo,this.category,this.unit});
  toMap(){
    return {
      'name': this.name,
      'category': this.category,
      'calory': this.calory,
      'photo': this.photo,
      'unit': this.unit,
    };
  }
  Food.fromMap(Map<String,dynamic> map){
    name = map['name'];
    calory = map['calory'];
    category = map['category'];
    photo = map['photo'];
    unit = map['unit'];
  }
}