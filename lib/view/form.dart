import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

// ignore: use_key_in_widget_constructors
class UserForm extends StatefulWidget {
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _controladorName = TextEditingController();

  final TextEditingController _controladorEmail = TextEditingController();

  final TextEditingController _controladorMatricula = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuario'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final String name = _controladorName.text;
                final String email = _controladorEmail.text;
                final String matricula = _controladorMatricula.text;

                final User newUser =
                    User(name: name, email: email, matricula: matricula);

                setState(() {
                  isLoding = true;
                });
                // ignore: unused_local_variable
                final response = await http.post(
                  Uri.parse(
                      'https://ufopa-app-default-rtdb.firebaseio.com/users.json'),
                  body: jsonEncode(<String, String>{
                    'name': newUser.name,
                    'email': newUser.email,
                    'matricula': newUser.matricula,
                  }),
                );

                final user = await http.get(Uri.parse(
                    'https://ufopa-app-default-rtdb.firebaseio.com/users.json'));
                // ignore: avoid_print
                print(user.body);
                setState(() {
                  isLoding = false;
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                });
              }
            },
          ),
        ],
      ),
      body: isLoding
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                      controller: _controladorName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      controller: _controladorEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Matrícula ou SIAPE'),
                      controller: _controladorMatricula,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      })
                ]),
              ),
            ),
    );
  }
}
