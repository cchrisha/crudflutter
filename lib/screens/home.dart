import 'dart:convert';
import 'package:crud/screens/create.dart';
import 'package:crud/screens/edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _students = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://crud-backend-virid.vercel.app/api/getStudents'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _students = json.decode(response.body);
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(
            'https://crud-backend-virid.vercel.app/api/deleteStudent/$id'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _students.removeWhere((student) => student['_id'] == id);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student info deleted successfully!')),
        );
      } else {
        print('Failed to delete student: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student info failed to delete!')),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void editStudent(Map<String, dynamic> student) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditStudentScreen(students: student),
      ),
    );

    if (result ?? false) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => CreatePage(),
                    ),
                  )
                      .then((value) {
                    fetchData();
                  })),
        ],
      ),
      body: Stack(
        children: [
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _students.length,
                  itemBuilder: (context, index) {
                    final student = _students[index];
                    String id = student['_id'] ?? '';
                    String firstName = student['firstName'] ?? '';
                    String lastName = student['lastName'] ?? '';
                    String course = student['course'] ?? 'Unknown';
                    int year = student['year'] ?? 0;
                    bool enrolled = student['enrolled'] ?? false;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      elevation: 4.0,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          '$firstName $lastName',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        subtitle: Text(
                          'Course: $course\nYear: $year\nEnrolled: ${enrolled ? 'Yes' : 'No'}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14.0,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => editStudent(student),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteStudent(id),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          backgroundColor: enrolled ? Colors.green : Colors.red,
                          child: Icon(
                            enrolled ? Icons.check : Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
          // Positioned(
          //   bottom: 20.0,
          //   right: 16.0,
          //   child: FloatingActionButton.extended(
          //     onPressed: () {
          //       Navigator.of(context)
          //           .push(
          //         MaterialPageRoute(
          //           builder: (context) => CreatePage(),
          //         ),
          //       )
          //           .then((value) {
          //         fetchData();
          //       });
          //     },
          //     icon: const Icon(Icons.add),
          //     label: const Text("Add Student"),
          //   ),
          // ),
        ],
      ),
    );
  }
}

//import 'package:crud/models/student_model.dart';
// import 'package:crud/screens/create.dart';
// import 'package:crud/screens/edit.dart';
// import 'package:crud/services/api.dart';
// import 'package:crud/widget/student_card.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final StudentApiService apiService = StudentApiService();
//   List<Student> _students = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final students = await apiService.fetchStudents();
//       setState(() {
//         _students = students;
//       });
//     } catch (e) {
//       print('Error: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> deleteStudent(String id) async {
//     try {
//       await apiService.deleteStudent(id);
//       setState(() {
//         _students.removeWhere((student) => student.id == id);
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void editStudent(Student student) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditStudentScreen(student: student),
//       ),
//     );

//     if (result ?? false) {
//       fetchData();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Student List')),
//       body: Stack(
//         children: [
//           _isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount: _students.length,
//                   itemBuilder: (context, index) {
//                     final student = _students[index];
//                     return StudentCard(
//                       student: student,
//                       onEdit: () => editStudent(student),
//                       onDelete: () => deleteStudent(student.id),
//                     );
//                   },
//                 ),
//           Positioned(
//             bottom: 20.0,
//             right: 16.0,
//             child: FloatingActionButton.extended(
//               onPressed: () async {
//                 // Open the CreatePage and wait for the result
//                 final result = await Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => CreatePage()));

//                 // If result is 'true', indicating a student was created, refresh the data
//                 if (result == true) {
//                   fetchData(); // Refresh the list of students from the server
//                 }
//               },
//               icon: const Icon(Icons.add),
//               label: const Text("Add Student"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }