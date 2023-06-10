

import 'package:flutter/material.dart';

import '../../../../styles/font.styles.dart';
import '../form.component.dart';

class EditActionComponent extends StatelessWidget{
  TextEditingController? nameController;
  TextEditingController? jobController;
  final VoidCallback editMethod; // Notice the variable type
  EditActionComponent({Key? key,required this.nameController,required this.jobController,required this.editMethod}):super(key: key);
  @override
  Widget build(BuildContext context) {
   return FilledButton.tonalIcon(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          useSafeArea: true,
          builder: (BuildContext context) {
            return FormComponent();
          },
        );
      },
      icon: const Icon(Icons.edit_note),
      label: Text(
        'Edit',
        style: fontStyles(
            color: Theme.of(context)
                .colorScheme
                .onSecondaryContainer),
      ),);
  }

}