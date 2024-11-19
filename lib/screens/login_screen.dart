import 'package:flutter/material.dart';
import 'package:projet/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _login(BuildContext context) {
    // Dismiss keyboard by unfocusing any focused text field
    FocusScope.of(context).requestFocus(FocusNode());

    // Check if the fields are empty and show a snackbar if so
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _createAccount() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      print('Username: $username, Password: $password');
    } else {
      print('Please enter a username and password.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            top: 40.0, bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image at the top
            Image.asset('assets/images/transparent.png', height: 150),

            // Username Field
            TextField(
              controller: _usernameController,
              focusNode: _usernameFocusNode,
              decoration: InputDecoration(
                labelText: 'Nom d\'utilisateur',
                labelStyle: TextStyle(
                  color: _usernameFocusNode.hasFocus
                      ? Colors.orange
                      : Colors.black,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Password Field
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(
                  color: _passwordFocusNode.hasFocus
                      ? Colors.orange
                      : Colors.black,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Create Account Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Nouvel utilisateur? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: _createAccount,
                  child: Text(
                    'Créer un compte!',
                    style: TextStyle(color: green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Login Button
            ElevatedButton(
              onPressed: () => _login(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // No rounded corners
                ),
              ),
              child: const Text('Se Connecter',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
