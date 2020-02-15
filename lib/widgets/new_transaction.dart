import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/funcs.dart';

class NewTransaction extends StatefulWidget {
  final VoidStringDoubleDateFunc _addHandler;
  NewTransaction(VoidStringDoubleDateFunc addHandler)
      : _addHandler = addHandler;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  void _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final datePicked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year - 1),
        lastDate: DateTime(now.year + 1));

    if (datePicked != null) {
      _dateController.text = DateFormat('dd/MM/yyyy').format(datePicked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            autofocus: true,
            controller: _titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
          ),
          InkWell(
            onTap: () => _selectDate(context),
            child: IgnorePointer(
              child: TextField(
                decoration: InputDecoration(labelText: 'Date'),
                controller: _dateController,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              if (_titleController.text.isEmpty ||
                  _amountController.text.isEmpty ||
                  _dateController.text.isEmpty) {
                Flushbar(
                  message: 'Title, Amount and Date could not be empty!',
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                ).show(context);
                return;
              }
              widget._addHandler(
                  _titleController.text,
                  double.parse(_amountController.text),
                  DateFormat('dd/MM/yyyy').parse(_dateController.text));
            },
            child: Text(
              'Add transaction',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          )
        ],
      ),
    );
  }
}
