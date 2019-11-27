import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Map<String, dynamic> data;
  Details(this.data);
  @override
  _DetailsState createState() => _DetailsState(this.data);
}

class _DetailsState extends State<Details> {
  Map<String, dynamic> data;
  _DetailsState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(data['image'])),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text(
                data['label'],
                style: TextStyle(fontSize: 31, fontFamily: 'comic'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Card(
                color: Color(0xff639D64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Diet Labels',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'comic',
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data['dietLabels'][0],
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'comic',
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Color(0xff639D64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cautions',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'comic',
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data['cautions'][0],
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'comic',
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Color(0xff2ECC72),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      Text('Health Labels',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'comic',
                              color: Colors.white)),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 100.0),
                        child: ListView.builder(
                          itemCount: data['healthLabels'].length,
                          itemBuilder: (BuildContext cnt, int index) {
                            return Center(
                              child: Text(data['healthLabels'][index],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'comic',
                                      color: Colors.white)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Ingredients',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'comic',
                      color: Color(0xff2ECC72))),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              itemCount: data['ingredientLines'].length,
              itemBuilder: (BuildContext c, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 8, 3),
                  child: Text(data['ingredientLines'][index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text('Other Info',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'comic',
                      color: Color(0xff2ECC72))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '${data['totalNutrients']['ENERC_KCAL']['label']} : ${data['totalNutrients']['ENERC_KCAL']['quantity'].round()} ${data['totalNutrients']['ENERC_KCAL']['unit']}',
                style: TextStyle(fontSize: 33.0, fontFamily: 'comic'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '${data['totalNutrients']['FAT']['label']} : ${data['totalNutrients']['FAT']['quantity'].round()} ${data['totalNutrients']['FAT']['unit']}',
                style: TextStyle(fontSize: 33.0, fontFamily: 'comic'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '${data['totalNutrients']['CHOCDF']['label']} : ${data['totalNutrients']['CHOCDF']['quantity'].round()} ${data['totalNutrients']['CHOCDF']['unit']}',
                style: TextStyle(fontSize: 33.0, fontFamily: 'comic'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '${data['totalNutrients']['PROCNT']['label']} : ${data['totalNutrients']['PROCNT']['quantity'].round()} ${data['totalNutrients']['PROCNT']['unit']}',
                style: TextStyle(fontSize: 33.0, fontFamily: 'comic'),
              ),
            ),
          ),
          // ConstrainedBox(
          //   constraints: BoxConstraints(maxHeight: 200),
          //   child: ListView.builder(
          //     itemCount: data['totalNutrients'].length,
          //     itemBuilder: (BuildContext cn, int index) {
          //       return Text(data['totalNutrients'][index]['label']);
          //     },
          //   ),
          // )

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text('Made with ♥️ by Piyush Garg',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff2ECC72),
                      fontFamily: 'comic')),
            ),
          )
        ],
      ),
    );
  }
}

//  Text('Some Text',
//                           style: TextStyle(
//                               fontSize: 16.0,
//                               fontFamily: 'comic',
//                               color: Colors.white))
