import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme/theme.dart';
import 'package:mental_health_app/forum/screens/add_post_screen.dart';

import '../../core/theme/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String profilepic;
  const CustomSliverAppBar({
    Key? key,
    required this.profilepic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      collapsedHeight: 70,
      expandedHeight: 100,
      leadingWidth: MediaQuery.of(context).size.width,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Share your story",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profilepic),
                    radius: 13,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddPostScreen()));
                    },
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          width: 1,
                          color: greyColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Click Here ...",
                            style: TextStyle(color: greyColor, fontSize: 9),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floating: true,
      snap: true,
    );
  }
}
