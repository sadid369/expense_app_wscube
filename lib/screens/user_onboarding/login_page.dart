import 'package:expense_app/app_widgets/app_rounded_button.dart';
import 'package:expense_app/constants/color_constants.dart';
import 'package:expense_app/constants/images_constants.dart';
import 'package:expense_app/screens/home/home_page.dart';
import 'package:expense_app/screens/user_onboarding/bloc/user_bloc.dart';
import 'package:expense_app/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    var mOrientaion = mediaQueryData.orientation;
    print("MQWidth: $mWidth" + "MQHeight: $mHeight");
    return Scaffold(
      // backgroundColor: ColorConstants.greyColor,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: mOrientaion == Orientation.portrait
            ? portraitUI(mWidth, mHeight)
            : landScapeUI(mWidth, mHeight),
      ),
    );
  }

  Widget mainUI(
    double mWidth,
    double mHeight,
  ) {
    return mHeight < 334
        ? SingleChildScrollView(child: mainSubUI(mWidth, mHeight))
        : mainSubUI(mWidth, mHeight);
  }

  Widget portraitUI(double mWidth, double mHeight) {
    return mainUI(mWidth, mHeight);
  }

  Widget mainSubUI(double mWidth, double mHeight) {
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
        SizedBox(
          width: mWidth * 0.3,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Welcome, Back!!',
              style: mTextStyles25(
                mWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        hSpacer(),
        TextField(
          controller: emailController,
          decoration: myDecoration(
            mLabel: 'Email',
            mHint: 'Enter Your Email',
            mPrefixIcon: Icons.email_outlined,
          ),
        ),
        hSpacer(),
        TextField(
          controller: passwordController,
          obscureText: true,
          obscuringCharacter: "*",
          decoration: myDecoration(
            mLabel: 'Password',
            mHint: 'Enter Your Password',
            mPrefixIcon: Icons.password_outlined,
          ),
        ),
        hSpacer(mHeight: 16),
        BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('User Logged-in Successfully')));
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            } else if (state is UserErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.failMsg)));
            }
          },
          builder: (context, state) {
            return AppRoundedButton(
              onTap: () {
                var email = emailController.text.toString();
                var pass = passwordController.text.toString();
                context
                    .read<UserBloc>()
                    .add(LoginUserEvent(uname: email, pass: pass));
              },
              title: 'Login',
            );
          },
        )
      ],
    );
  }

  Widget landScapeUI(double mWidth, double mHeight) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: mHeight * 0.08,
            child: Image.asset(
              ImagesConstants.appLogoIcon,
              color: Colors.grey.shade100,
              width: mHeight * 0.075,
              height: mHeight * 0.075,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: LayoutBuilder(builder: (context, constrain) {
            var mWidth = constrain.maxWidth;
            print(mWidth);
            return mainUI(constrain.maxWidth, constrain.maxHeight);
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
}
