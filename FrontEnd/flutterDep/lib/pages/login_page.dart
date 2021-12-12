import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/apiCalls/login.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/api_response.dart';

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
  late ApiResponse _apiResponse;
  @override
  void initState() {
    super.initState();
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
                padding: EdgeInsets.only(top: 80.0),
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
                    keyboardType: TextInputType.text,
                    onSaved: (String? value) {
                      email = value ?? "";
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  )),
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
                        return 'Password is required';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 10.0),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              const Color(0x99000000)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          elevation: MaterialStateProperty.all<double>(5)),
                      onPressed: _handleSubmitted,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Sign in')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 80, bottom: 0),
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
                    left: 30.0, right: 30.0, top: 10, bottom: 0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Recuperar Password',
                    style: TextStyle(color: Colors.black, fontSize: 15),
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
      showInSnackBar('Please fix the errors in red before submitting.');
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _saveAndRedirectToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userMail", _apiResponse.Data.mail);
    await prefs.setString("userPassword", password);
    Navigator.pushNamedAndRemoveUntil(
        context, '/home', ModalRoute.withName('/home'),
        arguments: (_apiResponse.Data));
  }
}
