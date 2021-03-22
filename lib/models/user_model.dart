import 'package:lapointeconsultingllc/assets/constants.dart';

class UserModel {
  int id;
  String name;
  String email;
  String password;

  UserModel({this.id, this.name, this.email, this.password});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map[Constants.id],
      name: map[Constants.name],
      email: map[Constants.email],
      password: map[Constants.password],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Constants.name : name,
      Constants.email : email,
      Constants.password : password,
    };
  }
}