import 'package:flutter/material.dart';
import 'package:user_list/features/event_details/domain/entities/resource_entity.dart';
import 'package:user_list/features/event_details/presentation/view/widget/resources/certificate_list.dart';

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
    final hasCertificates = resource.certificates.isNotEmpty;

    Widget titleWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Profile image
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFFC0C0C0), // Or a specific color from your theme
                width: 1.0,
              ),
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(resource.photo),
            ),
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
                  style: TextStyle(fontSize: 14.0, color: Color(0XFFA8A7A8)),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (hasCertificates) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.only(right: 16),
          childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          title: titleWidget,
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            onToggle();
          },
          children: [
            CertificateList(certificates: resource.certificates),
            SizedBox(height: 16),
          ],
        ),
      );
    } else {
      // Render a non-expandable widget if there are no certificates
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: titleWidget,
      );
    }
  }
}
