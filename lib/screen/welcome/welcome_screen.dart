import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peace_worc/bloc/welcome/welcome_bloc.dart';
import 'package:peace_worc/screen/signup/signup.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state){
         return Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [

                PageView(
                  controller: pageController,
                  onPageChanged: (index){
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    print("index value is ${index}");
                  },
                  children: [
                    _page(1, context, "Next", "Test title", "Test sub title", "lib/assets/boy.png"),
                    _page(2, context, "Next", "Test title", "Test sub title", "lib/assets/man.png"),
                    _page(3, context, "Next", "Test title", "Test sub title", "lib/assets/reading.png")
                  ],
                ),
                Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.black,
                          size: Size.square(8.0),
                          activeSize: Size(10.0,8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ))

              ],
            ),
          );
        }

      ),
    );
  }
  Widget _page(int index, BuildContext context, String buttonName, String title, String subTitle, String imagePath){
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover,),
        ),
        Container(
          child: Text(title, style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.normal
          ),),
        ),
        Container(
          child: Text(subTitle, style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.normal
          ),),
        ),

        GestureDetector(
          onTap: (){
            if(index < 3){
              pageController.animateTo(index.toDouble(), duration: const Duration(microseconds: 500), curve: Curves.decelerate);
            }
            else{
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
            }
          },
          child: Container(
            height: 50.0,
            margin: EdgeInsets.only(top: 100, left: 25, right: 25),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0,1)
                )
              ],
            ),
            child: Center(child: Text(buttonName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16.sp),)),
          ),
        ),
      ],

    );
  }
}
