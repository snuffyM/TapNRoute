import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionKey extends StatefulWidget {
  const SessionKey({Key? key}) : super(key: key);

  @override
  State<SessionKey> createState() => _SessionKeyState();
}

class _SessionKeyState extends State<SessionKey> {
  late String email;
  @override
  void initState(){
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    final userId = currentUser?.uid;

    getUserDataAndSaveInSession(userId!).then((_) async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        email = prefs.getString('email')!;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold();
  }

  Future <void> getUserDataAndSaveInSession(String userId) async {
    try{
      final userDoc = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
      final email = userDoc.data()!['Email'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
    }catch(e){
      print("");
    }
  }
}
