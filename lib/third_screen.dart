import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/provider/user_provider.dart';
import 'package:suitmedia_test/shared/theme.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
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
          'Third Screen',
          style: semiBoldTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 38),
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.isLoading && userProvider.users.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else if (userProvider.users.isEmpty) {
              return Center(child: Text("No Users Found"));
            } else {
              return RefreshIndicator(
                onRefresh: () => userProvider.fetchUsers(isRefresh: true),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Color(0xffE2E3E4),
                    height: 1,
                  ),
                  itemCount: userProvider.users.length +
                      (userProvider.hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == userProvider.users.length) {
                      if (userProvider.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox.shrink();
                      }
                    }
                    final user = userProvider.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(
                        user.name,
                        style: mediumTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        user.email,
                        style: regularTextStyle.copyWith(
                          color: Color(0xff686777),
                          fontSize: 10,
                        ),
                      ),
                      onTap: () {
                        userProvider.selectUser(user);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
