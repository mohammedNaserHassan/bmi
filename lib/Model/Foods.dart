class Food{
  String name,category,calory,photo;
  Food({this.calory,this.name,this.photo,this.category});
  toMap(){
    return {
      'name': this.name,
      'category': this.category,
      'calory': this.calory,
      'photo': this.photo,
    };
  }
  Food.fromMap(Map<String,dynamic> map){
    name = map['name'];
    calory = map['calory'];
    category = map['category'];
    photo = map['photo'];
  }
}