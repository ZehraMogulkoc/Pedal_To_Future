import 'dart:math';

import 'package:flutter_fest/Model/Comment.dart';
import 'package:flutter_fest/Utils/SizeConfig.dart';
import 'package:flutter_fest/Utils/Utils.dart';
import 'package:flutter_fest/Widgets/CommentItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  //List<Comment> dataList = List<Comment>();
  List<Comment> dataList = List<Comment>.empty(growable: true);
  final TextEditingController commentController = new TextEditingController();

  List commentsList = [
    {
      'id':10,
      'name': 'Kullanıcı 1',
      'comment': "Tramvay ile ulaşım çok yavaş, ",
      'date': 'Today',
      'time': '5:42PM',
      'userImage':
          'https://previews.123rf.com/images/anwarsikumbang/anwarsikumbang1502/anwarsikumbang150200524/36970132-male-laughing-funny-hilarious-cartoon-character-vector-illustration.jpg',
      'replies': []
    },
    {
      'id':11,
      'name': 'Kullanıcı 2',
      'comment': "Scooter fiyatları çok pahalı",
      'date': 'Yesterday',
      'time': '12:30AM',
      'userImage':
          'https://st2.depositphotos.com/1007566/12304/v/950/depositphotos_123041468-stock-illustration-avatar-man-cartoon.jpg',
      'replies': [
        {
          'id':1,
          'name': 'Kullanıcı 3',
          'comment': "Otobüsler genellikle çok kalabalık oluyor ",
          'date': 'Today',
          'userImage': 'http://clipart-library.com/images/ki85yE8eT.png',
          'time': '6:22PM',
        },
      ]
    },

    {
      'id':13,
      'name': 'Kullanıcı 5',
      'comment': "Trafik sabah saatlerinde çok yoğun",
      'date': '1 Days ago',
      'time': '02:42PM',
      'userImage':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSScggm3yrSeHu9b_LTTn7MKKw0j_QpQbdvaY9ZIZB8GfppWx-x&s',
      'replies': []
    },
  ];

  @override
  void initState() {
    super.initState();

    importData(commentsList);
  }

  void importData(List commentsList) {
    for (int i = 0; i < commentsList.length; i++) {
      Comment comment = new Comment();

      comment.id= commentsList[i]['id'];
      comment.setName = commentsList[i]['name'];
      comment.setComment = commentsList[i]['comment'];
      comment.setDate = commentsList[i]['date'];
      comment.setTime = commentsList[i]['time'];
      comment.setUserProfileImage = commentsList[i]['userImage'];
      List<Comment> internalTemp = List<Comment>.empty(growable: true);

      for (int j = 0; j < commentsList[i]['replies'].length; j++) {
        Comment comment = new Comment();

        comment.id = commentsList[i]['replies'][j]['id'];
        comment.setName = commentsList[i]['replies'][j]['name'];
        comment.setComment = commentsList[i]['replies'][j]['comment'];
        comment.setDate = commentsList[i]['replies'][j]['date'];
        comment.setTime = commentsList[i]['replies'][j]['time'];
        comment.setUserProfileImage =
            commentsList[i]['replies'][j]['userImage'];
        internalTemp.add(comment);
      }

      comment.internalComment = internalTemp;

      dataList.add(comment);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Yorumlar"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  "Yorumlar",
                  style: TextStyle(
                      color: Utils.black,
                      fontSize: SizeConfig.safeBlockHorizontal! * 7,
                      fontWeight: FontWeight.bold),
                )),
            Divider(
              height: 2,
            ),
            Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: renderComment(dataList)),
            Visibility(
              visible: true,
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
                child: TextFormField(
                  controller: commentController,
                  cursorColor: Colors.black,
                  maxLines: 10,
                  minLines: 8,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10),
              child: FlatButton(
                onPressed: () {
                  if (commentController.text.length > 0) {
                    final df = new DateFormat('hh:mm a');
                    final dfDate = new DateFormat('dd, MMM yy');
                    Comment comment = new Comment();
                    comment.id = Random(123).nextInt(543);
                    comment.setName = "Ishank";
                    comment.setComment = commentController.text;
                    comment.setDate = dfDate.format(DateTime.now());
                    comment.setTime = df.format(DateTime.now());
                    comment.setUserProfileImage =
                        "https://i.dailymail.co.uk/1s/2019/01/29/23/9155772-0-image-a-21_1548805444266.jpg";

                    setState(() {
                      dataList.add(comment);
                      commentController.clear();
                    });
                  } else {
                    Utils().showToast("Yorumunuzu giriniz");
                  }
                },
                color: Colors.blueAccent,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.mode_edit,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Yorum ekle",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal! * 4.5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderComment(List<Comment> comments) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
//            commentItem(context, comments[index], false),
            CommentItem(comment: comments[index], isInternal: false),
            comments[index].internalComment != null &&
                    comments[index].internalComment.length > 0
                ? renderInternalComment(
                    context, comments[index].internalComment)
                : Container()
          ],
        );
      },
    );
  }

  renderInternalComment(BuildContext context, List comments) {
    return Column(
        children: comments
            .map((comment) => CommentItem(comment: comment, isInternal: true))
            .toList());
  }
}
