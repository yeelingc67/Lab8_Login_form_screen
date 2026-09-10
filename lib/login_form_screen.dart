import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginFormScreen(), // ตั้ง LoginFormScreen เป็น home
    );
  }
}

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ฟอร์มล็อกอิน')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // เพิ่มวิดเจ็ต Form
          key: _formKey, // กำหนด key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // ยืดปุ่มทีหลัง
            children: <Widget>[
              const Text(
                'กรุณาป้อนข้อมูลเข้าระบบ:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // ฟิลด์ Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'อีเมล',
                  hintText: 'you@example.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(), // เพิ่มเส้นขอบ
                ),
                keyboardType: TextInputType.emailAddress,
                // Validator จะเพิ่มทีหลัง
                // onSaved จะเพิ่มทีหลัง
              ),
              const SizedBox(height: 15), // ตัวเว้นวรรค

              // ฟิลด์ Password
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'รหัสผ่าน',
                  hintText: 'ป้อนรหัสผ่านของคุณ',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(), // เพิ่มเส้นขอบ
                ),
                obscureText: true, // ซ่อนข้อความรหัสผ่าน
                // Validator จะเพิ่มทีหลัง
                // onSaved จะเพิ่มทีหลัง
              ),
              const SizedBox(height: 30), // ตัวเว้นวรรคก่อนปุ่ม

              // ปุ่ม Submit จะมาที่นี่
            ],
          ),
        ),
      ),
    );
  }
}