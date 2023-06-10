
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../styles/font.styles.dart';

class FormComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 8.0.r,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add New User',
                  style: fontStyles(
                      size: 16.0,
                      color:
                      Theme.of(context).colorScheme.onBackground),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            SizedBox(
              height: 16.0.r,
            ),

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
                fillColor:
                Theme.of(context).colorScheme.secondaryContainer,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(
              height: 8.0.r,
            ),

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
                fillColor:
                Theme.of(context).colorScheme.secondaryContainer,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(
              height: 16.0.r,
            ),
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
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            SizedBox(
              height: 16.0.r,
            ),
          ],
        ),
      ),
    );
  }

}