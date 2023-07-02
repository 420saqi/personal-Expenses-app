
import 'package:flutter/material.dart';

class FloatingButtonFunctionality extends StatefulWidget {
  final Function newUserTransaction;
  final List userTransactionList;
  final formattedDate;

  const FloatingButtonFunctionality({super.key,
    required this.newUserTransaction,
    required this.userTransactionList,
    required this.formattedDate,
  });

  @override
  State<FloatingButtonFunctionality> createState() => _FloatingButtonFunctionalityState();
}

class _FloatingButtonFunctionalityState extends State<FloatingButtonFunctionality> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

DateTime? selectedDate;

  // Future<void> presentDatePicker(BuildContext context)async
  // {
  //  final pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2022),
  //       lastDate: DateTime.now(),
  //   );
  //  if(pickedDate!=null)
  //    {
  //      setState(() {
  //         selectedDate = pickedDate;
  //      });
  //    }
  // }

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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      onSubmitted: (value) => widget.newUserTransaction(
                        titleController.text,
                        double.parse(amountController.text),
                      ),
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter title',
                      ),
                    ),
                    TextField(
                      onSubmitted: (value) => widget.newUserTransaction(
                        titleController.text,
                        double.parse(amountController.text),
                      ),
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Price',
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       selectedDate==null ? 'No date Selected' :
                    //       DateFormat.yMd().format(selectedDate!),
                    //       style:const TextStyle(
                    //       fontSize: 20,
                    //     ),),
                    //     Expanded(
                    //       child: TextButton(
                    //           onPressed:() {
                    //             presentDatePicker(context);
                    //           },
                    //           child: const Text('Choose Date',style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 20,
                    //           ),),),
                    //     ),
                    //   ],
                    // ),
                    TextButton(
                      onPressed: () => widget.newUserTransaction(
                        titleController.text,
                        double.parse(amountController.text),
                      ),
                      child:  Text(
                        'Add transaction',
                          style:TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:  Text('Cancel',style:TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),),
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
