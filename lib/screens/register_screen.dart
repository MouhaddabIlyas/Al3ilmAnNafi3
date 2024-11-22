import 'package:flutter/material.dart';
import 'package:projet/constants.dart';
import 'package:projet/screens/post_register_screen.dart';
import 'package:projet/screens/terms_conditions_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = false;
  bool _isVerifyPasswordVisible = false;
  bool _isDialogOpen = false;
  String _selectedProfilePicture =
      ''; // Default is empty, will show only account icon initially

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _verifyPasswordController.dispose();
    _emailController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _login(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
      setState(() {
        _isDialogOpen = true;
      });
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              color: Colors.white,
              child: PostRegisterPage(),
            ),
          );
        },
      ).then((_) {
        setState(() {
          _isDialogOpen = false;
        });
      });
    }
  }

  void _createAccount() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final verifyPassword = _verifyPasswordController.text;

    if (username.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        password == verifyPassword) {
      print('Username: $username, Email: $email, Password: $password');
      print('Selected Profile Picture: $_selectedProfilePicture');
    } else {
      print(
          'Please enter a valid username, email, password, and verify that passwords match.');
    }
  }

  void _selectProfilePicture() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Selectionner photo de profile"),
          content: Container(
            height: 200,
            width: double.maxFinite,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 27,
              physics:
                  BouncingScrollPhysics(), // Re-enabled the scroll glow effect
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedProfilePicture =
                          'assets/images/profiles/profile${index + 1}.jpg';
                    });
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/profiles/profile${index + 1}.jpg'),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Wrap in SingleChildScrollView to prevent overflow
        child: Padding(
          padding: const EdgeInsets.only(
              top: 40.0, bottom: 16.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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

              // Email Field (new)
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
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
                obscureText: !_isPasswordVisible,
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Verify Password Field (same style as Password)
              TextField(
                controller: _verifyPasswordController,
                obscureText: !_isVerifyPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Vérifier le mot de passe',
                  labelStyle: TextStyle(
                    color: _passwordFocusNode.hasFocus
                        ? Colors.orange
                        : Colors.black,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isVerifyPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isVerifyPasswordVisible = !_isVerifyPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Profile Picture Section with CircleAvatar Border
              GestureDetector(
                onTap: _selectProfilePicture,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Thin black border
                      width: 2, // Adjust the width of the border
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60, // Increase the radius for a larger CircleAvatar
                    backgroundImage: _selectedProfilePicture.isEmpty
                        ? null
                        : AssetImage(_selectedProfilePicture),
                    backgroundColor:
                        Colors.white, // White background for default icon
                    child: _selectedProfilePicture.isEmpty
                        ? Icon(
                            Icons.account_circle,
                            size:
                                70, // Increase the size of the icon to fit the circle
                            color: Colors.black, // Black icon
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Create Account Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous avez déjà un compte? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                  GestureDetector(
                    onTap: //_createAccount,
                        () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      'Se Connecter!',
                      style: TextStyle(
                        color: green,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Create Account Button
              ElevatedButton(
                onPressed: //_createAccount,
                    () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('Créer le Compte',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
