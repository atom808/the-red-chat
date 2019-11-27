import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/screens/chat_screen.dart';

class FrequentlyContacted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Most Frequent Chats',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              IconButton(
                iconSize: 30.0,
                color: Colors.grey[700],
                icon: Icon(Icons.more_horiz),
                onPressed: (){},
              ),
            ],
          ),
        ),
        Container(
          height: 100.0,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: frequentlyContacted.length,
              itemBuilder: (BuildContext context, int index){
                final Message chat = chats[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 14.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: frequentlyContacted[index],
                          ),
                        )
                    ),
                    child: Column(
                      children:<Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(frequentlyContacted[index].imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            frequentlyContacted[index].name,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                );
              }
          ),
        ),
      ]
    );
  }
}
