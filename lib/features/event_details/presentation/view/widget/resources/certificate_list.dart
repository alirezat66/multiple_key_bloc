import 'package:flutter/material.dart';

class CertificateList extends StatelessWidget {
  final List<String> certificates;

  const CertificateList({super.key, required this.certificates});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: Color(0xFF0060C0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: const Text(
            'Certificates',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 12),
        ...certificates.map(
          (certificate) => Container(
            decoration: BoxDecoration(
              color:
                  certificates.indexOf(certificate) % 2 == 0
                      ? Colors.grey[50]
                      : Colors.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(certificate, style: const TextStyle(fontSize: 14)),
                Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
