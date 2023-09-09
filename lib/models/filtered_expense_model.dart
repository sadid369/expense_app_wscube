// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_app/models/expense_model.dart';

class FilteredExpenseModel {
  final String dateName;
  final num totalAmt;
  final List<ExpenseModel> arrExpenses;
  FilteredExpenseModel({
    required this.dateName,
    required this.totalAmt,
    required this.arrExpenses,
  });
}
