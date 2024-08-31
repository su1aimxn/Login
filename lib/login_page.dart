import 'package:flutter/material.dart';
import 'package:flutter_2/controllers/auth_service.dart';
import 'RegisterPage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  void _login() async {
    if (_formKey.currentState!.validate()) {
      print(_usernameController.text);
      print(_passwordController.text);

      final user = await AuthService().login(_usernameController.text, _passwordController.text);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ Username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text("Login"),
                onPressed: _login,
              ),
              SizedBox(height: 20.0),
              TextButton(
                child: Text("ไม่มีบัญชี? Register"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  ).then((newUser) {
                    
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
