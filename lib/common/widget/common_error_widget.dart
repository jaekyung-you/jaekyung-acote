import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.grey,
            size: 48,
          ),
          SizedBox(height: 16),
          Text(
            '에러가 발생했습니다.\n잠시 후, 다시 시도해주세요.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
