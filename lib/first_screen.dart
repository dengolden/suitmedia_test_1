import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/provider/palindrome.dart';
import 'package:suitmedia_test/provider/user_data.dart';
import 'package:suitmedia_test/second_screen.dart';
import 'package:suitmedia_test/widgets/custom_button.dart';
import 'package:suitmedia_test/widgets/custom_text_form.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/background.png',
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 186,
                ),
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ic_photo.png'),
                  ),
                ),
              ),
              SizedBox(height: 58.12),
              CustomTextForm(
                hintText: 'Name',
                onChanged: (text) {
                  context.read<UserData>().setName(text);
                },
              ),
              SizedBox(height: 15),
              CustomTextForm(
                hintText: 'Palindrome',
                onChanged: (text) {
                  context.read<Palindrome>().setInputText(text);
                },
              ),
              SizedBox(height: 45),
              CustomButton(
                buttonText: 'CHECK',
                onPressed: () {
                  context.read<Palindrome>().checkPalindrome();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(context.read<Palindrome>().isPalindrome
                            ? 'isPalindrome'
                            : 'not palindrome'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 15),
              CustomButton(
                buttonText: 'NEXT',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
