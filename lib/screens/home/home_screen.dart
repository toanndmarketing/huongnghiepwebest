import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hướng Nghiệp'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // TODO: Navigate to profile screen khi có màn hình profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chào mừng đến với Hướng Nghiệp',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 24),
              _buildMenuCard(
                context,
                'Phân tích Thần số học',
                'Khám phá điểm mạnh, điểm yếu của bạn',
                Icons.psychology,
                () {
                  Navigator.pushNamed(context, '/numerology');
                },
              ),
              SizedBox(height: 16),
              _buildMenuCard(
                context,
                'Khảo sát Chuyên sâu',
                'Tìm hiểu sở thích và đam mê của bạn',
                Icons.quiz,
                () {
                  Navigator.pushNamed(context, '/survey');
                },
              ),
              SizedBox(height: 16),
              _buildMenuCard(
                context,
                'Kết quả Phân tích',
                'Xem báo cáo chi tiết về bản thân',
                Icons.assessment,
                () {
                  Navigator.pushNamed(context, '/analysis');
                },
              ),
              SizedBox(height: 16),
              _buildMenuCard(
                context,
                'Tư vấn Chuyên sâu',
                'Kết nối với chuyên gia tư vấn',
                Icons.people,
                () {
                  Navigator.pushNamed(context, '/consultation');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
} 