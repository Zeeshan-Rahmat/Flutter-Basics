import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/my_routes.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String name = '';
  bool isClicked = false;

  final _formKey = GlobalKey<FormState>();

  gotoHomePage(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isClicked = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        isClicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const heightBetween = 25.0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: heightBetween,
            ),
            Text(
              'Welcome $name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: heightBetween,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      // onChanged: (value) {
                      //   setState(() {
                      //     name = value;
                      //   });
                      // },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username can not be Empty';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password can not be Empty';
                        } else if (value.length < 6) {
                          return 'Password length should be at least 6';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: heightBetween,
                    ),
                    Material(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(
                        isClicked ? 50 : 8,
                      ),
                      child: InkWell(
                        onTap: () => gotoHomePage(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: isClicked ? 50 : 250,
                          height: 50,
                          alignment: Alignment.center,
                          child: isClicked
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   style: TextButton.styleFrom(
                    //     minimumSize: const Size(200, 40),
                    //   ),
                    //   child: const Text('LogIn'),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
