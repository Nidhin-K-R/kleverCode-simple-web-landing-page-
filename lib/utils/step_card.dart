import 'package:flutter/material.dart';

class StepCard extends StatelessWidget {
  final String step;
  final String title;
  final String description;
  final IconData icon;
  final bool isLast;

  const StepCard({
    super.key,
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: step circle
          Column(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue.shade700,
                child: Text(
                  step,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!isLast) ...[
                const SizedBox(height: 8),
                Container(width: 2, height: 60, color: Colors.grey.shade300),
              ],
            ],
          ),
          const SizedBox(width: 16),
          // Right: content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.blueAccent, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(description, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
