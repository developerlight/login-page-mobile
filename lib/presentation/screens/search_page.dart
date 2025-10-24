import 'package:flutter/material.dart';
import '../../models/student.dart';
import '../../services/student_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final StudentService _service = StudentService();
  final TextEditingController _ctrl = TextEditingController();
  Future<List<Student>>? _futureResults;

  @override
  void initState() {
    super.initState();
    // start with stream of all students
    _futureResults = _service.fetchStudents();
  }

  void _onSearchChanged(String q) {
    setState(() {
      if (q.trim().isEmpty) {
        _futureResults = _service.fetchStudents();
      } else {
        _futureResults = _service.searchStudents(q.trim());
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.red[900],
        actions: [
          IconButton(
            tooltip: 'Add Student',
            icon: Icon(Icons.person_add),
            onPressed: () async {
              // Navigate to add student page and refresh list on success
              final result = await Navigator.pushNamed(context, '/addStudent');
              if (result == true) {
                // refresh current results (maintain current query)
                _onSearchChanged(_ctrl.text);
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _ctrl,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search students by name, NISN or phone',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: _ctrl.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _ctrl.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
              ),
              onChanged: _onSearchChanged,
            ),
            SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<Student>>(
                future: _futureResults,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final list = snapshot.data ?? [];
                  if (list.isEmpty) {
                    return Center(child: Text('No students found'));
                  }
                  return ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (_, __) => Divider(),
                    itemBuilder: (context, index) {
                      final s = list[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(s.name.isNotEmpty ? s.name[0] : '?')),
                        title: Text(s.name),
                        subtitle: Text('${s.nisn} • ${s.phone}\n${s.adress}'),
                        isThreeLine: true,
                        onTap: () {
                          // optional: navigate to student detail
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}