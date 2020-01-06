import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/model/commit.dart';
import 'package:github_demo/utils/colors.dart';
import 'package:github_demo/utils/screen_util.dart';
import 'package:github_demo/utils/strings.dart';
import 'package:github_demo/utils/text_styles.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;


class Home_screen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<Home_screen> {
  List<Commit> marraylist = new List<Commit>();
  bool _isInAsyncCall = false;

  @override
  void initState() {
    super.initState();
    get_Commit_list();
  }

  Future<Map> get_Commit_list() async {

    setState(() {
      _isInAsyncCall = true;
    });

    final response = await http.get(AppStrings.api_url);

    final jsonResponse = json.decode(response.body);
    var jsonn = jsonResponse;

    for (var items in jsonn) {
      Map myMap = items;
      Commit model = new Commit();
      model.sha = myMap['sha'];
      model.node_id = myMap['node_id'];
      model.url = myMap['url'];
      model.message = myMap['commit']['message'];
      model.date = myMap['commit']['committer']['date'];
      model.login = myMap['author']['login'];
      model.avatar_url = myMap['author']['avatar_url'];

      marraylist.add(model);
    }

    setState(() {
      _isInAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.off_white,
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.0,
        title: Text(AppStrings.label_home, style: TextStyles.text_title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: AppColors.white,
              size: 24.0,
            ),
            onPressed: () {
              marraylist.clear();
              get_Commit_list();
            },
          ),
        ],
      ),
      body: ModalProgressHUD(
        opacity: 0.7,
        color: Colors.black,
            child: ListView.builder(
                        itemCount: marraylist.length,
                        itemBuilder: (context, position) {
                          return GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Text(marraylist[position].message,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyles.text_bold),
                                          ),

                                          Container(
                                              child: Row(
                                                children: <Widget>[
                                                  ClipRRect(
                                                      child: FadeInImage.assetNetwork(
                                                        placeholder: 'https://picsum.photos/250?image=10',
                                                        image: marraylist[position].avatar_url,
                                                        width: Constant.texIconSize,
                                                        height: Constant.texIconSize,
                                                      )),

                                                  Flexible(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin: EdgeInsets.only(left:5),
                                                            child: Text(marraylist[position].login,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: TextStyles.text_small_bold),
                                                          ),

                                                          Container(
                                                            margin: EdgeInsets.only(left:5),
                                                            child: Text(marraylist[position].date,
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 2,
                                                                style: TextStyles.text_small),
                                                          ),
                                                        ],
                                                      )
                                                  )

                                                ],
                                              )
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              )
                          );
                        }),
          inAsyncCall: _isInAsyncCall)
    );
  }
}
