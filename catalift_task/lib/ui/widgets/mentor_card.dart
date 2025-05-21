import 'package:catalift_task/common/model/mentor_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorCard extends StatelessWidget {
  final Mentor mentor;
  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(mentor.imageUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.green, size: 16),
                          const SizedBox(width: 4),
                          Text("4.9"),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF6E5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              mentor.sector,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                      Text(
                        mentor.name,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined,
                              size: 14, color: Colors.blueGrey),
                          const SizedBox(width: 4),
                          Text("${mentor.experience} "),
                          const SizedBox(width: 6),
                          Text(
                            mentor.domain,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text("${mentor.reviews} Reviews",
                          style: const TextStyle(color: Colors.deepPurple)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              mentor.description,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "${mentor.compatibility.toInt()}% compatibility",
                style: const TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
