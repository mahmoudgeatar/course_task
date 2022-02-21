import 'package:course_task/bussines/course_provider.dart';
import 'package:course_task/data/model/role_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'teacher_screens/add_course_screen.dart';

class HomeScreen extends StatelessWidget {
RoleModel? user;
 HomeScreen({this.user});

  @override
  Widget build(BuildContext context) {
    var courseProvider = Provider.of<CourseProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("HomePage"),
        actions:  [
          Padding(
            padding:  const EdgeInsets.all(12.0),
            child: Center(
                child: Text(
              user!.budget.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            )),
          )
        ],
      ),
      floatingActionButton: courseProvider.currentIndex > 0 ||user!.isTeacher==false
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddCourseScreen();
                }));
              },
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: courseProvider.currentIndex,
        items: courseProvider.bottomItems,
        onTap: (index) {
          courseProvider.changeBottomNavbarState(index);
        },
      ),
      body: courseProvider.isTeacher?courseProvider.screens2[courseProvider.currentIndex]:courseProvider.screens[courseProvider.currentIndex],
    );
  }
}
