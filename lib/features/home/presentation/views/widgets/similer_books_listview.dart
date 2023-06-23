import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomBookImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpqXPPIuVinWdNTw8u8O8If0E3C8hhtq1_G0OGR6un7fcQULWV7Zv_Q91juxyaK3Y_4H4&usqp=CAU',
              ),
            );
          }),
    );
  }
}
