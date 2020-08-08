import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Posts.dart';
import 'dart:async';
import 'SearchList.dart';
import 'MobileView.dart';
import 'laptop.dart';
import 'television.dart';
import 'camara.dart';
import 'AppleMobileList.dart';
import 'OppoMobileList.dart';
import 'SamsungMobileList.dart';
import 'VivoMobileList.dart';
import 'MiMobileList.dart';
import 'settings.dart';
import 'productdetails.dart';


void main() => runApp(new MaterialApp(home:MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  final List<String> images = ['images/mslider1.jpg','images/mslider2.jpg','images/mslider3.jpg','images/mslider1.jpg'];
  final notesReference = FirebaseDatabase.instance.reference().child('products').child('mobiles');
  List<Note> items;
  StreamSubscription<Event> _onNoteAddedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List();
    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
  }

  @override
  void dispose(){

    _onNoteAddedSubscription.cancel();
    // TODO: implement dispose
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
        appBar: new AppBar(
          title: new Text('Price Dekho'),
          elevation: 30.0,
        ),
      body: ListView(

        padding: EdgeInsets.all(4.0),

        children: <Widget>[

          SizedBox(height: 10.0,),

          Container(
            child:  Padding(
              padding: EdgeInsets.all(2.0),
              child: Card(
                elevation: 6.0,

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: TextField(
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(builder: (
                            BuildContext context) => new SearchList())),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white,),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

//          Container(
//            padding: EdgeInsets.all(7.0),
//            height: 220.0,
//            child: Swiper(
//              autoplay: true,
//              itemBuilder: (BuildContext context, int ind){
//                return Column(
//                  children: <Widget>[
//                    Container(
//                      height: 200,
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                          image: DecorationImage(image: AssetImage(images[ind]),
//                              fit: BoxFit.cover
//                          )
//                      ),
//                    ),
//                  ],
//                );
//              },
//              itemCount: 4,
//            ),
//          ),

          SizedBox(height: 10.0,),

          Container(

            height: 105.0,
            child: GridView(
              padding: EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8.0
              ),
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(builder: (
                          BuildContext context) => new MobileView())),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        maxRadius: 25.0,
                        child: Icon(Icons.phone_iphone,color: Colors.white,),
                      ),
                      SizedBox(height: 8.0,),
                      Text("Mobile")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(builder: (
                          BuildContext context) => new laptop("Laptop"))),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        maxRadius: 25.0,
                        child: Icon(Icons.laptop_chromebook,color: Colors.white,),
                      ),
                      SizedBox(height: 8.0,),
                      Text("Laptop")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(builder: (
                          BuildContext context) => new television("Mobile"))),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        maxRadius: 25.0,
                        child: Icon(Icons.tv,color: Colors.white,),
                      ),
                      SizedBox(height: 8.0,),
                      Text("Television")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      new MaterialPageRoute(builder: (
                          BuildContext context) => new camara("Mobile"))),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        maxRadius: 25.0,
                        child: Icon(Icons.camera_alt,color: Colors.white,),
                      ),
                      SizedBox(height: 8.0,),
                      Text("Camara")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 1.0),
            height: 260.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(6),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: new InkWell(
                      onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(builder: (
                              BuildContext context) => new productdetails('${items[index].a_title}','${items[index].image_url}','${items[index].a_price.toString()}', '${items[index].f_price.toString()}','${items[index].a_link}','${items[index].f_link}'))),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 170,
                            width: 130,
                            padding: EdgeInsets.only(left: 10, top: 10, bottom: 0, right: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(
                                  height: 160,
                                  width: 90,
                                  image: NetworkImage('${items[index].image_url}'),
                                  fit: BoxFit.fill,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 130,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 130,
                                  child: Center(
                                    child: Text(
                                      '${items[index].a_title}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 130,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 30,
                                        width: 50,
                                        child: Text("Rs.",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 13,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 80,
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          '${items[index].f_price}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    color: Colors.white,
                    margin: EdgeInsets.all(1.5),
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).push(
                          new MaterialPageRoute(builder: (
                              BuildContext context) => new MiMobileList())),
                      child: Image.asset("images/mi.png"),
                    )
                ),
                Container(
                  width: 160.0,
                  height: 160.0,
                  color: Colors.white,
                  margin: EdgeInsets.all(1.5),
                  child: FlatButton(
                      onPressed: () => Navigator.of(context).push(
                          new MaterialPageRoute(builder: (
                              BuildContext context) => new AppleMobileList())),
                      child: Image.asset("images/apple.png")
                  ),
                ),
                Container(
                  width: 160.0,
                  height: 160.0,
                  color: Colors.white,
                  margin: EdgeInsets.all(1.5),
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(builder: (
                            BuildContext context) => new OppoMobileList())),
                    child: Image.asset("images/oppo.png"),
                  ),
                ),
                Container(
                  width: 160.0,
                  height: 160.0,
                  color: Colors.white,
                  margin: EdgeInsets.all(1.5),
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(builder: (
                            BuildContext context) => new VivoMobileList())),
                    child: Image.asset("images/vivo.jpg"),
                  ),
                ),
                Container(
                  width: 160.0,
                  height: 160.0,
                  color: Colors.white,
                  margin: EdgeInsets.all(1.5),
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(builder: (
                            BuildContext context) => new SamsungMobileList())),
                    child: Image.asset("images/samsung.jpg"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
              accountName: new Text('AYUSH SHAH'),
              accountEmail: new Text('aayushshah541@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('A'),
              ),
              decoration: new BoxDecoration(color: Colors.blue),
            ),

            new ListTile(title: new Text('Saved Item'),
              trailing: new Icon(Icons.save),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new settings('Page 1'))),
            ),

            new ListTile(title: new Text('Rate Us'),
              trailing: new Icon(Icons.rate_review),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new settings('Page 2'))),
            ),

            new ListTile(title: new Text('Feedback'),
              trailing: new Icon(Icons.feedback),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new settings('Page 3'))),
            ),

            new ListTile(title: new Text('Share this App'),
              trailing: new Icon(Icons.share),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new settings('share'))),
            ),
          ],
        ),
      ),
    );
  }
}
