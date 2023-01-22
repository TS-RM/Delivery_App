import 'package:tashil_food_app/data/auth/model/user_model.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';

class UserService {
  Future<UsersModel> getUserById(String id) async {
    final data = await CrudFirebase()
        .readDataOneRow(tableName: UsersModel().tableName, id: id);
    return UsersModel.fromJson(data as Map<String, dynamic>);
  }
}
