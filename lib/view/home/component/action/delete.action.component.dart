
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../styles/font.styles.dart';

class DeleteActionComponent extends StatelessWidget{
  final VoidCallback deletMethod;

  DeleteActionComponent({Key? key,required this.deletMethod}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () {
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
                    SizedBox(
                      height: 8.0.r,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Delete User',
                          style: fontStyles(
                              size: 16.0,
                              weight: FontWeight.w600,
                              color:
                              Theme.of(context).colorScheme.error),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),

                    Text(
                      'Are you sure to delete this user ?',
                      style: fontStyles(
                          size: 14.0,
                          color:
                          Theme.of(context).colorScheme.onBackground),
                    ),
                    SizedBox(
                      height: 16.0.r,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45.0.r,
                      child: FilledButton(
                        onPressed: () {
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0.r),
                            ),
                          ),
                        ),
                        child: Text(
                          'Delete',
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
          },
        );
      },
      icon: Icon(
        Icons.delete,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}