import 'package:flutter/material.dart';
import 'package:tugas4tpm/botnavbar.dart';

class LoginPageState extends StatefulWidget {
  const LoginPageState({Key? key}) : super(key: key);

  @override
  State<LoginPageState> createState() => _LoginPageStateState();
}

String username = "";
String password = "";
bool isLoginSucces = true;
bool isHidden = true;

class _LoginPageStateState extends State<LoginPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // tambahkan warna background putih ke scaffold
      body: Stack(
        // gunakan stack untuk menumpuk gambar dan AppBar
        children: [
          Image.asset(
            'assets/wave.png',
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SizedBox(
                  height:
                      60), // atur tinggi kosong setara dengan ketinggian AppBar
              Container(
                width: 300,
                child: Image.asset('assets/login.png'),
              ),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ],
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor:
            Colors.green, // atur background color AppBar menjadi transparent
        elevation: 0, // hilangkan bayangan pada AppBar
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: (isLoginSucces) ? Colors.blue : Colors.redAccent),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: isHidden,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
            child: Icon((isHidden) ? Icons.lock : Icons.lock_open_outlined),
          ),
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: (isLoginSucces) ? Colors.blue : Colors.redAccent),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSucces) ? Colors.green : Colors.redAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          String text = "";
          if (username == "1" && password == "1") {
            setState(() {
              text = "Login Success";
              isLoginSucces = true;
            });

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => BotNavBar()));
            username = '';
            password = '';
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSucces = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(
              text,
            ),
            backgroundColor: (isLoginSucces) ? Colors.blue : Colors.redAccent,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
