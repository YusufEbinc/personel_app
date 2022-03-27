import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:personel_app/model/users_data_model.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    get();
  }
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloading = false;

  int? selectIndex = 0;
  List<UsersData> list = [];
  Future<void> addData(UsersData usersData) async {
    try {
      await _firebaseFirestore
          .collection(_auth.currentUser!.email!)
          .add(usersData.toMap());
    } on FirebaseException catch (error) {
      return debugPrint('error: ${error.toString()}');
    }
  }

  Future<void> get() async {
    try {
      isloading = true;
      var result =
          await _firebaseFirestore.collection(_auth.currentUser!.email!).get();

      list = result.docs.map((e) => UsersData.fromMap(e.data())).toList();
      isloading = false;
    } on FirebaseException catch (error) {
      throw Exception(error);
    }
    notifyListeners();
  }

  void radioButtonOntap(int? index, BuildContext context) {
    if (index == 1) {
      list.sort((b, a) => a.date!.compareTo(b.date!));
      selectIndex = index;
      Navigator.pop(context);
    }
    if (index == 2) {
      list.sort((a, b) => a.price!.compareTo(b.price!));
      selectIndex = index;
      Navigator.pop(context);
    }
    if (index == 3) {
      list.sort((b, a) => a.price!.compareTo(b.price!));
      selectIndex = index;
      Navigator.pop(context);
    }
    notifyListeners();
  }
}
