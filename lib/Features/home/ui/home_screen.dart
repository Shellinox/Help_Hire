import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:help_hive/Features/add_post/ui/add_post_screen.dart';
import 'package:help_hive/Features/chat/ui/chat_screen.dart';
import 'package:help_hive/Features/posts/ui/post_screen.dart';
import 'package:help_hive/Utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> pages = [
    const PostScreen(),
    const AddPostScreen(),
    const ChatScreen(),
  ];
  static const List<String> pageTitle = [
    "Posts",
    "Add a Post",
    "Chats"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          pageTitle[selectedIndex],
          style: const TextStyle(color: primaryTextColor, fontSize: 16),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: GNav(
          onTabChange: (val) {
            setState(() {
              selectedIndex = val;
            });
          },
          activeColor: primaryColor,
          textStyle: const TextStyle(color: backgroundColor),
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
          color: inactiveTabItemColor,
          tabs: const [
            GButton(icon: Icons.list),
            GButton(icon: Icons.post_add),
            GButton(icon: Icons.chat_bubble_outline_rounded),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
    );
  }
}
