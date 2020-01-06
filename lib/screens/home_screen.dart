import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/model/commit.dart';
import 'package:github_demo/utils/colors.dart';
import 'package:github_demo/utils/strings.dart';
import 'package:github_demo/utils/text_styles.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
            onPressed: () {},
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
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Color(0xFF40000000),
                    child: Text(marraylist[position].node_id,
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                );
              }),
          inAsyncCall: _isInAsyncCall),
    );
  }
}
