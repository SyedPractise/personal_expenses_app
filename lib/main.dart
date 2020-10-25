import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/new-transaction.dart';
import 'package:personal_expenses_app/widgets/transaction-list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Expense App Title',
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  _MyAppHomeState createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '101',
      title: 'New Shoes',
      amount: 10.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '102',
      title: 'Car Insurance',
      amount: 7.56,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(Transaction tx) {
    print('tx=' + tx.toString());
    setState(() {
      _transactions.add(tx);
    });
  }

  void _showAddExpenseForm(BuildContext ctxt) {
    print('_showAddExpenseForm called , ctxt = ' + ctxt.toString());
    showModalBottomSheet(
      context: ctxt,
      builder: (_bCtx) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Expense Mgnr'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddExpenseForm(context),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddExpenseForm(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Card(
                child: Text('Card Placeholder'),
                elevation: 10,
                color: Colors.green,
              ),
              width: double.infinity,
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
    );
  }
}
