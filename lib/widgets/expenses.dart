import 'package:flutter/material.dart';
import 'package:my_expenses/models/expense.dart';
import 'package:my_expenses/widgets/expenses_list.dart';
import 'package:my_expenses/widgets/new_expense.dart';

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

  // when the + sign in app is placed a overlay will be opened to enter the expense item details
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewExpense(
          expenses: registeredExpenses,
          onAddExpesnse: _addExpense,
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
