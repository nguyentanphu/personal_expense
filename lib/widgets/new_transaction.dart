import 'package:flutter/material.dart';

import '../models/funcs.dart';

class NewTransaction extends StatelessWidget {
  final VoidStringDoubleFunc _addHandler;
  NewTransaction(VoidStringDoubleFunc addHandler) : _addHandler = addHandler;

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
                        onPressed: () => _addHandler(titleController.text, double.parse(amountController.text)),
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