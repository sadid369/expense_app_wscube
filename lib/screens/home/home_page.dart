import 'package:expense_app/bloc/expense_bloc.dart';
import 'package:expense_app/constants/app_constants.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/models/filtered_expense_model.dart';
import 'package:expense_app/screens/add_trans/add_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FilteredExpenseModel> arrDateWiseExpenses = [];
  num maxAmount = 0;
  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseLoaded) {
            filterExpensesByDate(state.listExpenses);

            return ListView.builder(
              itemCount: arrDateWiseExpenses.length,
              itemBuilder: (context, index) {
                var currentItem = arrDateWiseExpenses[index];

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${currentItem.dateName}'),
                        Text('${currentItem.totalAmt}')
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: currentItem.arrExpenses.length,
                      itemBuilder: (context, childIndex) {
                        var currentExp = currentItem.arrExpenses[childIndex];
                        var imagePath = "";
                        imagePath = AppConstants.categories.firstWhere(
                          (element) {
                            return element['id'] == currentExp.expe_cat_id;
                          },
                        )['img'];
                        return ListTile(
                          title: Text(currentExp.exp_title),
                          subtitle: Text(currentExp.exp_desc),
                          trailing: Text("\$ ${currentExp.exp_amt.toString()}"),
                          leading: Image.asset(imagePath),
                        );
                      },
                    )
                  ],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const AddTransactionPage();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void filterExpensesByDate(List<ExpenseModel> arrExpenses) {
    arrDateWiseExpenses.clear();
    List<String> arrUniqueDates = [];

    //step 1
    for (ExpenseModel eachExp in arrExpenses) {
      var eachDate = DateTime.parse(eachExp.exp_time);
      var mDate =
          "${eachDate.year}-${eachDate.month.toString().length < 2 ? "0${eachDate.month}" : "${eachDate.month}"}-${eachDate.day.toString().length < 2 ? "0${eachDate.day}" : "${eachDate.day}"}";
      if (!arrUniqueDates.contains(mDate)) {
        arrUniqueDates.add(mDate);
      }
    }
    print(arrUniqueDates);

    /// step 2
    for (String eachUniqueDate in arrUniqueDates) {
      List<ExpenseModel> eachDateExpenses = [];
      num eachDateAmt = 0;
      for (ExpenseModel eachExp in arrExpenses) {
        if (eachExp.exp_time.contains(eachUniqueDate)) {
          eachDateExpenses.add(eachExp);
          if (eachExp.exp_type == 0) {
            eachDateAmt -= eachExp.exp_amt;
          } else {
            eachDateAmt += eachExp.exp_amt;
          }
        }
      }
      print(eachDateAmt);

      if (eachDateAmt > maxAmount) {
        maxAmount = eachDateAmt;
      }
      arrDateWiseExpenses.add(FilteredExpenseModel(
          dateName: eachUniqueDate,
          totalAmt: eachDateAmt,
          arrExpenses: eachDateExpenses));
    }

    //step 3

    print(arrDateWiseExpenses.length);
  }
}
// var imagePath = "";
//                 imagePath = AppConstants.categories.firstWhere(
//                   (element) {
//                     return element['id'] == currentItem.expe_cat_id;
//                   },
//                 )['img'];



// ListView.builder(
//               itemCount: arrDateWiseExpenses.length,
//               itemBuilder: (context, index) {
//                 var currentItem = arrDateWiseExpenses[index];

//                 return Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('${currentItem.dateName}'),
//                         Text('${currentItem.totalAmt}')
//                       ],
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: currentItem.arrExpenses.length,
//                       itemBuilder: (context, childIndex) {
//                         var currentExp = currentItem.arrExpenses[childIndex];
//                         var imagePath = "";
//                         imagePath = AppConstants.categories.firstWhere(
//                           (element) {
//                             return element['id'] == currentExp.expe_cat_id;
//                           },
//                         )['img'];
//                         return ListTile(
//                           title: Text(currentExp.exp_title),
//                           subtitle: Text(currentExp.exp_desc),
//                           trailing: Text("\$ ${currentExp.exp_amt.toString()}"),
//                           leading: Image.asset(imagePath),
//                         );
//                       },
//                     )
//                   ],
//                 );
//               },
//             );



// Container(
//               width: double.infinity,
//               height: double.infinity,
//               child: SfCartesianChart(
//                 primaryXAxis: CategoryAxis(),
//                 primaryYAxis: NumericAxis(
//                     minimum: 0, maximum: maxAmount.toDouble(), interval: 1000),
//                 series: <ChartSeries<FilteredExpenseModel, String>>[
//                   ColumnSeries<FilteredExpenseModel, String>(
//                     dataSource: arrDateWiseExpenses,
//                     xValueMapper: (FilteredExpenseModel data, index) =>
//                         data.dateName,
//                     yValueMapper: (FilteredExpenseModel data, index) =>
//                         data.totalAmt.toDouble(),
//                   )
//                 ],
//               ),
//             );