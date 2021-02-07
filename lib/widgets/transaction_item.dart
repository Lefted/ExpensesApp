import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 392
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                label: const Text('Delete'))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id),
              ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
      ),
    );
  }
}