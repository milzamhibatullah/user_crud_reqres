import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/font.styles.dart';
import '../../../../viewmodel/user.viewmodel.dart';
import '../form.component.dart';

class EditActionComponent extends StatelessWidget {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  final UserViewModel viewModel;
  final int id;

  EditActionComponent(
      {Key? key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.id,
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
        viewModel.onEdit = true;
        final user = viewModel.listUsers.firstWhere((element) => element.id==id);
        firstNameController?.text=user.firstName!;
        lastNameController?.text=user.lastName!;
        emailController?.text=user.email!;
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          useSafeArea: true,
          isScrollControlled: true,
          builder: (BuildContext context) {


            return FormComponent(
              firstNameController,
              lastNameController,
              emailController,
              viewModel,
              id: id,
            );
          },
        ).whenComplete(() {
          firstNameController?.clear();
          lastNameController?.clear();
          emailController?.clear();
          viewModel.onEdit = false;
        });
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
