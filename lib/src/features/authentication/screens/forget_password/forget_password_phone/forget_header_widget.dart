import 'package:flutter/cupertino.dart';

import '../../../../../constants/images_strings.dart';
import '../../../../../constants/text_strings.dart';

class ForgetHeaderWidget extends StatelessWidget {
  const ForgetHeaderWidget({
    Key? key,
    required this.textAlign,
  }) : super(key: key);

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //heightBetween : 30.0
      children: [
        Image(
          image: AssetImage(tForgetPasswordImage),
          height: size.height * 0.2,
        ),
        Text("Reset Password Verification",
            style: TextStyle(fontFamily: 'montserrat', fontSize: 20),
            textAlign: TextAlign.center),
        Text("Enter the registered phone number",
            style: TextStyle(fontFamily: 'montserrat', fontSize: 15),
            textAlign: TextAlign.center),
      ],
    );
  }
}