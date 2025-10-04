import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red[900],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: CobaLogin(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CobaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Login Form',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle login action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  elevation: 5,
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.red[900]),
              ),
              SizedBox(height: 10),
              Text(
                'Don\'t have an account? Sign Up',
                style: TextStyle(color: Colors.red[900]),
              ),
              SizedBox(height: 10),
              Text('Or sign in with', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle Facebook login
                      },
                      label: Text('Google'),
                      icon: Icon(Icons.g_mobiledata),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle Google login
                      },
                      label: Text('Github'),
                      icon: Icon(Icons.code),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle Twitter login
                      },
                      label: Text('Apple'),
                      icon: Icon(Icons.apple),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'By signing in, you agree to our Terms and Conditions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                '© 2025 My Flutter App',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
