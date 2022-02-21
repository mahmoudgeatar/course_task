import 'lessons_model.dart';

class CourseModel {
  late String courseName;
  late String courseDescription;
  late double coursePrice;
 late bool selled;
  late List<LessonModel> lessonList;

  CourseModel(
      {required this.courseName,
      required this.courseDescription,
      required this.coursePrice,
      required this.selled,
      required this.lessonList});
}
