import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/core/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../auth/model/user.dart';
import '../../auth/provider/user_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    print(user.email);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _profileHeader(user),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1,
            ),
            SafeArea(
                minimum: EdgeInsets.symmetric(vertical: 20),
                child: _profileMenu())
          ],
        ),
      ),
    ));
  }

  Widget _profileMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        children: const [
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/privacy.png"),
            ),
            title: Text("Personal info "),
          ),
          ListTile(
            leading: Icon(
              Iconsax.chart_35,
              color: primaryColor,
            ),
            title: Text("Statistics"),
          ),
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/personal_info.png"),
            ),
            title: Text("Privacy and policy "),
          ),
          ListTile(
            leading: Icon(
              Iconsax.flag_25,
              color: primaryColor,
            ),
            title: Text(
              "About Mindwell ",
            ),
          ),
          ListTile(
            leading: Icon(
              Iconsax.sms5,
              color: primaryColor,
            ),
            title: Text(
              "Contact us ",
            ),
          ),
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/log.png"),
            ),
            title: Text(
              "Sign out ",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileHeader(User user) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.profileImage),
          radius: 40,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.username,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(user.email,
                style: TextStyle(
                  fontSize: 16,
                )),
          ],
        )
      ],
    );
  }
}
