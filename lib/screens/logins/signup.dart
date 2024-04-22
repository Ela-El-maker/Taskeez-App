import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:taskeez/screens/logins/signin.dart';

class SignUpUI extends StatefulWidget {
  const SignUpUI({super.key});

  @override
  State<SignUpUI> createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff292c31),
      body: ScrollConfiguration(
        behavior: Behavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(),
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffa9ded8),
                      ),
                    ),
                    SizedBox(
                      height: width / 8,
                    ),
                    component1(Icons.account_circle_outlined, 'Username...',
                        false, false),
                    SizedBox(
                      height: width / 12,
                    ),
                    component1(
                        Icons.email_outlined, 'Email Address...', false, true),
                    SizedBox(
                      height: width / 12,
                    ),
                    component1(
                        Icons.email_outlined, 'Phone Number...', false, true),
                    SizedBox(
                      height: width / 12,
                    ),
                    component1(Icons.lock_outline, 'Password...', true, false),
                    SizedBox(
                      height: width / 12,
                    ),
                    component1(
                        Icons.lock_outline, 'Confirm Password...', true, false),
                    SizedBox(
                      height: width / 12,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     RichText(
                    //       text: TextSpan(
                    //           text: 'Forget Password!!!',
                    //           style: TextStyle(
                    //             color: Color(0xffa9ded8),
                    //           ),
                    //           recognizer: TapGestureRecognizer()
                    //             ..onTap = () {
                    //               HapticFeedback.lightImpact();
                    //               Fluttertoast.showToast(
                    //                 msg: 'Forgotten Password button pressed',
                    //               );
                    //             }),
                    //     ),
                    //     SizedBox(
                    //       width: width / 10,
                    //     ),
                    //     RichText(
                    //       text: TextSpan(
                    //           text: 'Create a new Account',
                    //           style: TextStyle(color: Color(0xffa9ded8)),
                    //           recognizer: TapGestureRecognizer()
                    //             ..onTap = () {
                    //               HapticFeedback.lightImpact();
                    //               Fluttertoast.showToast(
                    //                   msg: 'Create new Account button pressed');
                    //             }),
                    //     )
                    //   ],
                    // )
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(bottom: width * .07),
                            height: width * .7,
                            width: width * .7,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    Color(0xff09090a),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ))),
                      ),
                      Center(
                        child: Transform.scale(
                          scale: _animation.value,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              HapticFeedback.lightImpact();
                              Fluttertoast.showToast(
                                  msg: 'SIGN UP button pressed');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignINUI()),
                              );
                            },
                            child: Container(
                              height: width * .2,
                              width: width * .2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffa9ded8),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account? ',
                            style: TextStyle(
                              color: Color(0xffa9ded8),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              HapticFeedback.lightImpact();
                              Fluttertoast.showToast(
                                msg: 'Back to Sign In button pressed',
                              );
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Sign In!!!',
                              style: TextStyle(
                                color: Color(0xffa9ded8),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component1(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 5,
      width: width / 1.2,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: width / 30),
      decoration: BoxDecoration(
          color: Color(0xff212428), borderRadius: BorderRadius.circular(15)),
      child: TextField(
        style: TextStyle(color: Colors.white.withOpacity(.9)),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white.withOpacity(.7),
            ),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5))),
      ),
    );
  }
}

class Behavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
