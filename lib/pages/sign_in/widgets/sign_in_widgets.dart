import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.h),
      child: Container(
        height: 1.h,
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
    title: Text(
      'login',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16.sp),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 35.h, bottom: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons('google'),
        _reusableIcons('apple'),
        _reusableIcons('facebook'),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
    onTap: () {},
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
