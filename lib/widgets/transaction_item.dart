import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tx;
  final Function(String) deleteTx;
  TransactionItem({
    required this.tx,
    required this.deleteTx,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child:
                  FittedBox(child: Text('\$' + tx.amount.toStringAsFixed(2))),
            ),
          ),
          title: Text(tx.title, style: Theme.of(context).textTheme.headline6),
          subtitle: Text(DateFormat.yMMMd().format(tx.date)),
          trailing: MediaQuery.of(context).size.width > 360
              ? TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  label: Text(
                    'delete',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                )
              : IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {
                    deleteTx(tx.id);
                  },
                ),
        ),
      ),
    );
  }
}
