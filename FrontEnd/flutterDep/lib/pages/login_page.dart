import 'package:flutter/material.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email = "";
  late String password = "";
  Future<String>? loggedIn;
  bool hasTried = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Center(
                child: SizedBox(width: 200, height: 150, child: DrawLogo()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    labelText: 'Email:',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    labelStyle: Theme.of(context).textTheme.bodyText2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 30, bottom: 0),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password:',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    labelStyle: Theme.of(context).textTheme.bodyText2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: Column(children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(Color(0x99000000)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      elevation: MaterialStateProperty.all<double>(5)),
                  onPressed: () {
                    setState(() {
                      hasTried = true;
                    });
                    loggedIn = fetchLogin(email, password);
                    loggedIn!.then((value) => {
                          if (value == "Sessão iniciada com sucesso")
                            {
                              logged_in = true,
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/', (Route<dynamic> route) => false)
                            }
                        });
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 50, bottom: 0),
                    child: getLoginState(loggedIn, hasTried)),

                //VAMOS USAR PASSWORD

                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 130, bottom: 0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 5, bottom: 0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Recuperar Password',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

FutureBuilder<String> getLoginState(loginText, hasTried) {
  return FutureBuilder<String>(
      future: loginText,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const Text(
            'Error trying to login',
          );
        }
        if (!hasTried) {
          return const Text(
            '',
          );
        } else {
          return const CircularProgressIndicator(
            color: Color(0xFF000000),
          );
        }
        // By default, show a loading spinner.
      });
}

Future<String> fetchLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse(apiURLTest + "login/"),
    body: jsonEncode(<String, String>{
      "email": email,
      "password": password,
    }),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> decode = jsonDecode(response.body);
    if (decode['error'] != null) return 'Credenciais inválidas';
    authToken = decode['authToken'];
    is_teacher = decode['is_teacher'];
    my_id = decode['id'];
    return "Sessão iniciada com sucesso";
  } else {
    return "Falha a conectar ao servidor";
  }
}
