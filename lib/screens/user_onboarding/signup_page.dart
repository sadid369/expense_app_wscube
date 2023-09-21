import 'package:expense_app/app_widgets/app_rounded_button.dart';
import 'package:expense_app/models/user_model.dart';
import 'package:expense_app/screens/user_onboarding/bloc/user_bloc.dart';
import 'package:expense_app/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var monNoController = TextEditingController();
  var genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Sign Up',
            style: mTextStyles43(),
          ),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: myDecoration(mLabel: 'Email', mHint: 'Enter Email'),
          ),
          TextField(
            controller: passwordController,
            keyboardType: TextInputType.emailAddress,
            decoration: myDecoration(
                isPassword: true, mLabel: 'Password', mHint: 'EnterPassword'),
          ),
          TextField(
            controller: monNoController,
            keyboardType: TextInputType.phone,
            decoration: myDecoration(
                mLabel: 'Mobile Number', mHint: 'Enter Mobile NUmber'),
          ),
          TextField(
            controller: genderController,
            keyboardType: TextInputType.text,
            decoration: myDecoration(mLabel: 'Gender', mHint: 'Enter Gender'),
          ),
          hSpacer(),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text('User Account Created!!!')));
                Navigator.of(context).pop();
              } else if (state is UserErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.failMsg)));
              }
            },
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return AppRoundedButton(
                  onTap: () {
                    var email = emailController.text.toString();
                    var passwprd = passwordController.text.toString();
                    var mobile = monNoController.text.toString();
                    var gender = genderController.text.toString();

                    context.read<UserBloc>().add(CreateNewUserEvent(
                          newUser: UserModel(
                            email: email,
                            mobno: mobile,
                            pass: passwprd,
                            gender: gender,
                          ),
                        ));
                  },
                  title: 'Create Account');
            },
          )
        ],
      ),
    );
  }
}
