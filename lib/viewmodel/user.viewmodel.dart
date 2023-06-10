import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:user_crud_reqres/model/abstracts/user.repository.dart';
import 'package:user_crud_reqres/model/user.model.dart';
import 'package:user_crud_reqres/view/home/home.view.dart';

import '../config/api.config.dart';

class UserViewModel extends UserRepository {
  final HomeViewState state;

  UserViewModel({Key? key, required this.state});

  List<Users> listUsers = [];
  bool isLoading = false;
  bool onEdit = false;
  @override
  void delete(id) async {
    state.setState(() {
      isLoading = true;
    });
    final response = await ApiConfig.instance.delete('users/$id');
    if (response == 'success') {
      state.setState(() {
        listUsers.removeWhere((element) => element.id == id);
        isLoading = false;
      });
    } else {
      state.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Future<void> fetchData() async {
    state.setState(() {
      isLoading = true;
    });
    final response = await ApiConfig.instance.get('users?page=2');
    if (response != 'error' && response != 'fatal') {
      state.setState(() {
        listUsers = UserModel.fromJson(jsonDecode(response)).data!;
        isLoading = false;
      });
    } else {
      state.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void add(String fistName, String lastName, String email) async {
    state.setState(() {
      isLoading = true;
    });
    final response = await ApiConfig.instance.post(
      'users',
      data: jsonEncode({
        'first_name': fistName,
        'last_name': lastName,
        'email': email,
      }),
    );
    if (response != 'error' && response != 'fatal') {
      state.setState(() {
        listUsers.add(Users(
            firstName: fistName,
            lastName: lastName,
            email: email,
            avatar: 'https://reqres.in/img/faces/11-image.jpg',
            id: int.parse(jsonDecode(response)['id'])));
        isLoading = false;
      });
    } else {
      state.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void edit(id, String fistName, String lastName, String email) async{
    state.setState(() {
      isLoading = true;
    });
    final response = await ApiConfig.instance.put(
      'users/$id',
      data: jsonEncode({
        'first_name': fistName,
        'last_name': lastName,
        'email': email,
      }),
    );
    if (response != 'error' && response != 'fatal') {
      ///update data
      print('update');
      state.setState(() {
        listUsers.forEach((element) {
          if(element.id==id){
            element.firstName=fistName;
            element.lastName=lastName;
            element.email=email;
          }
        });
        isLoading = false;
      });
    } else {
      state.setState(() {
        isLoading = false;
      });
    }
  }
}
