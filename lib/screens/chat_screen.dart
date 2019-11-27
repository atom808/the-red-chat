import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/Widgets/category_selector.dart';
import 'package:flutter_chat_ui_starter/Widgets/frequently_contacted.dart';
import 'package:flutter_chat_ui_starter/Widgets/message_list.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  final Message message;
  ChatScreen({this.user, this.message});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe){
    final Container msg = Container(
      margin:
      isMe ?
      EdgeInsets.only(
        left: 56.0,
        top: 8.0,
        bottom: 8.0,
      ) :
      EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: isMe ? Colors.red[50]: Colors.grey[100],
          borderRadius:
          isMe ?
          BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ) :
          BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: 8.0,),
          Text(
            message.text,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
    if(isMe){
     return msg;
    }
    //Retirar Container de msg para incluir o ícone de coração no container e dar doubleTap pra fav.
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(null),
          iconSize: 20.0,
          color: message.isLiked ? Colors.red : Colors.transparent,
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.user.imageUrl),
          ),
        ),
        title: Text(
          widget.user.name,
          style:
          TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children:<Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                child: ListView.builder(
                  reverse: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    }),
              ),
            ),
          ),
        ]
      ),
    );
  }
}