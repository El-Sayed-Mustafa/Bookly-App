import 'package:e_bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:e_bookly/features/home/presentation/views/widgets/similer_books_listview.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/models/book_models/book_models.dart';
import 'box_action.dart';
import 'custom_book_details_appbar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModels bookModel;

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
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKSPVqHle9tBvH8OgnpmF9nAAefDmGTWvk3wGfbInA0x9Uql3v0uZIxkguUYcZ6fbRcS0&usqp=CAU',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    bookModel.volumeInfo.title!,
                    style: Styles.textStyle30,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                    opacity: .7,
                    child: Text(bookModel.volumeInfo.authors![0],
                        style: Styles.textStyle18)),
                const SizedBox(
                  height: 6,
                ),
                BookRating(
                  count: bookModel.volumeInfo.pageCount!,
                  rate: '5',
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
