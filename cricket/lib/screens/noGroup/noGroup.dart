// // import 'package:cricket/createGroup/createGroup.dart';
// // import 'package:cricket/joinGroup/joinGroup.dart';
// import 'package:flutter/material.dart';

// class NoGroup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     void _goToJoin() {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => OurJoinGroup(),
//       //   ),
//       // );
//     }

//     void _goToCreate() {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => OurCreateGroup(),
//       //   ),
//       // );
//     }

//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Spacer(
//             flex: 1,
//           ),
//           Padding(
//             padding: EdgeInsets.all(80.0),
//             child: Image.asset(
//               "assets/logo.png",
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: Text(
//               "Welcome to Cricket Club",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 40.0, color: Colors.white),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Text(
//               "Since you are not in club, you have to either join or create club.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20.0, color: Colors.white),
//             ),
//           ),
//           Spacer(
//             flex: 8,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 RaisedButton(
//                     child: Text("Create"),
//                     onPressed: () => _goToCreate(),
//                     color: Theme.of(context).canvasColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       side: BorderSide(
//                           color: Theme.of(context).secondaryHeaderColor,
//                           width: 2),
//                     )),
//                 RaisedButton(
//                   child: Text(
//                     "Join",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () => _goToJoin(),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class NoGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("shubham aala"),),
      body: Row(children: [
        Text("good for you")
      ],),
      
    );
  }
}