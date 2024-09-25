// class Student {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String course;
//   final int year;
//   final bool enrolled;

//   Student({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.course,
//     required this.year,
//     required this.enrolled,
//   });

//   factory Student.fromJson(Map<String, dynamic> json) {
//     return Student(
//       id: json['_id'] ?? '',
//       firstName: json['firstName'] ?? '',
//       lastName: json['lastName'] ?? '',
//       course: json['course'] ?? '',
//       year: json['year'] ?? 1,
//       enrolled: json['enrolled'] ?? false,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'firstName': firstName,
//       'lastName': lastName,
//       'course': course,
//       'year': year,
//       'enrolled': enrolled,
//     };
//   }
// }
