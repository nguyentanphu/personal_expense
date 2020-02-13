import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/user_transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Personal expense'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.blue,
                        child: Text('top'),
                      )),
                  UserTransaction(),
                ],
              ),
            )));
  }
}
