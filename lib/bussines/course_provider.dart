import 'package:course_task/data/repositry/user_data.dart';
import 'package:course_task/ui/screens/home_screen.dart';
import 'package:course_task/ui/screens/news_screen.dart';
import 'package:course_task/ui/screens/student_screens/student_courses_screen.dart';
import 'package:course_task/ui/screens/teacher_screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CourseProvider extends ChangeNotifier {
  static CourseProvider get(context) => Provider.of(context, listen: false);

  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isTeacher=false;

  @override
  void dispose() {
    userNameController.dispose();
    passController.dispose();
    super.dispose();
  }


  bool isFetchingLog = false;
  void loginMethod(context) {
    isFetchingLog = true;
    for (var user in users) {
      // ignore: unrelated_type_equality_checks
      if (user.name == userNameController.text && user.password == passController.text) {
        if (user.isTeacher) {
          isTeacher = true;
        } else {
          isTeacher = false;
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
            (Route<dynamic> route) => false);
        isFetchingLog = false;
        break;
      }
    }

  }

  void toast(String text) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.article_outlined), label: "Sport"),
  ];
  List<Widget> screens2 = [const CourseScreen(),  const NewsScreen()];

  List<Widget> screens = [const StudentCoursesScreen(),  const NewsScreen()];

  void changeBottomNavbarState(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
