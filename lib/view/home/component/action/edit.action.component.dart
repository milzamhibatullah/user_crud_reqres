import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/font.styles.dart';
import '../../../../viewmodel/user.viewmodel.dart';
import '../form.component.dart';

class EditActionComponent extends StatelessWidget {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  final UserViewModel viewModel; // Notice the variable type
  EditActionComponent(
      {Key? key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(fontStyles(size: 10.0.r)),
          padding: MaterialStatePropertyAll(
            EdgeInsets.all(8.0.r),
          ),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r)))),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          useSafeArea: true,
          builder: (BuildContext context) {
            return FormComponent(
              firstNameController,
              lastNameController,
              emailController,
              viewModel,
            );
          },
        );
      },
      icon: Icon(
        Icons.edit_note,
        size: 20.0.r,
      ),
      label: Text(
        'Edit',
        style: fontStyles(
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      ),
    );
  }
}
