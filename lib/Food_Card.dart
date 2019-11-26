import 'package:flutter/material.dart';

class MyFoodCard extends StatefulWidget {
  Map<String, dynamic> data;
  MyFoodCard(this.data);
  @override
  _MyFoodCardState createState() => _MyFoodCardState(this.data);
}

class _MyFoodCardState extends State<MyFoodCard> {
  Map<String, dynamic> data;
  _MyFoodCardState(data1) {
    print(data1.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(
                  'https://assets3.thrillist.com/v1/image/2797371/size/tmg-article_default_mobile.jpg'),
            ),
            SizedBox(
              width: 250.0,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Chicken Curry',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'KFC',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
