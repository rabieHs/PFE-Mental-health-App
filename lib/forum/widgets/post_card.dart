import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/auth/provider/user_provider.dart';
import 'package:mental_health_app/consts/widgets/custom_input_text.dart';
import 'package:mental_health_app/core/theme/theme.dart';
import 'package:mental_health_app/forum/models/comment_model.dart';
import 'package:mental_health_app/forum/models/post_model.dart';
import 'package:mental_health_app/forum/services/post_services.dart';
import 'package:mental_health_app/forum/widgets/comment_card.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:badges/badges.dart' as badges;

import '../../core/theme/colors.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final TextEditingController commentController = TextEditingController();
  String commentLength = "0";

  uploadComment(
    String text,
    String postId,
    String username,
    String profileImage,
    String uid,
    DateTime dateTime,
  ) async {
    Comment comment = Comment(
        content: text,
        username: username,
        profilepic: profileImage,
        uid: uid,
        time: Timestamp.fromDate(dateTime));
    PostServices postServices = PostServices();
    postServices.addComment(postId, comment);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCommentLength();
    setState(() {});
  }

  getCommentLength() async {
    commentLength = await PostServices().getCommentLength(widget.post.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = isdarkTheme(context);
    final postProvider = Provider.of<PostsProvider>(context);
    bool isLike = postProvider.checkLike(widget.post.uid, widget.post.Likes);

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.post.profilePic),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.username,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    timeago.format(widget.post.date.toDate()),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              widget.post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          ReadMoreText(
            widget.post.content,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Read More",
            trimExpandedText: "Read Less",
            lessStyle: TextStyle(color: primaryColor),
            moreStyle: TextStyle(color: primaryColor),

            // TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  postProvider.likePost(
                      widget.post.postId, widget.post.uid, widget.post.Likes);
                },
                child: badges.Badge(
                    badgeContent: Text(
                      widget.post.Likes.length.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: primaryColor,
                      padding: EdgeInsets.all(8),
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      elevation: 0,
                    ),
                    child: isLike != true
                        ? Icon(
                            Icons.favorite_outline,
                            size: 26,
                          )
                        : Icon(
                            Icons.favorite,
                            size: 26,
                            color: secondaryColor,
                          )),
              ),
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
                    builder: (context) =>
                        modalSheetBuilder(context, widget.post.postId)),
                child: badges.Badge(
                    badgeContent: StreamBuilder(
                      stream: PostServices().getComment(widget.post.postId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        return Text(
                          snapshot.data!.docs.length.toString(),
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: primaryColor,
                      padding: EdgeInsets.all(8),
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      elevation: 0,
                    ),
                    child: Icon(
                      CupertinoIcons.conversation_bubble,
                    )),
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

  modalSheetBuilder(BuildContext context, String postId) {
    PostServices postServices = PostServices();
    final user = Provider.of<UserProvider>(context).user;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
          height: 500,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Comments",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: postServices.getComment(postId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("No Comments yet"),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Comment comment = Comment.fromMap(
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>);
                              return CommentCard(
                                comment: comment,
                              );
                            });
                      },
                    )),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(user.profileImage),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.67,
                          height: 35,
                          child: CustomInputText(
                            hint: "enter comment ..",
                            minLines: 1,
                            textEditingController: commentController,
                          )),
                      InkWell(
                        onTap: () {
                          uploadComment(
                              commentController.text,
                              postId,
                              user.username,
                              user.profileImage,
                              user.uid,
                              DateTime.now());
                          commentController.text = '';
                        },
                        child: Icon(
                          Iconsax.send1,
                          color: primaryColor,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
