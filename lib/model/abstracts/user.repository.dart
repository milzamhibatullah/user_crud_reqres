
import 'package:user_crud_reqres/model/user.model.dart';

abstract class UserRepository {
  Future<void> fetchData();
  void add(String fistName,String lastName,String email);
  void edit(id,String fistName,String lastName,String email);
  void delete(id);

}