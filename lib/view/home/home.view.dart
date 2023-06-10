import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_crud_reqres/config/api.config.dart';
import 'package:user_crud_reqres/model/abstracts/user.repository.dart';
import 'package:user_crud_reqres/model/user.model.dart';
import 'package:user_crud_reqres/styles/font.styles.dart';
import 'package:user_crud_reqres/view/home/component/action/add.action.component.dart';
import 'package:user_crud_reqres/view/home/component/action/delete.action.component.dart';
import 'package:user_crud_reqres/view/home/component/action/edit.action.component.dart';
import 'package:user_crud_reqres/viewmodel/home.viewmodel.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  ///define user view model as transaction state
  late UserViewModel userViewModel;

  ///initialize text editing controller
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  @override
  void initState() {
    ///initialize user view model
    userViewModel = UserViewModel(state: this)..fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddActionComponent(
        nameController: _nameController,
        jobController: _jobController,
        addMethod: userViewModel.add,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Welcome',
          style: fontStyles(
              color: Theme.of(context).colorScheme.onPrimary,
              size: 18.0,
              weight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (userViewModel.isLoading) ...[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 56.0.r),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ] else ...[
                ///list users widget
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0.r, vertical: 16.0.r),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 64.0.r),
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      userViewModel.listUsers.length,
                      (index) => Card(
                        elevation: 1.0,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24.0.r,
                                backgroundImage: NetworkImage(
                                    userViewModel.listUsers[index].avatar!),
                              ),
                              SizedBox(
                                width: 8.0.r,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${userViewModel.listUsers[index].firstName!} ${userViewModel.listUsers[index].lastName!}',
                                      style: fontStyles(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8.0.r),
                                    Text(
                                      userViewModel.listUsers[index].email!,
                                      style: fontStyles(
                                          size: 12.0,
                                          weight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer
                                              .withOpacity(.5)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0.r),
                              EditActionComponent(
                                nameController: _nameController,
                                jobController: _jobController,
                                editMethod: userViewModel.edit,
                              ),
                              DeleteActionComponent(
                                deletMethod: userViewModel.delete,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
