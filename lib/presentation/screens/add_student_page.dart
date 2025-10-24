import 'package:flutter/material.dart';
import '../../services/student_service.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _nisnCtrl = TextEditingController();
  final _adressCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final StudentService _service = StudentService();
  bool _loading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _nisnCtrl.dispose();
    _adressCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final data = {
        'name': _nameCtrl.text.trim(),
        'nisn': _nisnCtrl.text.trim(),
        'adress': _adressCtrl.text.trim(),
        'phone': _phoneCtrl.text.trim(),
      };
      await _service.addStudent(data);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student added')));
        Navigator.pop(context, true);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Enter name' : null,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _nisnCtrl,
                decoration: InputDecoration(labelText: 'NISN'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Enter NISN' : null,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _adressCtrl,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _phoneCtrl,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loading ? null : _submit,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
                child: _loading ? CircularProgressIndicator(color: Colors.white) : Text('Add Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
