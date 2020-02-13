import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Buy grocery', amount: 20.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Go to wedding', amount: 300, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toIso8601String(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
