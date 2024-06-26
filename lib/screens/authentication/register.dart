
import 'package:securityapp/screens/homepage.dart';
import 'package:securityapp/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final focus = FocusNode();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool isObsecured = true;
  bool _isBiometricEnabled = false;

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  _savePassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
  }
  _saveBiometric(bool isEnabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometricEnabled', isEnabled);
  }

  _saveBiometricPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('biometricPassword', password);
  }

  Future<void> _collectBiometricData() async {
    var localAuth = LocalAuthentication();
    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      if (canCheckBiometrics) {
        bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Enable biometric authentication for added security',
          options: AuthenticationOptions(stickyAuth: true, biometricOnly: true),
        );

        if (didAuthenticate) {
          _saveBiometric(true);
          print('Biometric saved');
        }
      }
    } catch (e) {
      print('Error during biometric authentication: $e');
    }
  }

  authenticate() async {
    var localAuth = LocalAuthentication();
    bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Authenticate',
        options: AuthenticationOptions(biometricOnly: true, stickyAuth: true));

    if (!didAuthenticate) {
      Navigator.pop(context);
    }
  }

  final GlobalKey<FormState> _registerformKey = GlobalKey<FormState>();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  void validate(BuildContext context) async {
    final FormState form = _registerformKey.currentState!;
    if (form.validate()) {
      await _storeOnboardInfo();
      await _savePassword(confirmpasswordController.text.trim());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      const snackbar = SnackBar(
        content: Text("Form is invalid"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmpasswordController.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07,
            ),
            child: Form(
              key: _registerformKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  SvgPicture.asset(
                    'assets/secure_files.svg',
                    height: size.height * 0.2,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Register a master password',
                    style: TextStyle(
                      // fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  TextFormField(
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(focus);
                    },
                    obscureText: isObsecured,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: passwordValidator.call,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      border: const OutlineInputBorder(),
                      suffix: InkWell(
                        child: Icon(
                          isObsecured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onTap: () {
                          setState(() {
                            isObsecured = !isObsecured;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextFormField(
                    focusNode: focus,
                    obscureText: isObsecured,
                    controller: confirmpasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    validator: (val) => MatchValidator(
                            errorText: 'passwords do not match')
                        .validateMatch(val!, passwordController.text.trim()),
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      filled: true,
                      border: const OutlineInputBorder(),
                      suffix: InkWell(
                        child: Icon(
                          isObsecured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onTap: () {
                          setState(() {
                            isObsecured = !isObsecured;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  CustomButton(
                    ontap: () {
                      validate(context);
                    },
                    buttontext: 'Register',
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Text(
                    'Note that if the master password is lost,the stored '
                    'data cannot be recovered because of the missing '
                    'sync option. it is strongly recommended that you '
                    'backup your  data at regular intervals.',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
