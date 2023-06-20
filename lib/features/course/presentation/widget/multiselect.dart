// import 'package:flutter/material.dart';

// class MultiSelectDialog {
//   static void showMultiSelect(
//       BuildContext context,
//       List<CourseEntity> availableCourses,
//       List<CourseEntity> selectedCourses,
//       Function(List<CourseEntity>) onSelectionChanged) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: const Text('Select Courses'),
//               content: SingleChildScrollView(
//                 child: Column(
//                   children: availableCourses.map((course) {
//                     final bool isSelected = selectedCourses.contains(course);
//                     return CheckboxListTile(
//                       title: Text(course.courseName),
//                       value: isSelected,
//                       onChanged: (value) {
//                         setState(() {
//                           if (isSelected) {
//                             selectedCourses.remove(course);
//                           } else {
//                             selectedCourses.add(course);
//                           }
//                         });
//                         onSelectionChanged(selectedCourses);
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Cancel'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context, selectedCourses);
//                   },
//                   child: const Text('Done'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     ).then((value) {
//       if (value != null) {
//         onSelectionChanged(value);
//       }
//     });
//   }
// }
