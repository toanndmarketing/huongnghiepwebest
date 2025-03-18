import 'package:flutter/material.dart';
import 'package:huongnghiep/widgets/app_header.dart';

class AnalysisResultsScreen extends StatelessWidget {
  const AnalysisResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'Kết quả Phân tích'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              'Điểm mạnh',
              [
                'Kỹ năng giao tiếp tốt',
                'Tư duy logic',
                'Khả năng làm việc nhóm',
              ],
            ),
            SizedBox(height: 24),
            _buildSection(
              context,
              'Điểm yếu',
              [
                'Thiếu kinh nghiệm thực tế',
                'Kỹ năng lãnh đạo cần cải thiện',
                'Khả năng ngoại ngữ còn hạn chế',
              ],
            ),
            SizedBox(height: 24),
            _buildSection(
              context,
              'Nghề nghiệp Phù hợp',
              [
                'Lập trình viên',
                'Quản lý dự án',
                'Tư vấn viên',
              ],
            ),
            SizedBox(height: 24),
            _buildSection(
              context,
              'Lộ trình Phát triển',
              [
                'Học thêm ngoại ngữ',
                'Tham gia các khóa học kỹ năng mềm',
                'Tìm kiếm cơ hội thực tập',
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Generate PDF report
                },
                icon: Icon(Icons.picture_as_pdf),
                label: Text('Tải báo cáo PDF'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Chuyển sang màn tư vấn
                  Navigator.pushNamed(context, '/consultation');
                },
                icon: Icon(Icons.people),
                label: Text('Đăng ký Tư vấn Chuyên sâu'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(child: Text(item)),
                  ],
                ),
              )).toList(),
            ),
          ),
        ),
      ],
    );
  }
} 