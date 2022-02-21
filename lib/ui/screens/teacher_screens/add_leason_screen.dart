import 'package:course_task/data/model/lessons_model.dart';
import 'package:course_task/ui/screens/home_screen.dart';
import 'package:course_task/ui/widgets/button_widget.dart';
import 'package:course_task/ui/widgets/text_feild_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddLessonScreen extends StatelessWidget {
  List<LessonModel> lessonList;
  AddLessonScreen(this.lessonList, {Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController lessonNameController = TextEditingController();
  TextEditingController lessonDescriptionController = TextEditingController();
  TextEditingController lessonVideoController = TextEditingController();

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
              hintText: "Lesson Name",
              icon: Icons.drive_file_rename_outline,
              password: false,
              controller: lessonNameController,
            ),
            CusomTextFeild(
              hintText: "Lesson Description",
              icon: Icons.dialpad_sharp,
              password: false,
              controller: lessonDescriptionController,
            ),
            CusomTextFeild(
              hintText: "Lesson Video Link",
              icon: Icons.video_collection,
              password: false,
              controller: lessonVideoController,
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  text: "LOGIN",
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      lessonList.add(LessonModel(
                        lessonName: lessonNameController.text,
                        lessonDescription: lessonDescriptionController.text,
                        videoLink: lessonVideoController.text,
                      ));
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
