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
        elevation: 5,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        isScrollControlled: true,
        builder: (_) {
          return NewTransaction(addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text('Personal expense'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              startAddNewTransaction(context);
            },
          )
        ],
      );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.35 - appBar.preferredSize.height - MediaQuery.of(context).padding.top,
              child: Chart(_chartModel.generateChartData(_recent7DaysTransaction)),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.65,
              child: TransactionList(_transactions),
            )
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
