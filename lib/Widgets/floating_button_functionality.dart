import 'package:flutter/material.dart';

class FloatingButtonFunctionality extends StatelessWidget {
  final Function newUserTransaction;
  final List userTransactionList;
  final formattedDate;

  FloatingButtonFunctionality({
    required this.newUserTransaction,
    required this.userTransactionList,
    required this.formattedDate,
  });

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    TextField(
                      onSubmitted: (value)=> newUserTransaction(
                        titleController.text,
                        double.parse(amountController.text),
                      ),
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter title',
                      ),
                    ),
                    TextField(
                      onSubmitted: (value)=>newUserTransaction(
                        titleController.text,
                        double.parse(amountController.text),
                      ) ,
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Price',
                      ),
                    ),
                    TextButton(
                      onPressed:()=> newUserTransaction(
                        titleController.text,
                        double.parse(amountController.text) ,
                      ),
                      child: const Text(
                        'Add transaction',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      backgroundColor: Colors.amber,
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
