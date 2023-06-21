import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: const [
          Expanded(
              child: CustomButton(
            text: "19.99€",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          )),
          Expanded(
              child: CustomButton(
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            text: 'Free Preview',
          ))
        ],
      ),
    );
  }
}
