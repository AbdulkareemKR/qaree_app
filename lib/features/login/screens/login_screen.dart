import 'package:Naqaa/constants/border_radius_const.dart';
import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/constants/spacing_const.dart';
import 'package:Naqaa/utils/theme/extensions.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String nationalId = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsConst.primaryBlack,
        child: SafeArea(
          child: Column(
            children: [
              SpacingConst.vSpacing60,
              Text(
                "Qaree",
                style: context.textThemes.displaySmall
                    ?.copyWith(fontFamily: "JosefinSans"),
              ),
              SpacingConst.vSpacing40,
              Container(
                padding: EdgeInsets.all(18.h),
                decoration: BoxDecoration(
                  color: ColorsConst.primaryPurple,
                  borderRadius: BorderRadiusConst.circularBorderRadius,
                ),
                height: 114.h,
                width: 114.h,
                child: SvgPicture.asset("assets/svg/logo.svg"),
              ),
              SpacingConst.vSpacing120,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                padding: EdgeInsets.only(left: 10.w),
                decoration: const BoxDecoration(
                  color: ColorsConst.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.person_outline),
                    Container(
                      width: 100.w,
                      height: 60.h,
                      margin: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            nationalId = value;
                          });
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          border: InputBorder.none,
                          labelStyle: context.textThemes.bodyLarge?.copyWith(
                              color: ColorsConst.darkGrey,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SpacingConst.vSpacing20,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                padding: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                  color: ColorsConst.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock_outline),
                    Container(
                      width: 100.w,
                      height: 60.h,
                      margin: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                        maxLines: 1,
                        decoration: InputDecoration(
                          label: Text("Password"),
                          border: InputBorder.none,
                          labelStyle: context.textThemes.bodyLarge?.copyWith(
                            color: ColorsConst.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SpacingConst.vSpacing40,
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: ColorsConst.black,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                      height: 28.h,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
