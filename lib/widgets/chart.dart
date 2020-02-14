import 'package:flutter/material.dart';
import 'package:personal_expense/models/chart_model.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<ChartData> _chartData;

  Chart(List<ChartData> chartData) : _chartData = chartData;

  double get _totalSpending =>
      _chartData.fold(0.0, (value, data) => value + data.amount);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _chartData
                .map(
                  (c) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                        label: c.dateLabel,
                        amount: c.amount,
                        percentage: c.amount / _totalSpending,
                      )),
                )
                .toList()),
      ),
    );
  }
}
