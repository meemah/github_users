import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_users/exports.dart';
import 'package:github_users/models/user_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Stack(
                children: [
                  Image.asset(
                    "asset/bg.png",
                    fit: BoxFit.fill,
                    height: 180,
                  ),
                  SvgPicture.asset(
                    "asset/bg2.svg",
                    fit: BoxFit.fill,
                    height: 180,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Logistic officer",
                          style: whiteTextStyle,
                        ),
                        const Spacer(),
                        Text(
                          "Aron Charles",
                          style: whiteTextStyle.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                        Text("ID: 234223-01",
                            style: whiteTextStyle.copyWith(
                              color: Colors.white.withOpacity(0.7),
                            )),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset("asset/place.svg"),
                            const XMargin(10),
                            Text(
                              "Kano",
                              style: whiteTextStyle,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset("asset/profile.png")),
                  )
                ],
              ),
            ),
            const YMargin(25),
            Card(
              shadowColor: Colors.black.withOpacity(0.3),
              elevation: 4,
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    hintText: "Search clients",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 12.sp),
                    border: InputBorder.none),
              ),
            ),
            const YMargin(25),
            Expanded(
              child: Consumer<HomeViewmodel>(builder: (ctx, vm, index) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: vm.userList.data?.length ?? 0,
                    itemBuilder: (ctx, index) {
                      List<UserModel> users = vm.userList.data ?? [];
                      UserModel user = users[index];

                      return UserCard(user: user);
                    });
              }),
            )
          ],
        ),
      )),
    );
  }
}
