import 'package:flutter/material.dart';

class Course {
  final String image, title, batchNo;
  final int availableSeats, availableDays;

  Course({
    required this.image,
    required this.title,
    required this.batchNo,
    required this.availableSeats,
    required this.availableDays,
  });
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLargeDevice = screenSize.width >= 768;

    final double fontSize = isLargeDevice ? 12 : 10;
    final double iconSize = isLargeDevice ? 16 : 12;
    final double paddingSize = isLargeDevice ? 10 : 8;

    return Container(
      margin: const EdgeInsets.all(8),
      height: isLargeDevice ? 350 : 300, // 👈 Fixed card height based on device
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with fixed aspect ratio
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                course.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content below image
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: const Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      if (isLargeDevice)
                        _infoBox(
                          child: Text(course.batchNo, style: TextStyle(fontSize: fontSize)),
                        ),
                      _infoBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.groups, size: iconSize, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text('${course.availableSeats} সিট', style: TextStyle(fontSize: fontSize)),
                          ],
                        ),
                      ),
                      _infoBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.schedule, size: iconSize, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text('${course.availableDays} দিন', style: TextStyle(fontSize: fontSize)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded( // <-- add this here
                  child: Padding(
                    padding: EdgeInsets.all(paddingSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        SizedBox(
                          height: isLargeDevice ? 48 : 40,
                          child: Text(
                            course.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isLargeDevice ? 18 : 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(40),
                              backgroundColor: Colors.grey[400],
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("বিস্তারিত দেখুন", style: TextStyle(fontSize: fontSize)),
                                SizedBox(width: isLargeDevice ? 6 : 4),
                                Icon(Icons.arrow_forward, size: iconSize),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )



        ],
      ),
    );
  }

  Widget _infoBox({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
