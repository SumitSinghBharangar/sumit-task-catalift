import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;

  const CustomTabBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TabBar(
          controller: controller,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              color: Color(0xFF0A0066),
              borderRadius: BorderRadius.circular(10)),
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xFF0A0066),

          tabs: const [
            Tab(text: 'My Mentors'),
            Tab(text: 'Explore'),
          ],
          // Remove default indicator
          indicatorColor: Colors.transparent,
          // Make sure each tab takes exactly half the width
          labelPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
