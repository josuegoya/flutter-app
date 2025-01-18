import 'package:crud_users/database/operation.dart';
import 'package:crud_users/pages/register_users.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  static const String ROUTE = "/";

  @override
  Widget build(BuildContext context) {
    Operation.getAll();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, RegisterUsers.ROUTE),
      ),
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('User 1'),
          ),
          ListTile(
            title: Text('User 2'),
          ),
          ListTile(
            title: Text('User 3'),
          ),
          ListTile(
            title: Text('User 4'),
          ),
          ListTile(
            title: Text('User 5'),
          )
        ],
      ),
    );
  }
}
