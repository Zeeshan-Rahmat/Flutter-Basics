import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/my_routes.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    const heightBetween = 20.0;
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
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: heightBetween,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: heightBetween,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(200, 40),
                    ),
                    child: const Text('LogIn'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
