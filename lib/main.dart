import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Khatabook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //  home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: Scaffold(body: _LoginPage()));
  }
}

class _LoginPage extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateField() {
    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: '9041866055',
                  ),
                  textInputAction: TextInputAction.done,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone number';
                    }

                    if (value.length < 10) {
                      return 'Phone number can\'t be less than 10';
                    }
                    return null;
                  },
                  onFieldSubmitted: (term) {
                    validateField();
                  }),
              SizedBox(height: 20.0),
              MaterialButton(
                height: 48,
                minWidth: 340,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12)),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  validateField();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                color: Color(0xFFF7CA18),
              ),
            ],
          ),
        ));
  }
}
