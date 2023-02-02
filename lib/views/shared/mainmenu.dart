import 'package:flutter/material.dart';
import 'package:homestay_raya/views/screens/profilescreen.dart';
import 'package:homestay_raya/views/screens/registerpage.dart';
import '../../models/user.dart';
import '../screens/loginpage.dart';
import '../screens/buyerscreen.dart';
import '../screens/sellerpage.dart';
import 'EnterExitRoute.dart';

class MainMenuWidget extends StatefulWidget {
  final User user;
  const MainMenuWidget({super.key, required this.user});

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      elevation: 10,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(_emailEditingController.text),
            accountName: Text(_nameEditingController.text),
            currentAccountPicture: const CircleAvatar(
              radius: 30.0,
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              
              Navigator.push(
                  context,
                  EnterExitRoute(
                      exitPage: MainScreen(user: widget.user),
                      enterPage: MainScreen(user: widget.user)));
            },
          ),
          ListTile(
            title: const Text('Homestay Owner'),
            onTap: () {
              Navigator.pop(context);
               Navigator.push(context,
                   MaterialPageRoute(builder: (content) => SellerScreen(user: widget.user,)));
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (content) => const LoginScreen()));
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (content) => ProfileScreen(user: widget.user,)));
            },
          ),
        ],
      ),
    );
  }
}
