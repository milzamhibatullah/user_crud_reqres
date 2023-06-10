
import 'package:flutter/material.dart';
import 'package:user_crud_reqres/view/home/component/form.component.dart';

import '../../../../styles/font.styles.dart';

class AddActionComponent extends StatelessWidget{
  TextEditingController? nameController;
  TextEditingController? jobController;
  final VoidCallback addMethod; // Notice the variable type


  AddActionComponent({Key? key,required this.nameController,required this.jobController,required this.addMethod}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () async {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          useSafeArea: true,
          builder: (BuildContext context) {
            return FormComponent();
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
    );
  }
}