import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:user_crud_reqres/styles/font.styles.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FilledButton.tonalIcon(
        onPressed: () async {
          showModalBottomSheet<void>(
            context: context,
            isDismissible: false,
            useSafeArea: true,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0.r),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8.0.r,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Add New User',style: fontStyles(),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            context.pop();
                          }, icon:const Icon(Icons.close))
                        ],
                      ),
                      SizedBox(height: 16.0.r,),
                      ///field name
                      TextField(
                        style: fontStyles(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          hintText: 'Input your name ...',
                          hintStyle: fontStyles(
                              size: 14.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(.5),
                              weight: FontWeight.w500),
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      SizedBox(height: 8.0.r,),
                      ///field job
                      TextField(
                        style: fontStyles(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(
                            Icons.work,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          hintText: 'Input your job ...',
                          hintStyle: fontStyles(
                              size: 14.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(.5),
                              weight: FontWeight.w500),
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondaryContainer,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      SizedBox(height: 16.0.r,),
                      SizedBox(
                        width: double.infinity,
                        height: 45.0.r,
                        child: FilledButton(
                          onPressed: () {
                            context.go('auth/new-password');
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                              ),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: fontStyles(
                                color:
                                Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0.r,),
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Icon(
          Icons.add_box_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.primary)),
        label: Text(
          'New User',
          style: fontStyles(color: Theme.of(context).colorScheme.onPrimary),
        ),
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
                            FilledButton.tonalIcon(
                                onPressed: () {},
                                icon: const Icon(Icons.edit_note),
                                label: Text(
                                  'Edit',
                                  style: fontStyles(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer),
                                )),
                            IconButton.filledTonal(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
