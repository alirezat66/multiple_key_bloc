import 'package:flutter/material.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';
import 'package:user_list/features/event_details/presentation/view/widget/certificate_list.dart';

class ResourceItem extends StatelessWidget {
  final ResourceEntity resource;
  final bool isExpanded;
  final VoidCallback onToggle;

  const ResourceItem({
    super.key,
    required this.resource,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User profile and info
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: resource.certificates.isNotEmpty ? onToggle : null,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Profile image
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(resource.photo),
                  ),
                  const SizedBox(width: 16.0),
                  // User info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${resource.firstName} ${resource.name}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          resource.userId,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Arrow icon if there are certificates
                  if (resource.certificates.isNotEmpty)
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[600],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        // Certificates list with improved animation
        if (resource.certificates.isNotEmpty)
          AnimatedCrossFade(
            firstChild: const SizedBox(height: 0),
            secondChild: CertificateList(certificates: resource.certificates),
            crossFadeState:
                isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        // Divider
        const Divider(height: 1),
      ],
    );
  }
}
