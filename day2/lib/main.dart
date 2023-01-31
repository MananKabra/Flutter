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

class MyApp extends StatelessWidget {  //Stateless widget overrides the build() method and returns a widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(  //To prevent content to overlap the notches
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/profile.jpg"),
                ),
              ],
            )
        ),
      ),
    );
  }
}

//Column and Row are layout widgets for multiple child unlike Container
//They have properties like:
//mainAxisAlignment, mainAxisSize (Same 2 for crossAxis too)
//double.infinity is used to take the max space possible
//Nested code for columns, columns and rows is done
