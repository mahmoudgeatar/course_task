import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_task/data/model/course_model.dart';
import 'package:course_task/data/repositry/user_data.dart';
import 'package:course_task/ui/screens/home_screen.dart';
import 'package:course_task/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuyCourseScreen extends StatelessWidget {
  CourseModel courseDetails;
  BuyCourseScreen(this.courseDetails, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy Course"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
              imageUrl:
                  "https://www.zillacapital.com/wp-content/uploads/2021/09/education.jpg"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseDetails.courseName,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              Text(
                "${courseDetails.coursePrice.toString()}\$",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            courseDetails.courseDescription,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 5),
          CustomButton(
              text: "Buy Course",
              callback: () {
                courseDetails.selled = true;
                users[1].budget += courseDetails.coursePrice;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false);
              })
        ],
      ),
    );
  }
}
