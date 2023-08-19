import 'package:cloud_firestore/cloud_firestore.dart';

late String phone_uid;

Future<String?> checkIfPhoneExists(String phoneNo) async {
  final result = await FirebaseFirestore.instance
      .collection('Users')
      .where('Phone_Number', isEqualTo: phoneNo)
      .get();
  //return result.docs.isNotEmpty;
  if (result.docs.isNotEmpty){
    print("PHONE UID");
    print(result.docs.first.id);
    phone_uid = result.docs.first.id;
    return result.docs.first.id;
  }
  else{
    return null;
  }
}
