import 'package:flutter/material.dart';
import 'package:ticket_app/base/styles/app_styles.dart';

class TicketPositionedCircles extends StatelessWidget {
  final bool? pos;
  const TicketPositionedCircles({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            left: pos==true ? 25 : null,
            right: pos==true ? null : 25,
            top: 260,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppStyles.textColor, width: 2)
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: AppStyles.textColor,
              ),

          ));
  }
}