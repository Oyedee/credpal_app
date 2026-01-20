import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6), // Light grey
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Search for products or stores',
                  hintStyle: TextStyle(
                    color: const Color(0xff9CA3AF),
                    fontSize: 14,
                  ),
                  prefixIcon: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset(
                      'assets/svgs/search-normal.svg',
                      height: 16,
                      width: 16,
                      color: Color(0xff9CA3AF),
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svgs/scan.svg',
                color: const Color(0xFF4B5563),
              ),
              color: const Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    );
  }
}
