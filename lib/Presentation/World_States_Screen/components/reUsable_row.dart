import 'package:covid_tracker_app_with_provider/Presentation/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: title),
              CustomText(text: value),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
