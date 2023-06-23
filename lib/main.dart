import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model-class.dart';
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
      body: ListView(children: [
        Column(
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
                setState(() {
                  transactions.add(
                    Transaction(
                      title: titleController.text,
                      amount: double.parse(amountController.text),
                      dateTime: formattedDate,
                    ),
                  );
                });
              },
              child: const Text(
                'Add transaction',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ...transactions.map((e) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: Text(e.amount.toString()),
                  ),
                  title: Text(e.title),
                  subtitle: Text(e.dateTime),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        transactions.remove(e);
                      });
                    },
                  ),
                ),
              );
            })
          ],
        ),
      ]),
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

