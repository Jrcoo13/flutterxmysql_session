import 'dart:convert';

import 'package:code/utils/global_variables.dart';
import 'package:code/utils/my_shared_preference.dart';
import 'package:code/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../../route/route_manager.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _sharedPreference = MySharedPreference();
  // final _loginRepository = LoginRepository();

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Saber',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan),
                        children: [
                          TextSpan(
                              text: 'Tooth',
                              style: TextStyle(
                                  fontSize: 31,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      ),
                    ),
                    const Text('Login your account to continue...'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: usernameTextController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter username!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.cyan.withOpacity(0.2),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordTextController,
                obscureText: !isVisiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.cyan.withOpacity(0.2),
                    suffixIcon: IconButton(
                      icon: !isVisiblePassword
                          ? Icon(
                              Icons.visibility,
                              color: Colors.grey.shade700,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                      onPressed: () {
                        setState(() {
                          isVisiblePassword = !isVisiblePassword;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.cyan, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.cyan, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.cyan, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        login(usernameTextController.text,
                            passwordTextController.text);
                      }
                    },
                    color: Colors.cyan,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(String username, String password) async {
    try {
      String uri = "http://192.168.1.182/psits_api/login.php";
      var res = await http.post(Uri.parse(uri), body: {
        'email': username,
        'password': password,
      });

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);

        // Check if 'success' is true and 'user_id' is in the response
        if (response['success'] == true && response['user_id'] != null) {
          currentUser ??= User(); // Initialize if currentUser is null
          currentUser!.id = response['user_id'] ?? '';
          _sharedPreference.setUser(currentUser!);

          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, RouteManager.home);
          MySnackBar.show(
              // ignore: use_build_context_synchronously
              context,
              'Success',
              'Login Success!',
              SnackBarType.success);
        } else {
          // Show error if login fails
          MySnackBar.show(
            // ignore: use_build_context_synchronously
            context,
            'Error',
            response['message'] ?? 'Login failed',
            SnackBarType.error,
          );
        }
      } else {
        // ignore: use_build_context_synchronously
        MySnackBar.show(context, 'Error', 'Server error: ${res.statusCode}',
            SnackBarType.error);
      }
    } on Exception catch (error) {
      // ignore: use_build_context_synchronously
      MySnackBar.show(context, 'Error', error.toString(), SnackBarType.error);
    } catch (error) {
      // ignore: use_build_context_synchronously
      MySnackBar.show(context, 'Error', error.toString(), SnackBarType.error);
    }
  }
}
