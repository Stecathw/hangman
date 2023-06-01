import 'package:flutter/material.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/widgets/bold_text_field.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.onBackPressed,
    required this.onResetPressed,
  }) : super(key: key);

  final VoidCallback onBackPressed;
  final VoidCallback onResetPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBackPressed,
      ),
      title: boldTextField('A little hangman game...', 20, 2),
      backgroundColor: AppColor.primaryColorRed,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white),
          onPressed: onResetPressed,
        ),
      ],
    );
  }
}
