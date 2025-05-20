import 'package:assignment_2/widget/courseCard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Course> courses = [
    Course(
      image: 'https://flagcdn.com/w320/us.png',
      title: 'Web Dev with JavaScript (MERN)',
      availableSeats: 50,
      availableDays: 30,
      batchNo: 'ব্যাচ ০১',
    ),
    Course(
      image: 'https://flagcdn.com/w320/bd.png',
      title: 'Python, Django & React',
      availableSeats: 35,
      availableDays: 45,
      batchNo: 'ব্যাচ ০২',
    ),
    Course(
      image: 'https://flagcdn.com/w320/de.png',
      title: 'Flutter App Development',
      availableSeats: 40,
      availableDays: 25,
      batchNo: 'ব্যাচ ০৩',
    ),
    Course(
      image: 'https://flagcdn.com/w320/ca.png',
      title: 'Full Stack .NET Developer',
      availableSeats: 20,
      availableDays: 60,
      batchNo: 'ব্যাচ ০৪',
    ),
    Course(
      image: 'https://flagcdn.com/w320/in.png',
      title: 'Android Development with Kotlin',
      availableSeats: 28,
      availableDays: 35,
      batchNo: 'ব্যাচ ০৫',
    ),
    Course(
      image: 'https://flagcdn.com/w320/jp.png',
      title: 'DevOps & Cloud Engineering',
      availableSeats: 22,
      availableDays: 50,
      batchNo: 'ব্যাচ ০৬',
    ),
    Course(
      image: 'https://flagcdn.com/w320/au.png',
      title: 'UI/UX Design with Figma',
      availableSeats: 18,
      availableDays: 20,
      batchNo: 'ব্যাচ ০৭',
    ),
    Course(
      image: 'https://flagcdn.com/w320/fr.png',
      title: 'AI & Machine Learning',
      availableSeats: 32,
      availableDays: 55,
      batchNo: 'ব্যাচ ০৮',
    ),
    Course(
      image: 'https://flagcdn.com/w320/nl.png',
      title: 'Cybersecurity Fundamentals',
      availableSeats: 16,
      availableDays: 40,
      batchNo: 'ব্যাচ ০৯',
    ),
    Course(
      image: 'https://flagcdn.com/w320/se.png',
      title: 'Java with Spring Boot',
      availableSeats: 30,
      availableDays: 38,
      batchNo: 'ব্যাচ ১০',
    ),
    Course(
      image: 'https://flagcdn.com/w320/no.png',
      title: 'C++ for Competitive Programming',
      availableSeats: 24,
      availableDays: 30,
      batchNo: 'ব্যাচ ১১',
    ),
    Course(
      image: 'https://flagcdn.com/w320/it.png',
      title: 'Laravel & Vue.js Fullstack',
      availableSeats: 29,
      availableDays: 42,
      batchNo: 'ব্যাচ ১২',
    ),
    Course(
      image: 'https://flagcdn.com/w320/gb.png',
      title: 'Game Development with Unity',
      availableSeats: 21,
      availableDays: 60,
      batchNo: 'ব্যাচ ১৩',
    ),
    Course(
      image: 'https://flagcdn.com/w320/kr.png',
      title: 'Data Science with Python',
      availableSeats: 34,
      availableDays: 48,
      batchNo: 'ব্যাচ ১৪',
    ),
    Course(
      image: 'https://flagcdn.com/w320/cn.png',
      title: 'Blockchain Development',
      availableSeats: 19,
      availableDays: 52,
      batchNo: 'ব্যাচ ১৫',
    ),
    Course(
      image: 'https://flagcdn.com/w320/za.png',
      title: 'React Native App Development',
      availableSeats: 27,
      availableDays: 33,
      batchNo: 'ব্যাচ ১৬',
    ),
    Course(
      image: 'https://flagcdn.com/w320/ae.png',
      title: 'iOS App Development with Swift',
      availableSeats: 23,
      availableDays: 36,
      batchNo: 'ব্যাচ ১৭',
    ),
    Course(
      image: 'https://flagcdn.com/w320/ru.png',
      title: 'Ethical Hacking & Pen Testing',
      availableSeats: 20,
      availableDays: 45,
      batchNo: 'ব্যাচ ১৮',
    ),
    Course(
      image: 'https://flagcdn.com/w320/eg.png',
      title: 'Graphic Design with Adobe Suite',
      availableSeats: 26,
      availableDays: 28,
      batchNo: 'ব্যাচ ১৯',
    ),
    Course(
      image: 'https://flagcdn.com/w320/ar.png',
      title: 'Robotics with Arduino',
      availableSeats: 17,
      availableDays: 34,
      batchNo: 'ব্যাচ ২০',
    ),
  ];


  int _getCrossAxisCount(double width) {
    if (width < 768) return 2; // Mobile
    if (width < 1024) return 3; // Tablet
    return 4; // Desktop
  }

  double _getChildAspectRatio(double width) {
    if (width < 500) return 0.7; // Mobile
    if (width < 768) return 0.9; // Mobile
    if (width < 800) return 0.85; // Mobile
    if (width < 1024) return 0.9; // Tablet
    if (width < 1224) return 0.8; // Tablet
    if (width < 1500) return 0.8; // Tablet
    return 1; // Desktop
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final crossAxisCount = _getCrossAxisCount(screenSize.width);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Course List", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: _getChildAspectRatio(screenSize.width),
          ),
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        ),
      ),
    );
  }
}
