import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTxAmount {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));

      double totalAmount = 0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      print('weekDay: $weekDay | totalAmount: $totalAmount');

      return {
        'date': index,
        'amount': 99.99,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [],
      ),
    );
  }
}
