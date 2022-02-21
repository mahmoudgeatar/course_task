import 'package:course_task/data/model/course_model.dart';
import 'package:course_task/data/repositry/course_data.dart';
import 'package:course_task/ui/screens/home_screen.dart';
import 'package:course_task/ui/widgets/button_widget.dart';
import 'package:course_task/ui/widgets/text_feild_widget.dart';
import 'package:flutter/material.dart';

class AddCourseScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDescriptionController = TextEditingController();
  TextEditingController coursePriceController = TextEditingController();

  AddCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Lesson"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: <Widget>[
            CusomTextFeild(
              hintText: "Course Name",
              icon: Icons.drive_file_rename_outline,
              password: false,
              controller: courseNameController,
            ),
            CusomTextFeild(
              hintText: "Course Description",
              icon: Icons.dialpad_sharp,
              password: false,
              controller: courseDescriptionController,
            ),
            CusomTextFeild(
              hintText: "Course price",
              icon: Icons.money_off,
              password: false,
              controller: coursePriceController,
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  text: "LOGIN",
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      courses.add(
                        CourseModel(
                            courseName: courseNameController.text,
                            courseDescription: courseDescriptionController.text,
                            coursePrice:
                                double.parse(coursePriceController.text),
                            selled: false,
                            lessonList: []),
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return  HomeScreen();
                      }));
                    }
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
          ],
        ),
      ),
    );
  }
}
