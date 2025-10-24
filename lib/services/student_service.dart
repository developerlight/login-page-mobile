import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student.dart';

class StudentService {
  // Firestore collection 'smk' where each document is a student
  final CollectionReference _studentsCol = FirebaseFirestore.instance.collection('students');

  // Stream all students
  Stream<List<Student>> streamStudents() {
    return _studentsCol.snapshots().map((snapshot) => snapshot.docs
        .map((d) => Student.fromMap(d.id, d.data() as Map<String, dynamic>))
        .toList());
  }

  // Fetch once
  Future<List<Student>> fetchStudents() async {
    final snapshot = await _studentsCol.get();
    return snapshot.docs.map((d) => Student.fromMap(d.id, d.data() as Map<String, dynamic>)).toList();
  }

  // Search by name, nisn or phone (client-side fallback). For large collections, create indexes or server-side queries.
  Future<List<Student>> searchStudents(String query) async {
    final q = query.trim();
    if (q.isEmpty) return fetchStudents();

    final lower = q.toLowerCase();
    final all = await fetchStudents();
    return all.where((s) {
      return s.name.toLowerCase().contains(lower) || s.nisn.toLowerCase().contains(lower) || s.phone.toLowerCase().contains(lower);
    }).toList();
  }

  // Add a new student document to the 'smk' collection.
  /// Returns the created DocumentReference
  Future<DocumentReference> addStudent(Map<String, dynamic> data) async {
    final ref = await _studentsCol.add(data);
    return ref;
  }
}
