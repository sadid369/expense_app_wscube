import 'package:expense_app/utils/images_constants.dart';
import 'package:expense_app/utils/my_styles.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;

    print("widht:$mWidth, height:$mHeight");
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: mediaQueryData.size.width * 0.05,
              child: Image.asset(
                ImagesConstants.appLogoIcon,
                color: Colors.grey.shade100,
                width: mediaQueryData.size.width * 0.08,
                height: mediaQueryData.size.width * 0.08,
              ),
            ),
            Text(
              'Expenser',
              style: mediaQueryData.size.width > 600
                  ? mTextStyles34(mWeight: FontWeight.bold)
                  : mTextStyles34(mWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
