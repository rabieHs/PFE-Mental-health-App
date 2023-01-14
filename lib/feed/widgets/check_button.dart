import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckButton extends StatelessWidget {
  final bool isActive;
  final String description;
  const CheckButton(
      {super.key, required this.isActive, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {},
            child: isActive
                ? const Icon(Icons.check_circle_outlined,
                    size: 20, color: Colors.white)
                : Icon(
                    Icons.circle_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(description,
                  maxLines: 20,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    // ignore: unrelated_type_equality_checks
                    decoration: isActive
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  )))
        ],
      ),
    );
  }
}
