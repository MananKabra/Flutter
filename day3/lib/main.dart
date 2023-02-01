// import 'package:flutter/material.dart';
//
// //For hot reload to work the change must be in stateful/stateless widget
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {  //Stateless widget overrides the build() method and returns a widget
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(  //To prevent content to overlap the notches
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container( //If no child, it takes max space possible else take the size of the child
//                 color: Colors.red,  //Container is a layout widget
//                 width: 100,
//                 height: double.infinity,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container( //If no child, it takes max space possible else take the size of the child
//                     color: Colors.yellow,  //Container is a layout widget
//                     height: 100,
//                     width: 100,
//                   ),
//                   Container( //If no child, it takes max space possible else take the size of the child
//                     color: Colors.green,  //Container is a layout widget
//                     height: 100,
//                     width: 100,
//                   ),
//                 ],
//               ),
//               Container( //If no child, it takes max space possible else take the size of the child
//                 color: Colors.blue,  //Container is a layout widget
//                 width: 100,
//                 height: double.infinity,
//               ),
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }
//
// //Column and Row are layout widgets for multiple child unlike Container
// //They have properties like:
// //mainAxisAlignment, mainAxisSize (Same 2 for crossAxis too)
// //double.infinity is used to take the max space possible
// //Nested code for columns, columns and rows is done

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';

//For hot reload to work the change must be in stateful/stateless widget
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Stateless widget overrides the build() method and returns a widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            //To prevent content to overlap the notches
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile.jpg"),
              ),
              Text(
                "Manan Kabra",
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'PatrickHand',
                    fontWeight: FontWeight.w100,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 10,
                width: 300,
                child: Divider(   //To get a dividing line
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              Card(
                color: Colors.white,
                //padding: EdgeInsets.all(10),   //Card widget does not have padding
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(   //Icons are drawn directly and are included in the material class
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+91 8053256355",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ),
              Card(
                //padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                color: Colors.white,
                child: ListTile(  //Using listtile for shorter and better code, comes with padding
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "manankabra200318@gmail.com",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

//Column and Row are layout widgets for multiple child unlike Container
//They have properties like:
//mainAxisAlignment, mainAxisSize (Same 2 for crossAxis too)
//double.infinity is used to take the max space possible
//Nested code for columns, columns and rows is done
