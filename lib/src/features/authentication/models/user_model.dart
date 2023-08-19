import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.fullName,
    required this.phoneNo,
    required this.password,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone_Number": phoneNo,
      "Password": password,
    };
  }

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    print("inside user model user id:$data");
    return UserModel(id: document.id,
        email: data["Email"], password: data["Password"], fullName: data["FullName"], phoneNo: data["Phone_Number"]);
  }
}
