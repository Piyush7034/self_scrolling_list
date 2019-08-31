import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:indexed_list_view/indexed_list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  IndexedScrollController _controller = new IndexedScrollController();
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Self-scrolling list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Self scrlling List'),
        ),
        body: Container(
          child: IndexedListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              controller: _controller,
              itemBuilder: (BuildContext context, index) {


                return ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      Timer(Duration(seconds: 5), () {
                        _controller.jumpTo(_controller.position.maxScrollExtent);
                      });


                      return Card(
                        margin: EdgeInsets.all(25.0),
                        color: Colors.blue,
                        child: Container(
                          width: 300.0,
                          height: 300,
                          child: Center(
                            child: Text('List Item'),
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
