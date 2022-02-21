import 'package:course_task/data/model/course_model.dart';
import 'package:course_task/data/model/lessons_model.dart';

List<CourseModel> courses = [
  CourseModel(
      courseName: "Flutter Course",
      courseDescription:
          "Flutter 2.2 work OS app for companies using Flutter with Firebase (Setstate state management)",
      coursePrice: 99.00,
      selled: false,
      lessonList: [
        LessonModel(
          lessonName: "Lesson One",
          lessonDescription: "Introduction",
          videoLink:
              "https://www.youtube.com/watch?v=I9ceqw5Ny-4&list=PLSzsOkUDsvdtl3Pw48-R8lcK2oYkk40cm",
        ),
      ]),
];
