import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'MobileList.dart';

class MobileView extends StatefulWidget {
  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {

  Future<List<Mobile>>getMobiles() async {

    var data = await http.get("http://www.json-generator.com/api/json/get/bTDDQPsLVK?indent=2");
    var jsonData = json.decode(data.body);

    List<Mobile> mobiles = [];

    for(var m in jsonData){

      Mobile mobile = Mobile(m["index"],m["title"], m["price"], m["image"]);
      mobiles.add(mobile);
    }

    print(mobiles.length);
    return mobiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getMobiles(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            }
            else {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 150.0,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text("Welcome To Mobile",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      background: Image.asset('images/mslider1.jpg', fit: BoxFit.cover,),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(padding: EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        color: Colors.deepOrange,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              MaterialButton(
                                onPressed: (){},
                                child: Text(
                                  "New Arrivals".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () => Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) => new MobileList())),
                                child: Text(
                                  "See All".toUpperCase(),
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.6
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index){
                          return Container(
                            child: GestureDetector(
                              onTap: (){print('tapeed');},
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 120.0,
                                    child: Image(
                                      image: NetworkImage(
                                          snapshot.data[index].image
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text(
                                    snapshot.data[index].title,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(

                                    snapshot.data[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: 6,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.pink,
                      child: Text(
                        "Recommend for you".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          onTap: (){},
                          leading: CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.battery_charging_full),
                          ),
                          title: Text("Best Battery Performance"),
                          subtitle: Text(
                            "Starting From 15000",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          onTap: (){},
                          leading: CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.attach_money),
                          ),
                          title: Text("Best Price"),

                          subtitle: Text(
                            "Starting From 15000",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          onTap: (){},
                          leading: CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.music_note),
                          ),
                          title: Text("Best Music Quility"),
                          subtitle: Text(
                            "Starting From 15000",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          onTap: (){},
                          leading: CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.camera),
                          ),
                          title: Text(
                            "Best Camara Performance",
                          ),
                          subtitle: Text(
                            "Starting From 15000",
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }
      ),
    );
  }
}

class Mobile{
  final int index;
  final String title;
  final int price;
  final String image;

  Mobile(this.index,this.title,this.price,this.image);
}
