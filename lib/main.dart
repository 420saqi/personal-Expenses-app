
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/Widgets/chart.dart';
import 'package:personalexpenses/Widgets/floating_button_functionality.dart';
import './Models/model-class.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(

        textTheme: Theme.of(context).textTheme.copyWith(titleLarge:
        const TextStyle(
          fontFamily: 'Geologiia_bold',
        )),
          appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'Geologiia_bold',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      ),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final transactions = [];
  DateTime currentDate = DateTime.now();
  late dynamic formattedDate; //changed type from String to dynamic because
  // i changed it in the model class from String to DateTime;
  @override
  void initState() {
    formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    super.initState();
  }
  void _addNewTransaction(String title, dynamic getamount) {
    final tx = Transaction(
      title: title,
      amount: getamount,
      dateTime:currentDate,
    );
    setState(() {
      transactions.add(tx);
    });
    Navigator.pop(context);
  }
List get _recentTransactions{
    return transactions.where((tx){
      return tx.dateTime.isAfter(
        DateTime.now().subtract(const Duration(days: 7),),
      );
    }).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          ChartBars(recentTransactions: _recentTransactions),
          Flexible(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      //toStringAsFixed round Off the value to 1 decimal places.
                      child: Text(transactions[index].amount.toStringAsFixed(1)),
                    ),
                    title: Text(transactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,),

                    subtitle: Text(DateFormat.yMd().format(transactions[index].dateTime)),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          transactions.remove(transactions[index]);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingButtonFunctionality(
        userTransactionList: transactions,
        newUserTransaction: _addNewTransaction,
        formattedDate: formattedDate,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
