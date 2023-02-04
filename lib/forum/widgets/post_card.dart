import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../consts/colors.dart';
import 'package:badges/badges.dart' as badges;

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Rabie Houssaini",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Container(
            child: Text(
              "MY Story Like A film It’s Contains many Actions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          ReadMoreText(
            "MY Story Like A film It’s Contains many Actions MY Story Like A film It’s Contains many Actions MY Story Like A film It’s Contains many Actions MY Story Like A film It’s Contain MY Story Like A film It’s Contains many Act...MY Story Like A film It’s Contains many Actions MY Story Like A film It’s Contains many Actions MY Story Like A film It’s Contains many Actions MY Story Like A film It’s Contain MY Story Like A film It’s Contains many Act...",
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Read More",
            trimExpandedText: "Read Less",
            lessStyle: TextStyle(color: primaryColor),
            moreStyle: TextStyle(color: primaryColor),
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              badges.Badge(
                  badgeContent: Text(
                    '15',
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: primaryColor,
                    padding: EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    elevation: 0,
                  ),
                  child: Icon(Iconsax.heart)),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    builder: (context) => modalSheetBuilder(context)),
                child: badges.Badge(
                    badgeContent: Text(
                      '15',
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: primaryColor,
                      padding: EdgeInsets.all(5),
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      elevation: 0,
                    ),
                    child: Icon(Iconsax.message)),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
          )
        ]),
      ),
    );
  }

  modalSheetBuilder(BuildContext context) {
    return Container(
      height: 500,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              "Comments",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rabie Houssaini",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          Text(
                            "nice wow hhhhh",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "5 min ago",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rabie Houssaini",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                            Text(
                              "nice wow hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "5 min ago",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rabie Houssaini",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                            Text(
                              "nice wow hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "5 min ago",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
