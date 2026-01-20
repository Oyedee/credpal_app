import 'package:credpal_app/presentation/widgets/home_header.dart';
import 'package:credpal_app/presentation/widgets/merchant_section.dart';
import 'package:credpal_app/presentation/widgets/product_grid.dart';
import 'package:credpal_app/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFD0DAFF),
            floating: true,
            snap: false,
            pinned: false,
            expandedHeight: 180, // Approximate height for content
            flexibleSpace: const FlexibleSpaceBar(
              background: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.only(top: 10), // Adjust if needed
                  child: HomeHeader(),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          const SliverToBoxAdapter(child: CustomSearchBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          const SliverToBoxAdapter(child: ProductGrid()),
          const SliverToBoxAdapter(child: MerchantSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
