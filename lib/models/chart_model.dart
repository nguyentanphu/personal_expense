import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';

class ChartModel {
  List<ChartData> generateChartData(List<Transaction> recentTransactions) {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      final dateFormat = DateFormat("yyyyMMdd");
      final double daySum = recentTransactions
        .where((t) => dateFormat.format(t.date) == dateFormat.format(weekDay))
        .map((t) => t.amount)
        .fold(0, (a1, a2) => a1 + a2,);


      return ChartData(dateLabel: DateFormat.E().format(weekDay), amount: daySum);
    });
  }
}

class ChartData {
  final String dateLabel;
  final double amount;

  ChartData({@required this.dateLabel, @required this.amount});
}

