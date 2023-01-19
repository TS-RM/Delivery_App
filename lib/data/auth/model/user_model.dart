class UsersModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? image;
  int? gender;
  String? address;
  String? moneyAccount;
  int? userType;

  UsersModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.image,
    this.gender,
    this.address,
    this.moneyAccount,
    this.userType,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    password = json['password'];
    email = json['Email'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    address = json['Address'];
    lastName = json['lastName'];
    moneyAccount = json['moneyAccount'];
    userType = json['userType'];
    firstName = json['firstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['password'] = password;
    data['Email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    data['Address'] = address;
    data['lastName'] = lastName;
    data['moneyAccount'] = moneyAccount;
    data['userType'] = userType;
    data['firstName'] = firstName;
    return data;
  }
}
