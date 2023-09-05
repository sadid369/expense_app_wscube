import 'package:expense_app/utils/my_styles.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration:
                myDecoration(mLabel: 'Title', mHint: "Enter Title here"),
          ),
          hSpacer(),
          TextField(
            controller: descController,
            decoration: myDecoration(
                mLabel: 'Description', mHint: "Enter Description here"),
          ),
          hSpacer(),
          TextField(
              keyboardType: TextInputType.number,
              controller: titleController,
              decoration:
                  myDecoration(mLabel: 'Amount', mHint: "Enter Amount here")),
          hSpacer(),
        ],
      ),
    );
  }
}
