import 'package:course_task/bussines/course_provider.dart';
import 'package:course_task/data/repositry/user_data.dart';
import 'package:course_task/ui/screens/home_screen.dart';
import 'package:course_task/ui/widgets/button_widget.dart';
import 'package:course_task/ui/widgets/loader_widget.dart';
import 'package:course_task/ui/widgets/text_feild_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final courseProvider=CourseProvider.get(context);
    return Scaffold(
        key: scaffoldKey,
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 4, top: 4),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 44,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: <Widget>[
                            CusomTextFeild(
                              hintText: "Username",
                              icon: Icons.person,
                              password: false,
                              controller: courseProvider.userNameController,
                            ),
                            CusomTextFeild(
                              hintText: "Password",
                              icon: Icons.lock_outline,
                              password: true,
                              controller: courseProvider.passController,
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: double.infinity,
                              child: Consumer<CourseProvider>(
                                builder: (context, state, _) {
                                  return state.isFetchingLog
                                      ? const LoaderWidget()
                                      : CustomButton(
                                          text: "LOGIN",
                                          callback: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              state.loginMethod(context);

                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                            }
                                          });
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const PoliceText(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PoliceText extends StatelessWidget {
  const PoliceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Register();
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        child: Center(
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: "Don't have an Account? ",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey),
              ),
              TextSpan(
                text: "Register",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
