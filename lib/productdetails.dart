import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class productdetails extends StatelessWidget {

  TabController _tabController;
  final String title;
  final String image;
  final String a_price;
  final String f_price;
  final String a_link;
  final String f_link;
  productdetails(this.title, this.image, this.a_price, this.f_price, this.a_link, this.f_link);
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[350],
          appBar: new AppBar(
            backgroundColor: Colors.grey[600],
            bottom: TabBar(tabs: [
              Tab(text: 'Prices'),
              Tab(text: 'SPECS'),
            ]),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
            elevation: 0.0,
            title: Text(title,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    color: Colors.white)),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
                color: Colors.white,
              )
            ],
          ),
          body: TabBarView(
              children: <Widget>[
                Center(
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.all(0.0),
                      children: <Widget>[
                        Container(
                          height: 250,
                          width: 137,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white,width: 0
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              image: DecorationImage(
                                  image: NetworkImage(image)
                              )
                          ),
                        ),
                        Container(
                          height: 100,
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 10.0,top: 7.0),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ), 
                        Container(
                          height: 30, 
                          width: 394, 
                          alignment: Alignment(0,0),
//                    padding: EdgeInsets.only(left: 10.0,top: 7.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 0),borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ), 
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 30, 
                                width: 137,
//                          color: Colors.white,
                                alignment: Alignment(0.0,0.0), 
                                child: Text(
                                  "Company", 
                                  style: TextStyle(
                                    fontSize: 13, 
                                    color: Colors.black,
                                  ),
                                ),
                              ), 
                              VerticalDivider(color: Colors.black,width: 1,), 
                              Container(
                                width: 137, 
                                alignment: Alignment(0.0,0.0), 
                                child: Text(
                                  "PRICES", 
                                  style: TextStyle(
                                    fontSize: 13, 
                                    color: Colors.black,
                                  ),
                                ),
                              ), 
                              VerticalDivider(color: Colors.black, width: 2,), 
                              Container(
                                width: 100, 
                                alignment: Alignment(0.0,0.0), 
                                child: Text(
                                  "Buy", 
                                  style: TextStyle(
                                    fontSize: 13, 
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), 
                        Container(
                          height: 70, 
                          color: Colors.white, 
                          alignment: Alignment(-0.95,0.0), 
                          padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 7.0), 
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 60,
                                width: 137, 
                                decoration: BoxDecoration(
                                    color: Colors.white, 
                                    border: Border.all(color: Colors.black,width: 0),borderRadius: BorderRadius.all(Radius.circular(8.0)), 
                                    image: DecorationImage(
                                        image: AssetImage('images/image_1.jpg')
                                    )
                                ),
                              ), 
                              Container(
                                padding: EdgeInsets.only(top: 5,right: 6), 
                                height: 60, 
                                width: 30, 
                                alignment: Alignment(7.0,0.0), 
                                child: Text(
                                  'RS.',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ), 
                              Container(
                                padding: EdgeInsets.all(8.0), 
                                height: 60, 
                                width: 80, 
                                alignment: Alignment(0.0,0.0), 
                                child: Text(
                                  f_price,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ), 
                              Container(
                                height: 60, 
                                width: 132, 
                                child: new ButtonBar(
                                  mainAxisSize: MainAxisSize.min, 
                                  children: <Widget>[
                                    new RaisedButton(
                                      elevation: 5.0,
                                      child: new Text('BUY >',style: TextStyle(fontSize: 10.0),),
                                      onPressed: (){
                                        launch(f_link);
                                        },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          color: Colors.white,
                          alignment: Alignment(-0.95,0.0),
                          padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 7.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 60,
                                width: 137,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black,width: 0),borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    image: DecorationImage(
                                        image: AssetImage('images/image_2.png')
                                    )
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5,right: 6),
                                height: 60,
                                width: 30,
                                alignment: Alignment(7.0,0.0),
                                child: Text('RS.',style: TextStyle(fontSize: 12.0),),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                height: 60,
                                width: 80,
                                alignment: Alignment(0.0,0.0),
                                child: Text(
                                  a_price,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 132,
                                child: new ButtonBar(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new RaisedButton(
                                      elevation: 5.0,
                                      child: new Text('BUY >',style: TextStyle(fontSize: 10.0),),
                                      onPressed: (){
                                        launch(a_link);
                                        },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(title)
                ),
              ],
            controller: _tabController,
          ),
        )
    );
  }
}





//class Forspecs extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: ListView(
//        padding: EdgeInsets.all(0.0),
//        children: <Widget>[
//          Container(
//              height: 30,
//              color: Colors.grey[200],
//              padding: EdgeInsets.only(left: 10),
//              child: Text("STORAGE",style: TextStyle(fontSize: 17,color: Colors.black),),
//              alignment: Alignment(-1.0,0.0)
//
//          ),
//          Container(
//            height: 1,
//            color: Colors.grey[400],
//          ),
//          Container(
//            height: 25,
//            color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top:2,bottom: 2,left: 10,right: 5),
//                  width: 150,
//                  alignment: Alignment(-1.0,0.0),
//                  child:
//                  Text('RAM',style: TextStyle(fontSize: 15.0),),
//                ),
//                VerticalDivider(color: Colors.black, width: 2,),
//                Container(
//                  padding: EdgeInsets.only(left: 25,right: 5),
//
//                  //alignment: Alignment(2.0,0.0),
//                  child:
//                  Text(snapshot.data[0].title,style: TextStyle(fontSize: 15.0),),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: 1,
//            color: Colors.grey[400],
//          ),
//          Container(
//            height: 25,
//            color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top:2,bottom: 2,left: 10,right: 5),
//                  width: 150,
//                  alignment: Alignment(-1.0,0.0),
//                  child:
//                  Text('Internal',style: TextStyle(fontSize: 15.0),),
//                ),
//                VerticalDivider(color: Colors.black, width: 2,),
//                Container(
//                  padding: EdgeInsets.only(left: 25,right: 5),
//
//                  //alignment: Alignment(2.0,0.0),
//                  child:
//                  Text(snapshot.data[0].title,style: TextStyle(fontSize: 15.0),),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: 1,
//            color: Colors.grey[400],
//          ),
//          Container(
//            height: 25,
//            color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top:2,bottom: 2,left: 10,right: 5),
//                  width: 150,
//                  alignment: Alignment(-1.0,0.0),
//                  child:
//                  Text('Expandable',style: TextStyle(fontSize: 15.0),),
//                ),
//                VerticalDivider(color: Colors.black, width: 2,),
//                Container(
//                  padding: EdgeInsets.only(left: 25,right: 5),
//
//                  //alignment: Alignment(2.0,0.0),
//                  child:
//                  Text(snapshot.data[0].title,style: TextStyle(fontSize: 15.0),),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: 1,
//            color: Colors.grey[400],
//          ),
//          Container(
//              height: 30,
//              color: Colors.grey[200],
//              padding: EdgeInsets.only(left: 10),
//              child: Text("PROCESSOR",style: TextStyle(fontSize: 17,color: Colors.black),),
//              alignment: Alignment(-1.0,0.0)
//          ),
//          Container(
//            height: 25,
//            color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top:2,bottom: 2,left: 10,right: 5),
//                  width: 150,
//                  alignment: Alignment(-1.0,0.0),
//                  child:
//                  Text('Chipset',style: TextStyle(fontSize: 15.0),),
//                ),
//                VerticalDivider(color: Colors.black, width: 2,),
//                Container(
//                  padding: EdgeInsets.only(left: 25,right: 5),
//
//                  //alignment: Alignment(2.0,0.0),
//                  child:
//                  Text(snapshot.data[0].title,style: TextStyle(fontSize: 15.0),),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: 1,
//            color: Colors.grey[400],
//          ),
//          Container(
//            height: 25,
//            color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top:2,bottom: 2,left: 10,right: 5),
//                  width: 150,
//                  alignment: Alignment(-1.0,0.0),
//                  child:
//                  Text('CPU',style: TextStyle(fontSize: 15.0),),
//                ),
//                VerticalDivider(color: Colors.black, width: 2,),
//                Container(
//                  padding: EdgeInsets.only(left: 25,right: 5),
//
//                  //alignment: Alignment(2.0,0.0),
//                  child:
//                  Text(snapshot.data[0].title,style: TextStyle(fontSize: 15.0),),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: 1,
//            color: Colors.grey[400],
//          ),
//          Container(
//            height: 25,
//            color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top:2,bottom: 2,left: 10,right: 5),
//                  width: 150,
//                  alignment: Alignment(-1.0,0.0),
//                  child:
//                  Text('Graphics',style: TextStyle(fontSize: 15.0),),
//                ),
//                VerticalDivider(color: Colors.black, width: 2,),
//                Container(
//                  padding: EdgeInsets.only(left: 25,right: 5),
//
//                  //alignment: Alignment(2.0,0.0),
//                  child:
//                  Text(snapshot.data[0].title,style: TextStyle(fontSize: 15.0),),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            height: 1,
//            color: Colors.grey[400],
//          ),
//
//        ],
//      ),
//    );
//  }
//}
