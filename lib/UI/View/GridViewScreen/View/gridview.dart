import 'package:flutter/material.dart';

class Gridview extends StatefulWidget {
  const Gridview({Key? key}) : super(key: key);

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: GridView.builder(
        itemCount:4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).orientation ==
              Orientation.landscape ? 3: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemBuilder: (context,index) {
          return GestureDetector(
            onTap:(){
            },
            child:Container(
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.access_alarms_sharp),
                  Text('Hello',style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
