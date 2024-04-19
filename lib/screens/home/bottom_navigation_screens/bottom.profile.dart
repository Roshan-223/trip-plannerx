import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_plannerx/screens/loginscreen.dart';

class BottomProfile extends StatelessWidget {
  BottomProfile({super.key});
  final List<IconData> items = [
    Icons.edit_document,
    Icons.image_outlined,
    Icons.movie_edit,
    Icons.info_outline,
    Icons.share_outlined,
    Icons.logout
  ];

  final List<String> text = [
    'Add Notes',
    'Images',
    'Blogs',
    'About',
    'Share',
    'LogOut'
  ];

  @override
  Widget build(BuildContext context) {
    Future<void> userdata() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("loggedIn", false);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 40,
              ),
              title: const Text('User'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ),
          ),
          const Divider(
            height: 60,
            indent: 25,
            endIndent: 25,
            color: Colors.black,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    items[index],
                    color: Colors.black,
                    size: 35,
                  ),
                  title: Text(
                    text[index],
                    style: const TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm Logout"),
                          content:
                              const Text("Are you sure you want to log out?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                                userdata();
                              },
                              child: const Text("Logout"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
