import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_item.dart' ;

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constrains) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No Transactions added yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: constrains.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting'
                          '.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                );
              },
            )
          // : ListView.builder(
          //     itemBuilder: (ctx, index) {
          //       return TransactionItem(
          //           transaction: transactions[index], deleteTx: deleteTx);
          //     },
          //     itemCount: transactions.length,
          //   ),

          : ListView(
              children: transactions
                  .map((tx) => TransactionItem(
                        key: ValueKey(tx.id),
                        transaction: tx,
                        deleteTx: deleteTx,
                      ))
                  .toList(),
            ),
    );
  }
}
