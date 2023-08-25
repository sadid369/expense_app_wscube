import 'package:expense_app/app_widgets/app_rounded_button.dart';
import 'package:expense_app/color_constants.dart';
import 'package:expense_app/screens/utils/images_constants.dart';
import 'package:expense_app/screens/utils/my_styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    var mOrientaion = mediaQueryData.orientation;
    return Scaffold(
      // backgroundColor: ColorConstants.greyColor,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: mOrientaion == Orientation.portrait
            ? portraitUI(mWidth)
            : landScapeUI(mWidth),
      ),
    );
  }
}

Widget mainUI(double mWidth, bool isLandscape) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: Colors.black,
        radius: mWidth * 0.08,
        child: Image.asset(
          ImagesConstants.appLogoIcon,
          color: Colors.grey.shade100,
          width: mWidth * 0.075,
          height: mWidth * 0.075,
        ),
      ),
      hSpacer(mHeight: 16),
      Text(
        'Welcome, Back!!',
        style: mTextStyles25(
          mWeight: FontWeight.bold,
        ),
      ),
      hSpacer(),
      TextField(
        decoration: myDecoration(
          mLabel: 'Email',
          mHint: 'Enter Your Email',
          mPrefixIcon: Icons.email_outlined,
        ),
      ),
      hSpacer(),
      TextField(
        obscureText: true,
        obscuringCharacter: "*",
        decoration: myDecoration(
          mLabel: 'Password',
          mHint: 'Enter Your Password',
          mPrefixIcon: Icons.password_outlined,
        ),
      ),
      hSpacer(mHeight: 16),
      AppRoundedButton(
        onTap: () {},
        title: 'Login',
      )
    ],
  );
}

Widget portraitUI(double mWeight) {
  return mainUI(mWeight, false);
}

Widget landScapeUI(double mWidth) {
  return Row(
    children: [
      Expanded(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: mWidth * 0.08,
          child: Image.asset(
            ImagesConstants.appLogoIcon,
            color: Colors.grey.shade100,
            width: mWidth * 0.075,
            height: mWidth * 0.075,
          ),
        ),
      ),
      Expanded(
        child: LayoutBuilder(builder: (context, constrain) {
          return mainUI(constrain.maxWidth, true);
        }),
      ),
    ],
  );
}



// Widget mainUI(double mWidth, bool isLandscape) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       CircleAvatar(
//         backgroundColor: Colors.black,
//         radius: mWidth * 0.08,
//         child: Image.asset(
//           ImagesConstants.appLogoIcon,
//           color: Colors.grey.shade100,
//           width: mWidth * 0.075,
//           height: mWidth * 0.075,
//         ),
//       ),
//       hSpacer(mHeight: 16),
//       Text(
//         'Welcome, Back!!',
//         style: mTextStyles25(
//           mWeight: FontWeight.bold,
//         ),
//       ),
//       hSpacer(),
//       isLandscape
//           ? SizedBox(
//               height: 200,
//               width: double.infinity,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: myDecoration(
//                         mLabel: 'Email',
//                         mHint: 'Enter Your Email',
//                         mPrefixIcon: Icons.email_outlined,
//                       ),
//                     ),
//                   ),
//                   wSpacer(),
//                   Expanded(
//                     child: TextField(
//                       obscureText: true,
//                       obscuringCharacter: "*",
//                       decoration: myDecoration(
//                         mLabel: 'Password',
//                         mHint: 'Enter Your Password',
//                         mPrefixIcon: Icons.password_outlined,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           : Column(
//               children: [
//                 TextField(
//                   decoration: myDecoration(
//                     mLabel: 'Email',
//                     mHint: 'Enter Your Email',
//                     mPrefixIcon: Icons.email_outlined,
//                   ),
//                 ),
//                 hSpacer(),
//                 TextField(
//                   obscureText: true,
//                   obscuringCharacter: "*",
//                   decoration: myDecoration(
//                     mLabel: 'Password',
//                     mHint: 'Enter Your Password',
//                     mPrefixIcon: Icons.password_outlined,
//                   ),
//                 ),
//               ],
//             ),
//       hSpacer(mHeight: 16),
//       AppRoundedButton(
//         onTap: () {},
//         title: 'Login',
//       )
//     ],
//   );
// }
