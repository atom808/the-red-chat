import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';
import 'package:flutter_chat_ui_starter/screens/chat_screen.dart';


class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )
      ),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index){
            final Message chat = chats[index];
            return Padding(
              padding: EdgeInsets.all(3.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          user: chat.sender,
                        ),
                    )
                ),
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: chat.unread ? Colors.grey[50] : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        child: Container(
                          child: CircleAvatar(
                            radius: 26.0,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          width: 56.0,
                          height: 56.0,
                            decoration: BoxDecoration(
                              color: Colors.green, // border color
                              shape: BoxShape.circle,
                            )

                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              chat.sender.name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: Text(
                                chat.text,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              chat.time,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: chat.unread ? Colors.red : Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
