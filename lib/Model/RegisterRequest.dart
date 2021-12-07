

class UserModel{
  String name,email,id;
  Map<String,dynamic> foods;
  Map<String,dynamic> states;
  String gender,dateOfBirth;

  UserModel(
      {this.name,
      this.email,
      this.id,
        this.gender,
        this.dateOfBirth,
        this.foods,
        this.states,
      });

  toMap(){
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'gender': this.gender,
      'dateOfBirth': this.dateOfBirth,
      'states':this.states,
      'foods':this.foods
    };
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      gender: map['gender'],
        dateOfBirth : map['dateOfBirth'],
        foods:map['foods'],
        states:map['states'],
    );
  }
}
