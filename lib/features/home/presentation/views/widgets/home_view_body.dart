import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';
import 'custom_app_bar.dart';
import 'custom_list_view.dart';
import 'custom_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeaturedListView(),
          SizedBox(height: 30,),
          Text('Best Seller',style: Styles.titleMedium,)
        ],
      ),
    );
  }
}

