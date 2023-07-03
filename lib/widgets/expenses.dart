import 'package:flutter/material.dart';
import 'package:my_expenses/models/expense.dart';
import 'package:my_expenses/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Food',
      amount: 50,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Cigarette',
      amount: 18,
      date: DateTime.now(),
      category: Category.other,
    ),
    Expense(
      title: 'Movie',
      amount: 200,
      date: DateTime.now(),
      category: Category.movie,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(
              expenses: registeredExpenses,
            ),
          )
        ],
      ),
    );
  }
}
