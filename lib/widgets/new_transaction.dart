import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../models/funcs.dart';

class NewTransaction extends StatefulWidget {
  final VoidStringDoubleFunc _addHandler;
  NewTransaction(VoidStringDoubleFunc addHandler) : _addHandler = addHandler;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    amountController.text.isEmpty) {
                  Flushbar(
                    message: 'Title and Amount could not be empty!',
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ).show(context);
                  return;
                }
                widget._addHandler(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
