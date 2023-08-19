import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:tapnroute/firebase_options.dart';
import 'package:tapnroute/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:tapnroute/src/repository/authentication_repository/exceptions/authentication_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //textTheme: TextTheme(displayMedium: GoogleFonts.montserrat(color: Colors.black87)),
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const Scaffold(body: Center(child: CircularProgressIndicator())),
      //home: WelcomeScreen(),
    );
  }
}


