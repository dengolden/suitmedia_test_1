import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/provider/user_data.dart';
import 'package:suitmedia_test/provider/user_provider.dart';
import 'package:suitmedia_test/shared/theme.dart';
import 'package:suitmedia_test/third_screen.dart';
import 'package:suitmedia_test/widgets/custom_button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<UserData>(context).name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff554AF0),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Color(0xffE2E3E4),
            height: 0.5,
          ),
        ),
        title: Text(
          'Second Screen',
          style: semiBoldTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 13),
            Text(
              'Welcome',
              style: regularTextStyle.copyWith(
                color: Color(0xff04021D),
                fontSize: 12,
              ),
            ),
            Text(
              name,
              style: semiBoldTextStyle.copyWith(
                color: Color(0xff04021D),
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Center(
                child: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    final selectedUserName =
                        userProvider.selectedUser?.name ?? 'Selected User Name';
                    return Text(
                      selectedUserName,
                      style: semiBoldTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: CustomButton(
                buttonText: 'Choose a User',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
