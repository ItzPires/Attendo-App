import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/apiCalls/login.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/api_response.dart';
import 'package:uc_here/models/lecture.dart';
import 'package:uc_here/models/user.dart';

import '../beta.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  Future<String>? loggedInString;
  bool hasTried = false;
  late ApiResponseLogin _apiResponse;
  bool didSnackBars = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (didSnackBars) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      bottom: false,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Center(
                  child: SizedBox(width: 200, height: 150, child: DrawLogo()),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email:',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          labelStyle: Theme.of(context).textTheme.bodyText2),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? value) {
                        email = value ?? "";
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Inserir Email';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'Email inválido';
                        }
                        return null;
                      })),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        labelStyle: Theme.of(context).textTheme.bodyText2),
                    obscureText: true,
                    onSaved: (String? value) {
                      password = value ?? "";
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Inserir Password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  )),
              const SizedBox(height: 10.0),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        animationDuration: const Duration(seconds: 1),
                        fixedSize: const Size.fromWidth(150),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: _handleSubmitted,
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                      label: const Text(' Sign in ')),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        animationDuration: Duration(seconds: 1),
                        fixedSize: const Size.fromWidth(200),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () async {
                        email = "uc2024123456@student.uc.pt";
                        password = "demo";

                        _apiResponse = await authenticateUser(email, password);

                        betaTest = true;

                        _saveAndRedirectToHome();
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                      label: const Text(' Conta Demonstração ')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 80, bottom: 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      ModalRoute.withName('/home'),
                    );
                  },
                  child: Text(
                    'Criar Conta',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10, bottom: 0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Recuperar Password',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _handleSubmitted() async {
    final FormState? form = _formKey.currentState;
    if (!form!.validate()) {
      showInSnackBar('Verificar erros de input');
    } else {
      form.save();
      _apiResponse = await authenticateUser(email, password);

      if (_apiResponse.ApiError == "") {
        _saveAndRedirectToHome();
      } else {
        showInSnackBar(_apiResponse.ApiError);
      }
    }
  }

  void showInSnackBar(String message) {
    didSnackBars = true;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _saveAndRedirectToHome() async {
    ScaffoldMessenger.of(context).clearSnackBars();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userMail", _apiResponse.Data.mail);
    await prefs.setString("userPassword", password);
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home',
      ModalRoute.withName('/home'),
    );
  }
}
