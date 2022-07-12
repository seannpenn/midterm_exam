import 'package:fake_api/screens/cart_screen.dart';
import 'package:fake_api/service_locators.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final ApiService service = locator<ApiService>();

  final TextEditingController nameCtrl = TextEditingController(
    text: 'mor_2314',
  );
  final TextEditingController passwordCtrl = TextEditingController(
    text: '83r5^_',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shop'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  final getToken = await login(
                    nameCtrl.text,
                    passwordCtrl.text,
                  );

                  if (getToken != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully logged in'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Future.delayed(
                      const Duration(seconds: 2),
                      () => 
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(),
                        ),
                      ),
                    );
                  } 
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incorrect username or password'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  login(String username, String password) async {
    final result = await service.login(username, password);
    print(result);
    return result;
    
  }
}
