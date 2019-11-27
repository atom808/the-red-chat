import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectIndex = 0;
  final List<String> categories = ['Chats' , 'Groups' ,'Contacts', 'Status', ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectIndex = index;
              });
            }, //funçao pra selecionar o text do listViewBuilder
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 23.0
              ),
              child: Container(
                decoration: index == selectIndex ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    )
                  )
                ) : BoxDecoration(),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: index == selectIndex ? FontWeight.w600 : FontWeight.w300,
                    letterSpacing: 1.0,
                    color: index == selectIndex ?  Colors.white : Colors.red[100],
                 ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
