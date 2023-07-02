import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar({super.key,
  required this.label,
  required  this.spendingAmount,
  required this.spendingPctOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(spendingAmount.toStringAsFixed(0)),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey,),
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.shade50,
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey,),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).primaryColor,
                  ),

                ),
              ),
            ],
          )
          ,),
        Text(label),
      ],
    );
  }
}
