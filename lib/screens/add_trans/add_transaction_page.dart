import 'dart:math';

import 'package:expense_app/app_widgets/app_rounded_button.dart';
import 'package:expense_app/bloc/expense_bloc.dart';
import 'package:expense_app/constants/app_constants.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amtController = TextEditingController();
  var selectedCatIndex = -1;
  var listCatType = ['Debit', "Credit"];
  var selectedTeansType = "Debit";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
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
                  controller: amtController,
                  decoration: myDecoration(
                      mLabel: 'Amount', mHint: "Enter Amount here")),
              hSpacer(),
              AppRoundedButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        padding: EdgeInsets.all(11),
                        child: GridView.builder(
                          itemCount: AppConstants.categories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                selectedCatIndex = index;
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      AppConstants.categories[index]['img'],
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Text(AppConstants.categories[index]['name'])
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                title: 'Choose Category',
                mWidget: selectedCatIndex >= 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppConstants.categories[selectedCatIndex]['img'],
                            width: 30,
                            height: 30,
                          ),
                          Text(
                              "  - ${AppConstants.categories[selectedCatIndex]['name']}",
                              style: mTextStyles16(
                                fontColor: Colors.white,
                              ))
                        ],
                      )
                    : null,
              ),
              hSpacer(),
              DropdownButton(
                items: listCatType
                    .map((e) => DropdownMenuItem(
                          child: Text(e.toString()),
                          value: e,
                        ))
                    .toList(),
                value: selectedTeansType,
                onChanged: (value) {
                  selectedTeansType = value!;
                  setState(() {});
                },
              ),
              hSpacer(),
              AppRoundedButton(
                  onTap: () {
                    context.read<ExpenseBloc>().add(AddExpenseEvent(
                            newExpense: ExpenseModel(
                          u_id: 1,
                          exp_title: titleController.text.toString(),
                          exp_desc: descController.text.toString(),
                          exp_amt: double.parse(amtController.text.toString()),
                          exp_bal: 0,
                          exp_type: selectedTeansType == "Debit" ? 0 : 1,
                          expe_cat_id: AppConstants.categories[selectedCatIndex]
                              ['id'],
                          exp_time: DateTime.now().toString(),
                        )));

                    Navigator.pop(context);
                  },
                  title: "Add Transaction"),
            ],
          ),
        ),
      ),
    );
  }
}
