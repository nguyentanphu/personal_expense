import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  TransactionList(List<Transaction> transactions)
      : _transactions = transactions;

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'You have no transactions!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: _transactions
                .map((t) => Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: FittedBox(
                                child: Text('\$${t.amount.toStringAsFixed(2)}'),
                              )),
                        ),
                        title: Text(
                          t.title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(DateFormat('dd/MM/yyyy').format(t.date)),
                      ),
                    )))
                .toList());
  }
}
