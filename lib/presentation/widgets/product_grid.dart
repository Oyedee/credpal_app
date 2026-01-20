import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final products = [
      Product(
        name: 'Nokia G20',
        price: 39780,
        originalPrice: 88000,
        image: 'assets/images/nokia.png',
        vendor: 'Nokia',
        vendorLogo: 'assets/images/orile.jpg',
        discount: 40,
      ),
      Product(
        name: 'iPhone XS Max 4GB..',
        price: 295999,
        originalPrice: 315000,
        image: 'assets/images/iphone.png',
        vendor: 'Ogabassey',
        vendorLogo: 'assets/images/ogabassey.png',
      ),
      Product(
        name: 'Anker Soundcore..',
        price: 39780,
        originalPrice: 88000,
        image: 'assets/images/anker.png',
        vendor: 'OkayFones',
        vendorLogo: 'assets/images/slot.png',
      ),
      Product(
        name: 'iPhone 12 Pro',
        price: 490500,
        originalPrice: 515000,
        image: 'assets/images/iphone12.png',
        vendor: 'iStore',
        vendorLogo: 'assets/images/hubmart.png',
      ),
      Product(
        name: 'iPhone XS Max 4GB..',
        price: 295999,
        originalPrice: 315000,
        image: 'assets/images/iphone.png',
        vendor: 'Ogabassey',
        vendorLogo: 'assets/images/ogabassey.png',
      ),
      Product(
        name: 'Nokia G20',
        price: 39780,
        originalPrice: 88000,
        image: 'assets/images/nokia.png',
        vendor: 'Nokia',
        vendorLogo: 'assets/images/orile.jpg',
        discount: 40,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        // Formula: PaddingLeft + W + Spacing + W + Spacing + 0.1W = ScreenWidth
        // 20 + W + 16 + W + 16 + 0.1W = ScreenWidth
        // 2.1W + 52 = ScreenWidth
        // W = (ScreenWidth - 52) / 2.1
        final cardWidth = (screenWidth - 52) / 2.1;

        // Let's decide on an aspect ratio or height.
        // If we want slightly more compact cards, let's say AspectRatio (H/W) = 1.3 or 1.4
        const childAspectRatio =
            1.3; // Height / Width = 1.3 (Example: W=150, H=195)

        // In horizontal GridView: ratio is Height / Width.
        // Flutter docs: "ratio of the cross-axis to the main-axis extent of each child."
        // Horizontal Scroll:
        // Cross Axis = Vertical (Height). Main Axis = Horizontal (Width).
        // Ratio = Height / Width.

        // So Height = Width * ratio
        final cardHeight = cardWidth * childAspectRatio;

        // Total Grid Height = (RowHeight * 2) + CrossAxisSpacing
        final totalHeight =
            (cardHeight * 2) +
            16 +
            20; // Added some buffer/padding if needed, or exact.
        // Note: GridView might need a tiny bit more constraint to avoid overflow if calculations are tight float math.

        return Container(
          height: totalHeight,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(color: Color(0xFFF1F3FE)),
          child: GridView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: childAspectRatio, // H/W
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        );
      },
    );
  }
}

class Product {
  final String name;
  final double price;
  final double? originalPrice;
  final String image;
  final String vendor;
  final String vendorLogo;
  final int? discount;

  Product({
    required this.name,
    required this.price,
    this.originalPrice,
    required this.image,
    required this.vendor,
    required this.vendorLogo,
    this.discount,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'en_NG',
      name: 'NGN',
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Discount and Vendor
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    product.discount != null
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF0F3FF),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Pay',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: const Color(0xFF274FED),
                                  ),
                                ),
                                Text(
                                  '${product.discount}%',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF274FED),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            child: Image.asset(product.vendorLogo),
                          ), // Placeholder to keep layout if needed
                  ],
                ),
                const SizedBox(height: 8),
                // Product Image
                Expanded(
                  child: Center(
                    child: Image.asset(product.image, fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(height: 8),
                // Product Name
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A1A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Price
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        formatCurrency
                            .format(product.price)
                            .replaceAll('NGN', '₦'),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF274FED),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (product.originalPrice != null) ...[
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          formatCurrency
                              .format(product.originalPrice)
                              .replaceAll('NGN', '₦'),
                          style: TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                            color: const Color(0xFF9CA3AF),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
