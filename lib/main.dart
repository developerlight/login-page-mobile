import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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

class CobaLogin extends StatefulWidget {
  const CobaLogin({super.key});

  @override
  State<CobaLogin> createState() => _CobaLogin();
}

class _CobaLogin extends State<CobaLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 12),
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
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                // menampilkan pesan error jika field kosong
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your username' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // print('Username: ${_usernameController.text}');
                  // print('Password: ${_passwordController.text}');
                  // Validate the form fields. If invalid, the TextFormField validators
                  // will display error messages under each field automatically.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, show a success snackbar (or proceed).
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Login successful')));
                    // Navigate to the dashboard or perform sign-in logic here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  }
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
              SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.red[900]),
                ),
              ),
              // SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(color: Colors.red[900]),
                ),
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

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Register(),
            ),
          ),
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Register Form',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your first name' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your last name' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  helperText:
                      'We will never share your email with anyone else.',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your phone number' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
              ),
              SizedBox(height: 10),
              DateTimeFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  hintText: 'Select your date of birth',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onChanged: (DateTime? value) {
                  print(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle register action
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration successful')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.red[900],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Already have an account? Sign In',
                  style: TextStyle(color: Colors.red[900]),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'By registering, you agree to our Terms and Conditions.',
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

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: ForgotPassword(),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Image.asset('assets/images/forgot_password.png', height: 150),
          SizedBox(height: 20),

          Text(
            'Enter your email address to reset your password.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 40),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              // labelText: 'Your email',
              hintText: 'Enter your email',
              label: Center(child: Text('Your email')),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifiedForgotPasswordPage(),
                ),
              );
            },
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900],
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 50),
              elevation: 5,
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Back to Login',
              style: TextStyle(color: Colors.red[900]),
            ),
          ),
          SizedBox(height: 10),
          Text(
            '© 2025 My Flutter App',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class VerifiedForgotPasswordPage extends StatelessWidget {
  const VerifiedForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: VerifiedForgotPassword(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerifiedForgotPassword extends StatelessWidget {
  const VerifiedForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),

      child: Form(
        child: Column(
          children: [
            Image.asset('assets/images/forgot_password.png', height: 150),
            SizedBox(height: 20),
            Text(
              'Please Enter The 4-Digit Code Sent To Your Email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,

                    decoration: InputDecoration(border: UnderlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(border: UnderlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(border: UnderlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(border: UnderlineInputBorder()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Handle resend code action
                Navigator.pop(context);
              },
              child: Text(
                'Resend Code',
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPasswordPage()),
                );
              },
              child: Text(
                'Verify',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: NewPassword(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      child: Column(
        children: [
          Text(
            'Create New Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Image.asset('assets/images/forgot_password.png', height: 150),
          SizedBox(height: 20),
          Text(
            'Your new password must be different from previous used passwords.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 30),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New Password',
              hintText: 'Enter your new password',
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Re-enter your new password',
            ),
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: Text(
              'Change Password',
              style: TextStyle(fontSize: 18, color: Colors.red[900]),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900],
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 50),
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    Center(child: ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
      ),
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: Colors.red[900]!,
        buttonBackgroundColor: Colors.red[700]!,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int tappedIndex) {
          setState(() {
            _page = tappedIndex;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/images/login.jpg'),
                ),
                SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      'John Doe Brown',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@johndoe',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.red[900]),
                    title: Text('Email'),
                    subtitle: Text('johndoe@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.red[900]),
                    title: Text('Phone'),
                    subtitle: Text('+1 234 567 890'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red[900]),
                    title: Text('Location'),
                    subtitle: Text('New York, USA'),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today, color: Colors.red[900]),
                    title: Text('Member Since'),
                    subtitle: Text('January 2023'),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.red[900]),
                    title: Text('Password'),
                    subtitle: Text('********'),
                    trailing: TextButton(
                      onPressed: () {
                        // Navigate to change password page
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.red[900]),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.red[900]),
                    title: Text('Settings'),
                    onTap: () {
                      // Navigate to settings page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                    trailing: Icon(Icons.arrow_drop_down),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red[900]),
                    title: Text('Logout'),
                    onTap: () {
                      // Handle logout action
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'INI HALAMAN SETTINGAN',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
