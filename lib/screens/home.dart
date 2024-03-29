import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/core/theme/theme.dart';

import '../core/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Iconsax.menu,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Iconsax.notification,
            ),
          )
        ],
        elevation: 0,
      ),
      body: Center(
        child: screensList[_index],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: GNav(
          gap: 8,
          onTabChange: _onItemTapped,
          tabBackgroundColor: Colors.lightBlue,
          color: Colors.grey,
          activeColor: Colors.white,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              text: "Home",
              icon: _index == 0 ? Iconsax.home1 : Iconsax.home,
              iconSize: 20,
            ),
            GButton(
                text: "Music",
                icon: Iconsax.music_circle,
                iconColor: Colors.grey),
            GButton(text: "Forum", icon: Iconsax.people),
            GButton(text: "Settings", icon: Iconsax.setting),
          ],
        ),
      ),
    );
  }
}
