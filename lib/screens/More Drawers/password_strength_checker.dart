import 'package:flutter/material.dart';

import '../vault/vaultpage.dart';


class PassSC extends StatelessWidget {
  const PassSC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late String password;
  double strength = 0;
  bool isObscure = true;

  String text = "Please Enter A Password";

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp spcase = RegExp(r".*[@,#%&*.].*");

  void checkPassword(String value) {
    password = value.trim();
    if (password.isEmpty) {
      setState(() {
        strength = 0;
        text = "Please Enter A Password";
      });
    } else if (password.length < 6) {
      setState(() {
        strength = 0.25;
        text = "Your Password is Too Short";
      });
    } else if (password.length < 8) {
      setState(() {
        strength = 0.5;
        text = "Your Password is Acceptable but not Strong";
      });
    } else if (  letterReg.hasMatch(password) && !numReg.hasMatch(password) || password.length < 13) {
      setState(() {
        strength = 0.75;
        text = "Your Password is Strong";
      });
    }
    else {
      if (letterReg.hasMatch(password) || !numReg.hasMatch(password) || spcase.hasMatch(password)) {
        setState(() {
          strength = 1;
          text = "Your Password is Great";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Password Strength Check'),
          backgroundColor: strength <= 0.25
              ? Colors.red
              : strength <= 0.5
              ? Colors.yellow
              : strength <= 0.75
              ? Colors.blue
              : strength <= 1
              ? Colors.green
              :Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VaultPage(),
                ),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                onChanged: (val) => checkPassword(val),
                obscureText: isObscure,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(isObscure
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: strength <= 0.25
                          ? Colors.red
                          : strength <= 0.5
                          ? Colors.yellow
                          : strength <= 0.75
                          ? Colors.blue
                          : strength <= 1
                          ? Colors.green
                          :Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              LinearProgressIndicator(
                value: strength,
                backgroundColor: Colors.grey,
                color: strength <= 0.25
                    ? Colors.red
                    : strength <= 0.5
                    ? Colors.yellow
                    : strength <= 0.75
                    ? Colors.blue
                    : strength <= 1
                    ? Colors.green
                    :Colors.transparent,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: strength <= 0.25
                      ? Colors.red
                      : strength <= 0.5
                      ? Colors.yellow
                      : strength <= 0.75
                      ? Colors.blue
                      : strength <= 1
                      ? Colors.green
                      :Colors.transparent,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: strength < 0.5 ? null : () {},
                child: Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}