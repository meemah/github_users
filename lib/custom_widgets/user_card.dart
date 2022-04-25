import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_users/exports.dart';
import 'package:github_users/models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.62),
        color: kUserCardColor,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: NetworkImage(user.avatarUrl ?? ""),
            backgroundColor: Colors.transparent,
          ),
          const XMargin(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.login ?? "-",
                  style: TextStyle(
                      color: kUserTitleColor, fontWeight: FontWeight.w700),
                ),
                const YMargin(8),
                Text(
                  user.type ?? "-",
                  style: TextStyle(color: kUserSubTitleColor, fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
