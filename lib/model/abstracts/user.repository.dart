
import 'package:user_crud_reqres/model/user.model.dart';

abstract class UserRepository {
  Future<void> fetchData();
  Future<void> add();
  Future<void> edit();
  Future<void> delete();

}