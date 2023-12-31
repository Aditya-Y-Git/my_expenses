import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Uuid is a package used to generate unique id
const uuid = Uuid();

// intl is a package used to formate date in multiple formats
final formatter = DateFormat.yMd();

enum Category { drinks, food, fuel, movie, other, travel }

const categoryIcons = {
  Category.food: Icons.dining,
  Category.drinks: Icons.wine_bar,
  Category.fuel: Icons.local_gas_station,
  Category.movie: Icons.movie_filter_sharp,
  Category.travel: Icons.drive_eta,
  Category.other: Icons.more_rounded,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
