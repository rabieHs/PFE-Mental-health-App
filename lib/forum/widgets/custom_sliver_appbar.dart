import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 70,
      backgroundColor: Colors.white,
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
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 13,
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
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
