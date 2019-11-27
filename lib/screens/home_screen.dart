import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/Widgets/category_selector.dart';
import 'package:flutter_chat_ui_starter/Widgets/frequently_contacted.dart';
import 'package:flutter_chat_ui_starter/Widgets/message_list.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/screens/group_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(currentUser.imageUrl),
            ),
          ),
          title: Text(
            'theREDchat',
            style:
              TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w200,
              ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
              child: Column(
                children: <Widget>[
                  FrequentlyContacted(),
                  Expanded(child: MessageList()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
