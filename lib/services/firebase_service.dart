import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:personel_app/model/users_data_model.dart';

class FirebaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getIndex(int index) {
    switch (index) {
      case 0:
        return FirebaseFirestore.instance
            .collection('yusuf@gmail.com')
            .snapshots();
      case 1:
        return FirebaseFirestore.instance
            .collection('yusuf@gmail.com')
            .orderBy('price', descending: false)
            .snapshots();
      case 2:
        return FirebaseFirestore.instance
            .collection('yusuf@gmail.com')
            .orderBy('price', descending: true)
            .snapshots();
      case 3:
        return FirebaseFirestore.instance
            .collection('yusuf@gmail.com')
            .where(
              'paymnet',
            )
            .snapshots();

      default:
        return FirebaseFirestore.instance
            .collection('yusuf@gmail.com')
            .snapshots();
    }
  }

  Future<void> addData(UsersData usersData) async {
    try {
      await _firebaseFirestore
          .collection(_auth.currentUser!.email!)
          .add(usersData.toMap());
    } on FirebaseException catch (error) {
      return debugPrint('error: ${error.toString()}');
    }
  }

  String convertTimeStamp(Timestamp timestamp) {
    String convertedDate;
    convertedDate = DateFormat.yMMMd().format(timestamp.toDate());
    return convertedDate;
  }
}
