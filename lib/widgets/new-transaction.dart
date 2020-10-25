import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function onClickAddFunction;

  NewTransaction(this.onClickAddFunction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void onSubmitNewTransaction() {
    String inputTitle = titleController.text;
    double inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0) {
      return;
    }

    print('inputTitle=' + inputTitle);
    print('inputAmount=' + inputAmount.toString());
    Transaction tx = Transaction(
        id: DateTime.now().toString(),
        title: inputTitle,
        amount: inputAmount,
        date: DateTime.now());
    onClickAddFunction(tx);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => onSubmitNewTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => onSubmitNewTransaction(),
            ),
            FlatButton(
              onPressed: onSubmitNewTransaction,
              child: Text('Add'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
