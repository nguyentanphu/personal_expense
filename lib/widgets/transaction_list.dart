import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  TransactionList(List<Transaction> transactions)
      : _transactions = transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
          children: _transactions
              .map((t) => Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.purple)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\$${t.amount}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              t.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(DateFormat('dd/MM/yyyy').format(t.date))
                          ],
                        )
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
