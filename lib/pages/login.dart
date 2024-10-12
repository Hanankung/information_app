import 'package:flutter/material.dart';
import 'package:information_app/models/user.dart';
import 'package:information_app/controller/auth_controller.dart';
import 'package:information_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:information_app/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _authService = AuthSurvice();

  void _login(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      final userModel = await _authService.login(
          _usernameController.text, _passwordController.text);
      if (userModel != null) {
        Provider.of<UserProvider>(context, listen: false).onlogin(userModel);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // ใช้ Stack เพื่อซ้อนเนื้อหา
        children: [
          // รูปพื้นหลัง
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/TSU.jpg'), // เปลี่ยนเป็น path ของรูปที่คุณต้องการใช้
                fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่
              ),
            ),
          ),
          // เนื้อหาของหน้าเข้าสู่ระบบ
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 10) {
                            return 'Password must be at least 10 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 35, 2, 114),
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                      SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _login(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
