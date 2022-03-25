import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:personel_app/model/users_data_model.dart';

class FirebaseService extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> addData(UsersData usersData) async {
    try {
      await _firebaseFirestore
          .collection('Usersdd')
          .doc(_auth.currentUser!.email)
          .set({
        'expenses': usersData.expenses,
        'payment': usersData.paymentType,
        'price': usersData.price,
        'date': usersData.date
      });
    } on FirebaseException catch (error) {
      return print('error: ${error.toString()}');
    }
  }
}
