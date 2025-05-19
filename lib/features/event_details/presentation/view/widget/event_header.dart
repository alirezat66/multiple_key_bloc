import 'package:flutter/material.dart';
import 'package:user_list/core/extensions/theme_extension.dart';

class EventHeader extends StatelessWidget {
  final String eventName;

  const EventHeader({super.key, required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: 'Event: ',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            TextSpan(
              text: eventName,
              style: TextStyle(
                fontSize: 16.0,
                color: context.colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
