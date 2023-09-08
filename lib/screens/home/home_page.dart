import 'package:expense_app/bloc/expense_bloc.dart';
import 'package:expense_app/constants/app_constants.dart';
import 'package:expense_app/screens/add_trans/add_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            return ListView.builder(
              itemCount: state.listExpenses.length,
              itemBuilder: (context, index) {
                var currentItem = state.listExpenses[index];
                var imagePath = "";
                imagePath = AppConstants.categories.firstWhere(
                  (element) {
                    return element['id'] == currentItem.expe_cat_id;
                  },
                )['img'];
                return ListTile(
                  title: Text(currentItem.exp_title),
                  subtitle: Text(currentItem.exp_desc),
                  trailing: Text("\$ ${currentItem.exp_amt.toString()}"),
                  leading: Image.asset(imagePath),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const AddTransactionPage();
          },
        ));
      }),
    );
  }
}
