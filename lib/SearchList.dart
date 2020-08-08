import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Posts.dart';
import 'dart:async';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> with SingleTickerProviderStateMixin{


  TextEditingController editingController = TextEditingController();
  TabController controller;
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
        appBar: AppBar(
          title: Text(''),
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
                      autofocus: true,
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
                      onChanged: (val){}
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
