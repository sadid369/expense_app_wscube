import 'package:expense_app/raf/pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // late Color color;
  // void colorChanger(Brightness brightness) {
  //   if (brightness == Brightness.dark) {
  //     color = Colors.black;
  //     print("color : $brightness");
  //     setState(() {});
  //   } else {
  //     color = Colors.white;

  //     print("color : $brightness");
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // print('build');
    // var mediaQ = MediaQuery.of(context).platformBrightness;
    // var isDark = mediaQ.platformBrightness;
    // var provider = Provider.of<Pro>(context, listen: false);
    // color = Colors.white;
    // print("Build $isDark");
    var themeData = Theme.of(context);
    print("theme data ${themeData.brightness}");
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Container(
            height: 200,
            width: 200,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<Pro>().change();
                // colorChanger(isDark);
              },
              child: Text(
                  themeData.brightness == Brightness.dark ? 'Dark' : "Light"))
        ]),
      ),
    );
  }
}
