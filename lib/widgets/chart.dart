import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

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

      String date = DateFormat.E().format(weekDay);
      print('weekDay: $date | totalAmount: $totalAmount');

      return {
        'day': date.substring(0, 1),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalAmountAllday {
    return groupedTxAmount.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return recentTransactions.isEmpty
        ? Card(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  'Non RecentTransactions',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            elevation: 6,
            margin: EdgeInsets.all(20),
          )
        : Card(
            margin: EdgeInsets.all(20),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTxAmount.map((e) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: (e['day'] as String),
                      spendingAmount: (e['amount'] as double),
                      spendingPctOfTotal:
                          (e['amount'] as double) / totalAmountAllday,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
  }
}
