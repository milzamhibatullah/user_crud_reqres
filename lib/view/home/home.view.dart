import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_crud_reqres/styles/font.styles.dart';
import 'package:user_crud_reqres/view/home/component/action/add.action.component.dart';
import 'package:user_crud_reqres/view/home/component/action/delete.action.component.dart';
import 'package:user_crud_reqres/view/home/component/action/edit.action.component.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  bool isBottomSheetOpen = false;

  ///initialize text editing controller
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddActionComponent(
        nameController: _nameController,
        jobController: _jobController,
        addMethod: add,
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
              ///list users widget
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 16.0.r),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 64.0.r),
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    12,
                    (index) => Card(
                      elevation: 1.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 24.0.r,
                              backgroundImage: NetworkImage(
                                  'https://reqres.in/img/faces/7-image.jpg'),
                            ),
                            SizedBox(
                              width: 8.0.r,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Michael Lawson',
                                  style: fontStyles(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.0.r),
                                Text(
                                  'Michael@gmail.com',
                                  style: fontStyles(
                                      size: 10.0,
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
                            const Spacer(),
                            EditActionComponent(
                              nameController: _nameController,
                              jobController: _jobController,
                              editMethod: edit,
                            ),
                            DeleteActionComponent(
                              deletMethod: delete,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void delete() {}

  void add() {}

  void edit() {}
}
