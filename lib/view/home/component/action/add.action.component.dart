import 'package:flutter/material.dart';
import 'package:user_crud_reqres/view/home/component/form.component.dart';

import '../../../../styles/font.styles.dart';
import '../../../../viewmodel/user.viewmodel.dart';

class AddActionComponent extends StatelessWidget {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  final UserViewModel viewModel;

  AddActionComponent(
      {Key? key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () async {
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
            );
          },
        ).whenComplete(() {
          firstNameController?.clear();
          lastNameController?.clear();
          emailController?.clear();
        });
      },
      icon: Icon(
        Icons.add_box_rounded,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)),
      label: Text(
        'New User',
        style: fontStyles(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
