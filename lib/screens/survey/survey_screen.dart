import 'package:flutter/material.dart';
import 'package:huongnghiep/widgets/app_header.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'Khảo sát Chuyên sâu'),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              // Khi hoàn thành khảo sát, chuyển đến màn hình kết quả
              Navigator.pushNamed(context, '/analysis');
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            } else {
              // Nếu ở bước đầu tiên và nhấn hủy, quay lại màn hình trước
              Navigator.pop(context);
            }
          },
          steps: [
            Step(
              title: Text('Thông tin Cơ bản'),
              content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bạn đang học cấp mấy?',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thông tin';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Môn học yêu thích nhất?',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thông tin';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
            ),
            Step(
              title: Text('Sở thích và Đam mê'),
              content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bạn thích làm gì trong thời gian rảnh?',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thông tin';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bạn muốn làm nghề gì trong tương lai?',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thông tin';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              isActive: _currentStep >= 1,
            ),
            Step(
              title: Text('Kỹ năng và Năng lực'),
              content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bạn giỏi nhất ở lĩnh vực nào?',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thông tin';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bạn cần cải thiện kỹ năng nào?',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập thông tin';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              isActive: _currentStep >= 2,
            ),
          ],
        ),
      ),
    );
  }
} 