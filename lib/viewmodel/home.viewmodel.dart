
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:user_crud_reqres/model/abstracts/user.repository.dart';
import 'package:user_crud_reqres/model/user.model.dart';
import 'package:user_crud_reqres/view/home/home.view.dart';

import '../config/api.config.dart';

class UserViewModel extends UserRepository{
  final HomeViewState state;
  UserViewModel({Key? key, required this.state});
  List<Users> listUsers=[];
  bool isLoading=false;

  @override
  Future<void> add() {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> edit() {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<void> fetchData() async{
    state.setState(() {
      isLoading=true;
    });
    final response= await ApiConfig.instance.get('users?page=2');
    if(response!='error' && response!='fatal'){
      state.setState(() {
        listUsers=UserModel.fromJson(jsonDecode(response)).data!;
        isLoading=false;
      });
    }else{
      state.setState(() {
        isLoading=false;
      });
    }
  }



}