import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/transaction_list.dart';

import 'widgets/new_transaction.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal expense',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'Buy grocery', amount: 20.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Go to wedding', amount: 300, date: DateTime.now())
  ];

  void addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toIso8601String(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal expense'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('top'),
                )),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
    );
  }
}
