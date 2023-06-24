import 'package:e_bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:e_bookly/core/utils/widgets/custom_loading_indicator.dart';
import 'package:e_bookly/features/home/presentation/manger/Featured_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/style.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 15,
          ),
          CustomSearchTextField(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Results',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BookListViewItem(
                  model: state.books[index],
                ),
              );
            },
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
