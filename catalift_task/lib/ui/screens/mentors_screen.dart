import 'package:catalift_task/common/model/mentor_model.dart';
import 'package:catalift_task/ui/widgets/mentor_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({
    super.key,
  });

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  int selectedTab = 1; // 0: My Mentors, 1: Explore

  // Sample mentor list
  final List<Mentor> mentors = [
    Mentor(
      name: "Gaurav Samant",
      sector: "IT Sector",
      experience: "4 years",
      domain: "Business Administration",
      reviews: 175,
      description:
          "Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums",
      compatibility: 98,
      imageUrl: 'assets/images/profile.png',
    ),
    Mentor(
      name: "Gaurav Samant",
      sector: "IT Sector",
      experience: "4 years",
      domain: "Business Administration",
      reviews: 175,
      description:
          "Strategy Manager @CEO Office | Ex-eBay & L&T | MDI Gurgaon . ESCP Europe | 32+ National Case Comps Podiums",
      compatibility: 82,
      imageUrl: 'assets/images/profile.png',
    ),
    // Add more mentors if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0140),
        title: Row(
          children: [
            Text(
              'CATA',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'LIFT',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.person, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.chat_bubble_outline, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedTab == 0
                            ? const Color(0xFF0D0140)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'My Mentors',
                          style: TextStyle(
                            color:
                                selectedTab == 0 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedTab == 1
                            ? const Color(0xFF0D0140)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Explore',
                          style: TextStyle(
                            color:
                                selectedTab == 1 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Mentor list
          Expanded(
            child: ListView.builder(
              itemCount: mentors.length,
              itemBuilder: (context, index) {
                return MentorCard(mentor: mentors[index]);
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: const Color(0xFF0D0140),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: 'Explore Mentors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'Courses'),
        ],
      ),
    );
  }
}
