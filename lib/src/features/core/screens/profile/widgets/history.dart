import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> travelHistory(String currentID) async {
  final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc(currentID)
      .collection('Travel_History')
      .get();

  return snapshot.docs.map((doc) => doc.data()).toList();
}
