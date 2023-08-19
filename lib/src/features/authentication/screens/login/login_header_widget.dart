import 'package:flutter/cupertino.dart';

import '../../../../constants/images_strings.dart';
import '../../../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Image(
          image: AssetImage(tWelcomeScreenImage),
          height: size.height * 0.3,
        ),
        const SizedBox(height: 20.0),

        Text(tLoginTitle, style: TextStyle(fontFamily: 'montserrat', fontSize: 20,fontWeight: FontWeight.bold)),
        const SizedBox(height: 10.0),
        Text(tLoginSubTitle,  style: TextStyle(fontFamily: 'montserrat', fontSize: 15)),

        const SizedBox(height: 20.0),
      ],
    );
  }
}