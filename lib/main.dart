import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpenses/Widgets/floating_button_functionality.dart';
import './Models/model-class.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final transactions = [];
  DateTime currentDate = DateTime.now();
  late String formattedDate;
  @override
  void initState() {
    formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    super.initState();
  }

  void _addNewTransaction(String title, dynamic Myamount) {
    final tx = Transaction(
      title: title,
      amount: Myamount,
      dateTime: formattedDate,
    );
    setState(() {
      transactions.add(tx);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Text(transactions[index].amount.toString()),
              ),
              title: Text(transactions[index].title),
              subtitle: Text(transactions[index].dateTime),
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
      floatingActionButton: FloatingButtonFunctionality(
        userTransactionList: transactions,
        newUserTransaction: _addNewTransaction,
        formattedDate: formattedDate,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
