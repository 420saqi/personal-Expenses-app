import 'package:flutter/material.dart';
import 'package:personalexpenses/bottom_sheet.dart';
import 'package:intl/intl.dart';

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

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(
              hintText: 'Enter amount',
            ),
          ),
          TextButton(
            onPressed: () {
              print(titleController.text);
              print(amountController.text);
              print(formattedDate);
            },
            child: const Text(
              'Add transaction',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Transaction {
  String title;
  double amount;
  DateTime dateTime;

  Transaction(
      {required this.title,
        required this.amount,
        required this.dateTime,
      });
}

//
// ListView.builder(
// itemCount: transactions.length,
// itemBuilder: (context, index) {
// return Card(
// child: ListTile(
// title: const Text('new shoes'),
// subtitle: Text(formattedDate),
// leading: const CircleAvatar(
// child: Text('33.3'),
// ),
// trailing: const Icon(Icons.delete),
// ),
// );
// },
// // )
