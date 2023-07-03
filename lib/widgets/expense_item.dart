import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('Rs ${expense.amount.toString()}'),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.access_alarm),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(DateTime.now().toString()),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
