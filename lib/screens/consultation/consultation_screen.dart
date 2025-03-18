import 'package:flutter/material.dart';
import 'package:huongnghiep/widgets/app_header.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'Tư vấn Chuyên sâu'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gói Tư vấn',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            _buildConsultationPackage(
              context,
              'Gói Cơ bản',
              '199.000đ',
              [
                'Tư vấn qua chat',
                'Phân tích sơ bộ',
                'Gợi ý nghề nghiệp',
              ],
              () {
                _showPaymentDialog(context, 'Gói Cơ bản', '199.000đ');
              },
            ),
            SizedBox(height: 16),
            _buildConsultationPackage(
              context,
              'Gói Chuyên sâu',
              '499.000đ',
              [
                'Tư vấn trực tiếp 1-1',
                'Phân tích chi tiết',
                'Lộ trình phát triển',
                'Báo cáo chuyên sâu',
              ],
              () {
                _showPaymentDialog(context, 'Gói Chuyên sâu', '499.000đ');
              },
            ),
            SizedBox(height: 24),
            Text(
              'Chuyên gia Tư vấn',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            _buildExpertCard(
              context,
              'Nguyễn Văn A',
              'Chuyên gia Tâm lý học',
              '10 năm kinh nghiệm',
              'assets/images/expert1.jpg',
              () {
                _showAppointmentDialog(context, 'Nguyễn Văn A');
              },
            ),
            SizedBox(height: 16),
            _buildExpertCard(
              context,
              'Trần Thị B',
              'Chuyên gia Hướng nghiệp',
              '8 năm kinh nghiệm',
              'assets/images/expert2.jpg',
              () {
                _showAppointmentDialog(context, 'Trần Thị B');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, String packageName, String price) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Thanh toán'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gói: $packageName'),
              Text('Giá: $price'),
              SizedBox(height: 16),
              Text('Chọn phương thức thanh toán:'),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Thẻ tín dụng/ghi nợ'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Xử lý thanh toán
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Ví điện tử'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Xử lý thanh toán
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Hủy'),
            ),
          ],
        );
      },
    );
  }

  void _showAppointmentDialog(BuildContext context, String expertName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Đặt lịch hẹn'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Chuyên gia: $expertName'),
              SizedBox(height: 16),
              Text('Chọn ngày:'),
              TextButton.icon(
                icon: Icon(Icons.calendar_today),
                label: Text('Chọn ngày'),
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(Duration(days: 1)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 30)),
                  );
                  // TODO: Xử lý ngày được chọn
                },
              ),
              SizedBox(height: 8),
              Text('Chọn giờ:'),
              Wrap(
                spacing: 8,
                children: [
                  '9:00', '10:00', '14:00', '15:00', '16:00',
                ].map((time) => ChoiceChip(
                  label: Text(time),
                  selected: false,
                  onSelected: (selected) {
                    // TODO: Xử lý giờ được chọn
                  },
                )).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: Xác nhận lịch hẹn
              },
              child: Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildConsultationPackage(
    BuildContext context,
    String title,
    String price,
    List<String> features,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(child: Text(feature)),
                ],
              ),
            )),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onTap,
                child: Text('Chọn gói'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpertCard(
    BuildContext context,
    String name,
    String title,
    String experience,
    String imagePath,
    VoidCallback onTap,
  ) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
          child: Icon(Icons.person, size: 30, color: Colors.white), // Fallback nếu ảnh không tồn tại
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(experience),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: onTap,
          child: Text('Đặt lịch'),
        ),
      ),
    );
  }
} 