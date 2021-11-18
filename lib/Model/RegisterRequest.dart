class RegisterRequest {
  String name,email, password, id,rePassword;
  String gender,weight,length,dateOfBirth;

  RegisterRequest(
      {this.name,
      this.email,
      this.password,
      this.id,
        this.rePassword,
        this.length,
        this.weight,
        this.gender,
        this.dateOfBirth
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
    };
  }

  RegisterRequest.fromMap(Map map) {
    this.id = map['id'];
    this.email = map['email'];
    this.rePassword = map['rePassword'];
    this.password = map['password'];
    this.name = map['name'];
    this.gender = map['gender'];
    this.length = map['length'];
    this.weight = map['weight'];
    this.dateOfBirth = map['dateOfBirth'];
  }
}
