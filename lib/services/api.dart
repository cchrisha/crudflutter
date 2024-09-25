// import 'dart:convert';
// import 'package:crud/models/student_model.dart';
// import 'package:http/http.dart' as http;

// class StudentApiService {
//   final String baseUrl = 'https://crud-backend-virid.vercel.app/api';

//   // Fetch all students
//   Future<List<Student>> fetchStudents() async {
//     final response = await http.get(Uri.parse('$baseUrl/getStudents'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Student.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load students');
//     }
//   }

//   // Create a new student
//   Future<void> createStudent(Student student) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/createStudents'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(student.toJson()),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to create student');
//     }
//   }

//   // Update student
//   Future<void> updateStudent(String id, Student student) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/updateStudent/$id'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(student.toJson()),
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to update student');
//     }
//   }

//   // Delete student
//   Future<void> deleteStudent(String id) async {
//     final response = await http.delete(
//       Uri.parse('$baseUrl/deleteStudent/$id'),
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to delete student');
//     }
//   }
// }

// import 'dart:convert';
// import 'package:crud/models/student_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Api {
//   static const baseUrl = "https://crud-backend-virid.vercel.app/api";

//   // POST API
//   static Future<void> addStudent(Map<String, dynamic> sdata) async {
//     sdata['enrolled'] = sdata['enrolled'].toString();

//     var url = Uri.parse(baseUrl + "createStudents");

//     try {
//       final res = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(sdata),
//       );
//       if (res.statusCode == 200) {
//         var data = jsonDecode(res.body);
//         print('Student added: $data');
//       } else {
//         print("Upload Failed: ${res.body}");
//       }
//     } catch (e) {
//       debugPrint('Error adding student: ${e.toString()}');
//     }
//   }

//   // GET API
//   static Future<List<Student>> getPerson() async {
//     List<Student> students = [];

//     var url = Uri.parse(baseUrl + "getStudents");

//     try {
//       final res = await http.get(url);
//       print('GET Response: ${res.body}');

//       if (res.statusCode == 200) {
//         var data = jsonDecode(res.body);
//         print('Decoded Response: $data');

//         if (data['students'] != null) {
//           for (var element in data['students']) {
//             students.add(Student.fromJson(element));
//           }
//         }
//       } else {
//         print("Failed to fetch students: ${res.body}");
//       }
//     } catch (e) {
//       debugPrint('Error fetching students: ${e.toString()}');
//     }

//     return students;
//   }

//   // PUT API - Update Student
//   static Future<void> updateStudent(
//       String id, Map<String, dynamic> updatedData) async {
//     updatedData['enrolled'] = updatedData['enrolled'].toString();

//     var url = Uri.parse(baseUrl + "updateStudent/$id");

//     try {
//       final res = await http.put(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(updatedData),
//       );
//       if (res.statusCode == 200) {
//         var data = jsonDecode(res.body);
//         print('Update Response: $data');
//       } else {
//         print("Update Failed: ${res.body}");
//       }
//     } catch (e) {
//       debugPrint('Error updating student: ${e.toString()}');
//     }
//   }

//   static Future<void> deleteStudent(String id) async {
//     var url = Uri.parse(baseUrl + "deleteStudent/$id");

//     try {
//       final res = await http.delete(
//         url,
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (res.statusCode == 200) {
//         var data = jsonDecode(res.body);
//         print('Delete Response: $data');
//       } else {
//         print("Delete Failed: ${res.body}");
//       }
//     } catch (e) {
//       debugPrint('Error deleting student: ${e.toString()}');
//     }
//   }
// }