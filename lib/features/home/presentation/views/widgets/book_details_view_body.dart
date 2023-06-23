import 'package:e_bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:e_bookly/features/home/presentation/views/widgets/similer_books_listview.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';
import 'box_action.dart';
import 'custom_book_details_appbar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .17),
                  child: const CustomBookImage(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpqXPPIuVinWdNTw8u8O8If0E3C8hhtq1_G0OGR6un7fcQULWV7Zv_Q91juxyaK3Y_4H4&usqp=CAU',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("The Jungle Book", style: Styles.textStyle30),
                const SizedBox(
                  height: 6,
                ),
                const Opacity(
                    opacity: .7,
                    child: Text("Elsayed Book", style: Styles.textStyle18)),
                const SizedBox(
                  height: 6,
                ),
                const BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const BookAction(),
                const Expanded(
                  child: SizedBox(
                    height: 35,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("You can also like",
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
