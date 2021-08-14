import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitDate() {
    final submittedTitle = titleController.text;
    final submittedAmount = double.parse(amountController.text);

    if (submittedTitle.isEmpty || submittedAmount <= 0) {
      return;
    }

    widget.addTransaction(submittedTitle, submittedAmount);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) {
                submitDate();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submitDate();
              },
            ),
            TextButton(
              onPressed: submitDate,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
