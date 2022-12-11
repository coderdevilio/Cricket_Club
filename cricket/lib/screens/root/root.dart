import 'package:cricket/models/authModel.dart';
import 'package:cricket/models/userModel.dart';
import 'package:cricket/screens/login/login.dart';
import 'package:cricket/screens/noGroup/noGroup.dart';
import 'package:cricket/screens/splashScreen/splashScreen.dart';
import 'package:cricket/services/dbStream.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  unknown,
  notLoogedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;
  String currentUid;

  @override
  void didChangeDependencies() async {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    //get the state
    //check the state
    //check auth status based on state
    AuthModel _authStream = Provider.of<AuthModel>(context);

    if (_authStream != null) {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
        currentUid = _authStream.uid;
      });
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoogedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = SplashScreen();
        break;
      case AuthStatus.notLoogedIn:
        retVal = Login();
        break;
      case AuthStatus.loggedIn:
        retVal = StreamProvider<UserModel>.value(
          catchError: (context, error) => null,
          value: DBStream().getCurrentUser(currentUid),
          child: LoggedIn(),
        );
        break;
      default:
    }

    return retVal;
  }
}

class LoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel _userStream = Provider.of<UserModel>(context);
    Widget retVal;
    
  if (_userStream != null) {
    if (_userStream.groupId != null) {
      retVal = NoGroup();
    } else {
      retVal = NoGroup();
    }
 } else {
   retVal = NoGroup();
     }

    return retVal;
  }
}
