import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_bloc/main.dart';
import 'package:learn_bloc/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learn_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:learn_bloc/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlocs, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 64.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBlocs>(context)
                          .add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          'assets/images/reading.png',
                          'next',
                          'First See Learning',
                          'First See Learning First See Learning First See Learning First See Learning'),
                      _page(
                          2,
                          context,
                          'assets/images/boy.png',
                          'next',
                          'Second page',
                          'this is the Second page Second page Second page'),
                      _page(
                          3,
                          context,
                          'assets/images/man.png',
                          'get started ',
                          'final page',
                          'this is the final page this is the final page this is the final page'),
                    ],
                  ),
                  Positioned(
                      bottom: 50.h,
                      child: DotsIndicator(
                        position: state.page.toDouble(),
                        dotsCount: 3,
                        decorator: DotsDecorator(
                            size: const Size.square(8.0),
                            activeSize: const Size(15, 10),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String imagePath,
      String buttonName, String title, String subtitle) {
    return Builder(builder: (context) {
      return Column(
        children: [
          SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(imagePath),
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
          Text(
            subtitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
          GestureDetector(
            onTap: () {
              if (index < 3) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.decelerate);
              } else {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => MyHomePage(title: 'Flutter Demo'),
                //     ));
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('signIn', (route) => false);
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
              height: 50.h,
              width: 325.w,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
