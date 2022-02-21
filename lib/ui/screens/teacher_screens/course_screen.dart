import 'package:course_task/data/repositry/course_data.dart';
import 'package:course_task/ui/screens/teacher_screens/add_leason_screen.dart';
import 'package:course_task/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Card(
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.black),
                leading: CustomButton(
                  text: "Add Lesson",
                  callback: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddLessonScreen(courses[index].lessonList);
                    }));
                  },
                ),
                title: Text(courses[index].courseName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    )),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                        height: 100,
                        child: courses[index].lessonList.isEmpty
                            ? const Text(
                                "No Lesson yet",
                                style: TextStyle(color: Colors.grey),
                              )
                            : ListView.builder(
                                itemBuilder: (context, childIndex) {
                                  return ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Text(
                                      courses[index]
                                          .lessonList[childIndex]
                                          .lessonName,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    trailing: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.grey,
                                    ),
                                    onTap: () {},
                                  );
                                },
                                itemCount: courses[index].lessonList.length)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
