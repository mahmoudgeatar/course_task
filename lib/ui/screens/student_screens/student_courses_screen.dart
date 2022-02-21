import 'package:course_task/data/repositry/course_data.dart';
import 'package:course_task/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import 'buy_scourse_screen.dart';
import 'lesson_screen.dart';

class StudentCoursesScreen extends StatefulWidget {
  const StudentCoursesScreen({Key? key}) : super(key: key);

  @override
  _StudentCoursesScreenState createState() => _StudentCoursesScreenState();
}

class _StudentCoursesScreenState extends State<StudentCoursesScreen> {
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
                leading: courses[index].selled
                    ? null
                    : CustomButton(
                        text: "Buy Course",
                        callback: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BuyCourseScreen(courses[index]);
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
                        child: courses[index].selled != true
                            ? const Text(
                                "But the Course to see the lesson",
                                style: TextStyle(color: Colors.grey),
                              )
                            : courses[index].lessonList.isEmpty
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
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) {
                                                return LessonScreen(courses[index].lessonList[childIndex]);
                                              }));

                                        },
                                      );
                                    },
                                    itemCount:
                                        courses[index].lessonList.length)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
