import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapnroute/src/features/authentication/screens/login/login_screen.dart';
import 'package:tapnroute/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:tapnroute/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:tapnroute/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/singup_email_password_failure.dart';


import '../../../features/core/screens/admin/dashboard/admin_dashboard.dart';
import '../../user_repository/fetch_id.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  var _userAuthenticated = 'false';
  late var UniqueID;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid phone-number') {
          Get.snackbar('error', 'provided phone number is invalid');
        } else {
          Get.snackbar('error', 'something went wrong');
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }


  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(String email,
      String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SingUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SingUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      print('email:  ${email}');
      print('password:  ${password}');
      /*  await FirebaseAuth.instance.signInWithEmailAndPassword*/
      // await _auth.signInWithEmailAndPassword(email: '+919108245860', password: password);
      List<String> userIds = [];
      DocumentReference <Map<String, dynamic>> userObj;

      final _db = FirebaseFirestore.instance;
      await _db.collection("Users").get().then(
            (snapshot) =>
            snapshot.docs.forEach((element) {
              print('inside for loop');
              print(element.reference);
              print(element.reference.path.toString());
              _db.doc(element.reference.path).get().then(
                      (DocumentSnapshot doc) async {
                    final data = doc.data() as Map<String, dynamic>;
                    try {
                      if (data.containsKey('Email') && data['Email'] == email &&
                          data.containsKey('Password') &&
                          data['Password'] == password) {
                        _userAuthenticated = 'true';
                        print('User email/password valid');
                        print('Logged in ID: $data');
                        UniqueID = element.id;
                        print('There it is: $UniqueID');
                        print("Success");
                        print("from fetch ID");
                        return
                          Get.offAll(() => const Dashboard());
                      } else
                        print("Failed");
                    }
                    catch (e) {
                      print('Exception while login');
                    }
                  });
            }),
      );

      if (_userAuthenticated == 'false') {
        print("Failed");
        //   Get.to(()=> Dashboard());
      } else {
        print("Success");
        //  Get.to(()=> LoginScreen());

      }
    }

    on FirebaseAuthException

    catch (e) {
      if (e.code == 'user-not-found') {
        print('no user found');
      } else if (e.code == 'invalid-password') {
        print('entered invalid password');
      }
    }
  }

  Future<void> logout() async =>
      await _auth.signOut
        ();

  Future<void> adminCredential(String adminID, String password) async {

    List<String> userIds = [];
    DocumentReference <Map<String, dynamic>> userObj;

    final _db = FirebaseFirestore.instance;
    await _db.collection("Admin").get().then((snapshot) =>
        snapshot.docs.forEach((element) {
          print("inside loop");
          print("Admin $adminID");
          print("Password $password");
          _db.doc(element.reference.path).get().then((DocumentSnapshot doc) async{
            final data = doc.data() as Map<String, dynamic>;
            print("Data $data");
            try{
              if (data.containsKey('Admin_ID') && data['Admin_ID'] == adminID &&
                  data.containsKey('Password') &&
                  data['Password'] == password){
                _userAuthenticated = 'true';

                print('User email/password valid');
                Get.to(() => AdminDashboard());
              }
              else {
                print("Error");
              }
            }
            catch (e){
              Get.snackbar("Error", e.toString());
            }
          });
        }));
  }

  Future<void> adminDash(String startLocation, String endLocation, String date) async{

  List<String> userIds = [];
  final _db = FirebaseFirestore.instance;

  await _db.collection("Users").get().then((snapshot) =>
  snapshot.docs.forEach((element) {
    try{
    }
    catch(e){
      print(e);
    }
  }));

  }


}
