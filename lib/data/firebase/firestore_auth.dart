import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tashil_food_app/data/auth/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

  addUserToFireStore(UsersModel usersModel) async {
    await _usersCollection.doc(usersModel.id).set(usersModel.toJson());
  }

  Future<UsersModel> getUserFromFireStore(String uid) async {
    final data = await _usersCollection.doc(uid).get();
    final dataUser = UsersModel.fromJson(data.data() as Map<String, dynamic>);
    return dataUser;
  }

  Future upDateDataImageAndName({
    required String tableName,
    required String id,
    required String img,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final docUser = FirebaseFirestore.instance.collection(tableName).doc(id);
    docUser.update(
      {
        'image': img,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phone
      },
    );
  }

  Future upDateDataName({
    required String tableName,
    required String id,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final docUser = FirebaseFirestore.instance.collection(tableName).doc(id);
    docUser.update(
      {'firstName': firstName, 'lastName': lastName, 'phoneNumber': phone},
    );
  }
}
