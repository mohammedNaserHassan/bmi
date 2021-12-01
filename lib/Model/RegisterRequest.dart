
class RegisterRequest{
  String name,email, password, id,rePassword;
  List<Map<String,dynamic>> foods;
  List<Map<String,dynamic>> states;
  String gender,weight,length,dateOfBirth,state;
  String nameFood ,category,photo,time;
  double calory;
  String idFood;

  RegisterRequest(
      {this.name,
      this.email,
      this.password,
      this.id,
        this.rePassword,
        this.length,
        this.weight,
        this.gender,
        this.dateOfBirth,
        this.foods,
        this.states,
      });

  toMap() { 
    return {
      'id': this.id,
      'name': this.name,
      'password': this.password,
      'rePassword': this.rePassword,
      'email': this.email,
      'gender': this.gender,
      'length': this.length,
      'weight': this.weight,
      'dateOfBirth': this.dateOfBirth,
      'states':this.states,
      'foods':this.foods
    };
  }

  RegisterRequest.fromMap(Map<String,dynamic> map) {
    dateOfBirth = map['dateOfBirth'];
    email = map['email'];
    map['foods'].forEach((element){
      if(foods!=null)
      foods.add({
        'name': this.nameFood,
        'category': this.category,
        'calory': this.calory,
        'photo': this.photo,
        'id':this.idFood
      });
    });
    gender = map['gender'];
    id = map['id'];
    length = map['length'];
    name = map['name'];
    password = map['password'];
    rePassword = map['rePassword'];
    map['states'].forEach((element) {
      if(states!=null)
      states.add({
        'lengthPerson': length,
        'weightPerson': weight,
        'dateBirth': dateOfBirth,
        'time':time
      });
    });
    weight = map['weight'];

  }
}
