import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class TestimonialCard extends StatelessWidget {
  final String quote;
  final String name;
  final String role;

  const TestimonialCard({
    super.key,
    required this.quote,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(221, 33, 33, 33),

      elevation: 0.6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Responsive.isMobile(context)
            ? Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blueGrey.shade800,
                      child: Text(
                        _initials(name),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    '"$quote"',

                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    maxLines: 5,
                  ),

                  const SizedBox(height: 10),

                  Flexible(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),

                  Flexible(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        role,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blueGrey.shade800,
                    child: Text(
                      _initials(name),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '"$quote"',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: AlignmentGeometry.bottomRight,
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentGeometry.bottomRight,
                          child: Text(
                            role,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.split(' ');
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts[0][0] + parts.last[0]).toUpperCase();
  }
}
