import 'dart:developer';

import 'package:crud_users/database/operation.dart';
import 'package:crud_users/models/user.dart';
import 'package:flutter/material.dart';

class RegisterUsers extends StatelessWidget {
  const RegisterUsers({super.key});

  static const String ROUTE = "/save";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register User")),
      body: _FormRegister(),
    );
  }
}

class _FormRegister extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  String? isEmpty(String? value, String label) {
    if (value!.isEmpty) {
      return "El campo $label no puede estar vacio";
    }

    return null;
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      log("Usuario: ${nameController.text}");

      Operation.insert(User(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)))),
              validator: (value) => isEmpty(value, "Name"),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)))),
              validator: (value) => isEmpty(value, "User"),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)))),
              validator: (value) => isEmpty(value, "Email"),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () => validateForm(), child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
