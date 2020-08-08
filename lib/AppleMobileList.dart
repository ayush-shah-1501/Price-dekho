import 'dart:async';
import 'package:flutter/material.dart';
import 'Posts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'productdetails.dart';



class AppleMobileList extends StatefulWidget {
  @override
  _AppleMobileListState createState() => _AppleMobileListState();
}

class _AppleMobileListState extends State<AppleMobileList> {

  final notesReference = FirebaseDatabase.instance.reference().child('products').child('mobiles');

  List<Note> items;
  StreamSubscription<Event> _onNoteAddedSubscription;

  @override
  void initState() {

    super.initState();
    items = new List();
    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
  }

  @override
  void dispose(){
    _onNoteAddedSubscription.cancel();
    super.dispose();
  }

  void _onNoteAdded(Event event) {
    setState(() {
      items.add(new Note.fromSnapshot(event.snapshot));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        IconButton(
                          padding: EdgeInsets.only(left: 70.0),
                          icon: Icon(Icons.search),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  Text('APPLE',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  SizedBox(width: 10.0),
                  Text('mobiles',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 25.0))
                ],
              ),
            ),
            SizedBox(height: 40.0,),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(
                                    new MaterialPageRoute(builder: (
                                        BuildContext context) => new productdetails('${items[index].a_title}','${items[index].image_url}','${items[index].a_price.toString()}', '${items[index].f_price.toString()}','${items[index].a_link}','${items[index].f_link}'))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                        Image(
                                                image: NetworkImage('${items[index].image_url}'),
                                                fit: BoxFit.fill,
                                                height: 100.0,
                                                width: 60.0
                                            ),

                                          SizedBox(width: 30.0),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  '${items[index].a_title}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 10.0,
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),
                                              SizedBox(height: 10.0,),
                                              Text(
                                                  '${items[index].f_price}'.toString(),
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 15.0,
                                                      color: Colors.grey
                                                  )
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      InkWell(
                        onTap: (){print("tapped");},
                        child:   Container(
                          height: 65.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF1C1428),
                          ),
                          child: Center(
                            child: Row(
                              children: <Widget>[

                                SizedBox(width: 20.0,),
                                Icon(Icons.filter_list, color: Colors.white),
                                SizedBox(width: 10.0,),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){print("tapped");},
                        child: Container(
                          height: 65.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF1C1428),
                          ),
                          child: Center(
                            child: Row(
                              children: <Widget>[

                                SizedBox(width: 20.0,),
                                Icon(Icons.swap_vert, color: Colors.white),
                                SizedBox(width: 10.0,),
                                Text(
                                  'Sort',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
