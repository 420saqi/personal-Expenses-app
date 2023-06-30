import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/Models/model-class.dart';

class ChartBars extends StatelessWidget {

  final List<Transaction> recentTransactions;


  ChartBars({required this.recentTransactions});

  List<Map<String,Object>> get groupedTransactionValue{
    return List.generate(7, (index){
     final weekDay = DateTime.now().subtract(Duration(days: index));
    double totalSum=0.0;
    for(int i=0; i<recentTransactions.length; i++){
      if(recentTransactions[i].dateTime.day == weekDay.day
          &&recentTransactions[i].dateTime.month==weekDay.month
          && recentTransactions[i].dateTime.year==weekDay.year){
        totalSum+= recentTransactions[i].amount;
      }
    }
    
    print(totalSum);
    print(weekDay);
      return {
        'day': DateFormat.E(weekDay), // will get initial of Day like M,T,W
        'amount' : totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      ],
    );
  }
}
