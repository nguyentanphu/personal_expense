import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _label;
  final double _amount;
  final double _percentage;

  ChartBar({String label, double amount, double percentage})
      : _label = label,
        _amount = amount,
        _percentage = percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${_amount.toStringAsFixed(0)}'),),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: _percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(_label)
      ],
    );
  }
}
