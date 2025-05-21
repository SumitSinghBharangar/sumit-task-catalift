import 'package:catalift_task/common/model/mentor_model.dart';
import 'package:flutter/material.dart';

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({
    super.key,
    required this.mentor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(mentor.imageUrl),
                ),
                const SizedBox(width: 12),

                // Mentor Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star_outline,
                              color: Colors.grey, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            mentor.rating.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              mentor.sector,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.amber,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        mentor.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Experience and Domain
            Row(
              children: [
                const Icon(Icons.access_time,
                    size: 16, color: Color(0xFF0A0066)),
                const SizedBox(width: 4),
                Text(
                  mentor.experience,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0A0066),
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.work_outline,
                    size: 16, color: Color(0xFF0A0066)),
                const SizedBox(width: 4),
                Text(
                  mentor.domain,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0A0066),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Reviews
            Row(
              children: [
                const Icon(Icons.comment, size: 16, color: Color(0xFF0A0066)),
                const SizedBox(width: 4),
                Text(
                  '${mentor.reviews} Reviews',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0A0066),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              mentor.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),

            // Compatibility
            Row(
              children: [
                Text(
                  '${mentor.compatibility.toInt()}%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: mentor.compatibility > 90
                        ? Colors.green
                        : mentor.compatibility > 80
                            ? Colors.orange
                            : Colors.amber,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'compatibility',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
