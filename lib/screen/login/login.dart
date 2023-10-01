import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/bloc/internet/internet_bloc.dart';
import 'package:peace_worc/bloc/login/login_bloc.dart';
import 'package:peace_worc/components/my_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peace_worc/screen/dashboard/Dashboard.dart';
import 'package:peace_worc/screen/signup/signup.dart';
// https://medium.com/flutter-community/flutter-login-tutorial-with-flutter-bloc-ea606ef701ad
class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
  late FocusNode myPasswordFocusNode, confirmPasswordFocusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    myPasswordFocusNode = FocusNode();

  }
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    myPasswordFocusNode.dispose();
    super.dispose();
  }
  void _onFocusChange() {
    setState(() {
      _isFocused = myPasswordFocusNode.hasFocus;

    });
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1)).then(
            (value) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.red,
          systemNavigationBarColor: Colors.red,
          statusBarBrightness: Brightness.dark, // bar light == text dark
        )));

    return Container(
      //color: Color.fromRGBO(0, 60, 129, 1),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(0, 60, 129, 1),
            body:BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
              if(state is LoginLoadingState){

                       return const Center(
                       child: CircularProgressIndicator(color: Colors.white,),
                              );
                      }
              if(state is LoginLoadedSuccessState){
                if(state.loginModel.httpStatusCode == 401){


                _onWidgetDidBuild( (){
                  final snackBar = SnackBar(
                    content:  Text(state.loginModel.message.toString()),
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
              }
                return Center(
              child: SingleChildScrollView(

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const SizedBox(width: 10,),
                      Image.asset("lib/assets/log.png",  height: 100.0,
                        width: 100.0,),

                      const SizedBox(height: 50),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
                        'Login to continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 30),

                      //username Field
                      MyTextField(controller: usernameController, hintText: "Email Address *", obscureText: false, onChanged: (text){
                        print('values $text');
                      },  ),
                      const SizedBox(height: 30),
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
                            labelText: "Password *",
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
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text('Forgot Password ?',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ]
                        ),
                      ),
                      const SizedBox(height: 30),
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
                      BlocProvider.of<LoginBloc>(context).add(LoginButtonClickedEvent(email: usernameController.text, password: passwordController.text, fcm_token:"teststststststs" ));

                      //Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
                      const SizedBox(height: 40,),
                      const Text('Do not have an account?', style: TextStyle(color: Colors.white, fontSize: 12.0, ),),
                      const SizedBox(height: 2,),
                      GestureDetector(
                          onTap: (){
                            context.read<LoginBloc>().add(LoginRegisterNavigateEvent());
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                          },
                          child: const Text('Register now', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),))

                    ]
                ),
              ),
            );
  },
)
        ),
      ),
    );
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

}
