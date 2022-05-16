import 'package:app_ufopa/view/form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final senha = TextEditingController();
  bool truefalse = false;
  String textoTema = 'Ativar tema escuro?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Column(
                    children: const <Widget>[
                      CircleAvatar(
                          // backgroundImage: AssetImage(),
                          radius: 50.0,
                          backgroundColor: Colors.teal),
                    ],
                  ),
                ),
              ),
              //Padding(
              //  padding: EdgeInsets.all(10),
              //  child: Text(
              //    widget.title,
              //    style: const TextStyle(fontSize: 20, color: Colors.teal),
              //  ),
              //),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 5, bottom: 5),
                child: TextField(
                  controller: email,
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  textAlign: TextAlign.center,
                  //                scrollPadding: EdgeInsets.all(10.0),
                  decoration: const InputDecoration(
                    //                  border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 20),
                    hintText: 'Digite seu email',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 5, bottom: 5),
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: '•',
                  controller: senha,
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  textAlign: TextAlign.center,
                  //                scrollPadding: EdgeInsets.all(10.0),
                  decoration: const InputDecoration(
                    //                  border: OutlineInputBorder(),
                    labelText: 'Matrícula ou Siape',
                    labelStyle: TextStyle(fontSize: 20),
                    hintText: 'Digite sua matrícula ou Siape',
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 0.0,
                    maxWidth: double.infinity,
                    minHeight: 0.0,
                    maxHeight: double.infinity,
                  ),
                  //              width: 270.0,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Logar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, bottom: 50, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              //const SizedBox(
              //  height: 50.0,
              //),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserForm()),
                  );
                },
                child: const Text(
                  'Cadastre-se aqui!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  Switch(
                      value: truefalse,
                      onChanged: (bool newValue) {
                        setState(() {
                          if (truefalse == true) {
                            truefalse = false;
                            textoTema = 'Ativar tema escuro?';
                          } else {
                            truefalse = true;
                            textoTema = 'Desativar tema escuro';
                          }
                        });
                      }),
                  Text(
                    textoTema,
                    style: const TextStyle(fontSize: 16),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
















//  int _counter = 0;
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }

//  @override
//  Widget build(BuildContext context) {


//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),

//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            const Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),

//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: const Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.

//    );
