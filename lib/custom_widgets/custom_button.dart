import 'package:flutter/material.dart';

import 'package:github_users/exports.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Function() onTap;

  const CustomButton(
      {Key? key,
      this.isLoading = false,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      elevation: 0,
      color: kPrimaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      height: 54,
      onPressed: onTap,
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              title,
              style: mulishTextStyle.copyWith(color: Colors.white),
            ),
    );
  }
}
