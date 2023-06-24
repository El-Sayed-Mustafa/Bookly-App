import 'package:e_bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:e_bookly/core/utils/widgets/custom_loading_indicator.dart';
import 'package:e_bookly/features/home/presentation/manger/Featured_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/go_routes.dart';
import 'custom_book_image.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRoute.kBookDetailsView,
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKSPVqHle9tBvH8OgnpmF9nAAefDmGTWvk3wGfbInA0x9Uql3v0uZIxkguUYcZ6fbRcS0&usqp=CAU',
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeatureBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
