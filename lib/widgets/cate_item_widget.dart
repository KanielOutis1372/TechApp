import 'package:flutter/material.dart';

import '../utils/my_definition.dart';

class CateItemWidget extends StatelessWidget {
  const CateItemWidget({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.callF,
  });

  final String imgUrl;
  final String name;
  final VoidCallback callF;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callF,
      child: SizedBox(
        height: 100,
        width: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50, // Độ rộng của container chứa ảnh
              height: 50, // Độ cao của container chứa ảnh
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                color: MyDefinition.SECONDARY_COLOR_2,
                fontSize: MyDefinition.SUB_FONT_SIZE + 1,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
