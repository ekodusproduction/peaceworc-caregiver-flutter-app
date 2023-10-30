import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/bloc/signup/signup_bloc.dart';
import 'package:peace_worc/components/my_textfield.dart';
import 'package:peace_worc/screen/login/login.dart';
import 'package:peace_worc/screen/otp/otp.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final String svgString = '''
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 166 202">
  <defs>
    <linearGradient id="triangleGradient">
      <stop offset="20%" stop-color="#000000" stop-opacity=".55" />
      <stop offset="85%" stop-color="#616161" stop-opacity=".01" />
    </linearGradient>
    <linearGradient id="rectangleGradient" x1="0%" x2="0%" y1="0%" y2="100%">
      <stop offset="20%" stop-color="#000000" stop-opacity=".15" />
      <stop offset="85%" stop-color="#616161" stop-opacity=".01" />
    </linearGradient>
  </defs>
  <path fill="#42A5F5" fill-opacity=".8" d="M37.7 128.9 9.8 101 100.4 10.4 156.2 10.4" />
  <path fill="#42A5F5" fill-opacity=".8" d="M156.2 94 100.4 94 79.5 114.9 107.4 142.8" />
  <path fill="#0D47A1" d="M79.5 170.7 100.4 191.6 156.2 191.6 156.2 191.6 107.4 142.8" />
  <g transform="matrix(0.7071, -0.7071, 0.7071, 0.7071, -77.667, 98.057)">
    <rect width="39.4" height="39.4" x="59.8" y="123.1" fill="#42A5F5" />
    <rect width="39.4" height="5.5" x="59.8" y="162.5" fill="url(#rectangleGradient)" />
  </g>
  <path d="M79.5 170.7 120.9 156.4 107.4 142.8" fill="url(#triangleGradient)" />
</svg>
''';
  late  bool passwordVisible=true;
  late bool confirmPasswodVisible = true;
  late FocusNode myPasswordFocusNode, confirmPasswordFocusNode;
  bool _isFocused = false;
  bool _isConfirmPasswordFocused = false;
  @override
  void initState() {
    super.initState();
    myPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myPasswordFocusNode.dispose();
    confirmPasswordFocusNode = FocusNode();
    super.dispose();
  }
  void _onFocusChange() {
    setState(() {
      _isFocused = myPasswordFocusNode.hasFocus;
      _isConfirmPasswordFocused = confirmPasswordFocusNode.hasFocus;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(0, 60, 129, 1),
          body:BlocBuilder<SignupBloc, SignupState>(
  builder: (context, state) {
    if (state is SignUpLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }
    if(state is SignUpErrorState){

      _onWidgetDidBuild(() {
          final snackBar = SnackBar(
            content: Text(state.message.toString()),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });

    }

    if (state is SignUpSuccessState) {
        _onWidgetDidBuild(() {

          print("pass");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(), settings: RouteSettings(arguments: emailController.text)));
        });

    }
    return Center(
            child: SingleChildScrollView(

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const SizedBox(width: 10,),
                   Image.asset("lib/assets/log.png",  height: 100.0,
                     width: 100.0,),
                    const SizedBox(height: 30),
                    const Text(
                      'Welcome to Peaceworc',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text(
                      'Register to join',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    //username Field

                    const SizedBox(height: 18),
                    MyTextField(controller: usernameController, hintText: "Full Name *", obscureText: false, onChanged: (text){
                      print('values $text');
                    },  ),
                    const SizedBox(height: 18,),
                    MyTextField(controller: emailController, hintText: "Email Address", obscureText: false, onChanged: (text){
                      print('values $text');
                    },  ),
                    const SizedBox(height: 18,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        cursorColor: Colors.white,

                        style: const TextStyle(

                            color: Colors.white
                        ),
                        controller: passwordController,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "password",
                          hintText: _isFocused ? null : "password should be greater than 8 characters",
                          hintStyle: const TextStyle(color: Colors.white, fontSize: 10.0),
                          labelStyle: const TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            icon: Icon(
                                passwordVisible ? Icons.visibility
                                    : Icons.visibility_off),
                            color: Colors.white,
                            onPressed: () {
                              setState(
                                    () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),

                        ),

                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        cursorColor: Colors.white,

                        style: const TextStyle(

                            color: Colors.white
                        ),
                        controller: confirmPasswordController,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Confirm Password *",
                          hintText: _isConfirmPasswordFocused ? null : "password should be greater than 8 characters",
                          hintStyle: const TextStyle(color: Colors.white, fontSize: 10.0),
                          labelStyle: const TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            icon: Icon(
                                confirmPasswodVisible ? Icons.visibility
                                    : Icons.visibility_off),
                            color: Colors.white,
                            onPressed: () {
                              setState(
                                    () {
                                      confirmPasswodVisible = !confirmPasswodVisible;
                                },
                              );
                            },
                          ),

                        ),

                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.only(right: 25.0, left: 25.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50), // NEW
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        onPressed: () {
                          // final snackBar = SnackBar(
                          //   content: const Text('Yay! A SnackBar!'),
                          //   action: SnackBarAction(
                          //     label: 'Undo',
                          //     onPressed: () {
                          //       // Some code to undo the change.
                          //     },
                          //   ),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          BlocProvider.of<SignupBloc>(context).add(
                              SignUpButtonClickEvent(
                                userName: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword: confirmPasswordController.text,
                                  fcmToken: "teststststststs"));

                         // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    ),


                    const SizedBox(height: 20,),
                    const Text('Already have an account?', style: TextStyle(color: Colors.white, fontSize: 12.0, ),),
                    const SizedBox(height: 2,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                        child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),

                  ]
              ),
            ),
          );
  },
)
      ),
    );
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });

  }
}
