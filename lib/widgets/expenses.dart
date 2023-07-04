import 'package:flutter/material.dart';
import 'package:my_expenses/models/expense.dart';
import 'package:my_expenses/widgets/chart/chart.dart';
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
      amount: 100,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Flutter Course',
      amount: 399,
      date: DateTime.now(),
      category: Category.other,
    ),
    Expense(
      title: 'Movie',
      amount: 200,
      date: DateTime.now(),
      category: Category.movie,
    ),
    Expense(
      title: 'Petrol',
      amount: 150,
      date: DateTime.now(),
      category: Category.fuel,
    ),
    Expense(
      title: 'Tea',
      amount: 20,
      date: DateTime.now(),
      category: Category.drinks,
    ),
    Expense(
      title: 'Travel',
      amount: 250,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  // when the + sign in app is placed a overlay will be opened to enter the expense item details
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // isScrollControlled will open the modal in full screen
      isScrollControlled: true,
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

  void _removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);

    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted!'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Add your expenses!'),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Expenses',
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
