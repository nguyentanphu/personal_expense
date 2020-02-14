import 'package:flutter/material.dart';
import 'models/chart_model.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';

import 'widgets/new_transaction.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
          button: TextStyle(color: Colors.deepOrange)
        )
      ),
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
        id: 't1', title: 'Buy grocery', amount: 10, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Go to wedding', amount: 50, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 't3', title: 'Buy toys', amount: 20.22, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 't4', title: 'Meeting with christ Pho', amount: 30, date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 't5', title: 'Go to wedding', amount: 59.55, date: DateTime.now().subtract(Duration(days: 5))),
  ];

  List<Transaction> get _recent7DaysTransaction {
    return _transactions.where(
        (t) => t.date.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
  }

  final _chartModel = ChartModel();

  void addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
        id: DateTime.now().toIso8601String(),
        title: title,
        amount: amount,
        date: date);

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
            Chart(_chartModel.generateChartData(_recent7DaysTransaction)),
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
