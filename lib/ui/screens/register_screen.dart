import 'package:course_task/ui/widgets/button_widget.dart';
import 'package:course_task/ui/widgets/text_feild_widget.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool checkValue = false;

  @override
  void dispose() {
    userNameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 4, top: 4),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 44,
                      fontWeight: FontWeight.w600),
                ),
              ),
              CusomTextFeild(
                hintText: "First Name",
                password: false,
                icon: Icons.person,
                controller: userNameController,
              ),
              CusomTextFeild(
                hintText: "Middle Name",
                password: false,
                icon: Icons.person,
                controller: passController,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.blue,
                    value: checkValue,
                    onChanged: (value) {
                      checkValue = value!;
                      setState(() {});
                    },
                  ),
                  const Text(
                    "Teacher",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: CustomButton(
                          text: "REGISTER",
                          callback: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            }
                          },
                        )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: CustomButton(
                            text: "EXISTING ACCOUNT",
                            callback: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            })),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
