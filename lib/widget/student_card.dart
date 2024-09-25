// import 'package:crud/models/student_model.dart';
// import 'package:flutter/material.dart';

// class StudentCard extends StatelessWidget {
//   final Student student;
//   final VoidCallback onEdit;
//   final VoidCallback onDelete;

//   const StudentCard({
//     Key? key,
//     required this.student,
//     required this.onEdit,
//     required this.onDelete,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(
//         vertical: 8.0,
//         horizontal: 16.0,
//       ),
//       elevation: 4.0,
//       child: ListTile(
//         title: Text(
//           '${student.firstName} ${student.lastName}',
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18.0,
//           ),
//         ),
//         subtitle: Text(
//           'Course: ${student.course}, Year: ${student.year}',
//           style: TextStyle(
//             color: Colors.grey[700],
//             fontSize: 14.0,
//           ),
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.edit, color: Colors.blue),
//               onPressed: onEdit,
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: onDelete,
//             ),
//           ],
//         ),
//         leading: CircleAvatar(
//           backgroundColor: student.enrolled ? Colors.green : Colors.red,
//           child: Icon(
//             student.enrolled ? Icons.check : Icons.close,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
