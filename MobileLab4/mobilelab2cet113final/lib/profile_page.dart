import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text('My Best Friend Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileInfo(
                      label: "ชื่อ-นามสกุล", value: "ระพีพัฒน์ สีดำ"),
                  _buildProfileInfo(label: "ชื่อเล่น", value: "จอจ้า"),
                  _buildProfileInfo(label: "อายุ", value: "20 ปี"),
                  _buildProfileInfo(label: "บ้านเกิด", value: "แดนสับปะรด"),
                  _buildProfileInfo(
                      label: "อาหารที่ชอบ", value: "ข้าวมันไก่, ก๋วยเตี๋ยวเรือ"),
                  _buildProfileInfo(
                      label: "กิจกรรมที่ชอบ",
                      value:
                          "ฟังเพลง K-Pop"),
                ],
              ),
            ),
            const SizedBox(width: 20), 

            Expanded(
              flex: 2,
              child: Center(
                child: CircleAvatar(
                  radius: 80, 
                  backgroundImage: const AssetImage('assets/images/friend_pic.png'),
                  backgroundColor: Colors.teal.shade200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}