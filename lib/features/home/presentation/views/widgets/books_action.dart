import 'package:e_bookly/features/home/data/models/book_models/book_models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModels});
  final BookModels bookModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: "Free",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () async {
              final Uri url = Uri.parse(bookModels.volumeInfo.previewLink!);

              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              } else {
                await launchUrl(url);
              }
            },
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            text: 'Free Preview',
          ))
        ],
      ),
    );
  }
}
