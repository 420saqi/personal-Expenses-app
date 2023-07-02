import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/Widgets/chart_bar.dart';

class ChartBars extends StatelessWidget {
  final List
      recentTransactions; // i removved the <Transaction> from List<Transactions>

  const ChartBars({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E()
            .format(weekDay)
            .substring(0, 1), // will get initial of Day like M,T,W
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpendingAmount {
    return groupedTransactionValue.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValue);
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValue.map((data) {
          return ChartBar(
              label: data['day'] as String,
              spendingAmount: data['amount'] as double,
              spendingPctOfTotal: totalSpendingAmount == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpendingAmount);
        }).toList(),
      ),
    );
  }
}
