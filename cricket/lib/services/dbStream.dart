import 'package:cricket/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBStream {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<UserModel> getCurrentUser(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(doc: docSnapshot));
  }
}
