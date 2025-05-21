import 'package:catalift_task/common/model/mentor_model.dart';
import 'package:catalift_task/ui/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/mentor_card.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({super.key});

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Mentor> _myMentors = [];
  List<Mentor> _exploreMentors = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Initialize dummy data
    _myMentors =
        dummyMentors.where((mentor) => mentor.compatibility >= 80).toList();
    _exploreMentors =
        dummyMentors.where((mentor) => mentor.compatibility < 80).toList();

    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Mentor> _getFilteredMentors(List<Mentor> mentors) {
    if (_searchQuery.isEmpty) {
      return mentors;
    }

    return mentors
        .where((mentor) => mentor.name.toLowerCase().contains(_searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMyMentors = _getFilteredMentors(_myMentors);
    final filteredExploreMentors = _getFilteredMentors(_exploreMentors);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0066),
        title: Text(
          'CATALIFT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined,
                color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            const Text(
              'Mentors',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A0066),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTabBar(controller: _tabController),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  // color: const Color(0xFFF0F0F5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  )),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // My Mentors Tab
                  filteredMyMentors.isEmpty
                      ? const Center(
                          child: Text(
                            'No mentors found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredMyMentors.length,
                          itemBuilder: (context, index) {
                            return MentorCard(mentor: filteredMyMentors[index]);
                          },
                        ),

                  filteredExploreMentors.isEmpty
                      ? const Center(
                          child: Text(
                            'No mentors found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredExploreMentors.length,
                          itemBuilder: (context, index) {
                            return MentorCard(
                                mentor: filteredExploreMentors[index]);
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0A0066),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore Mentors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Courses',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          selectedFontSize: 16,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          backgroundColor: const Color(0xFF0A0066),
          elevation: 10,
        ),
      ),
    );
  }
}
