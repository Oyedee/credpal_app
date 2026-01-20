import 'package:flutter/material.dart';

class MerchantSection extends StatelessWidget {
  const MerchantSection({super.key});

  @override
  Widget build(BuildContext context) {
    final merchants = [
      Merchant(
        name: 'Justrite',
        color: const Color(0xFF000080),
        hasGreenDot: true,
        logo: 'assets/images/justrite.png',
      ),
      Merchant(
        name: 'Orile Restaurant',
        color: Colors.black,
        hasGreenDot: true,
        logo: 'assets/images/orile.jpg',
      ),
      Merchant(
        name: 'Slot',
        color: const Color(0xFFED3237),
        hasGreenDot: true,
        logo: 'assets/images/slot.png',
      ),
      Merchant(
        name: 'Pointek',
        color: const Color(0xFF00BCD4),
        hasGreenDot: true,
        logo: 'assets/images/pointek.png',
      ),
      Merchant(
        name: 'ogabassey',
        color: Colors.white,
        hasGreenDot: true,
        isLight: true,
        logo: 'assets/images/ogabassey.png',
      ),
      Merchant(
        name: 'Casper Stores',
        color: const Color(0xFFFF4081),
        hasGreenDot: false,
        logo: 'assets/images/casper.png',
      ),
      Merchant(
        name: 'Dreamworks',
        color: const Color(0xFF3F51B5),
        hasGreenDot: false,
        logo: 'assets/images/dreamworks.png',
      ),
      Merchant(
        name: 'Hubmart',
        color: Colors.black,
        hasGreenDot: true,
        logo: 'assets/images/hubmart.png',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Merchants',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF274FED),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: merchants.length,
            itemBuilder: (context, index) {
              return MerchantItem(merchant: merchants[index]);
            },
          ),
        ],
      ),
    );
  }
}

class Merchant {
  final String name;
  final Color color;
  final bool hasGreenDot;
  final bool isLight;
  final String logo;

  Merchant({
    required this.name,
    required this.color,
    this.hasGreenDot = false,
    this.isLight = false,
    required this.logo,
  });
}

class MerchantItem extends StatelessWidget {
  final Merchant merchant;

  const MerchantItem({super.key, required this.merchant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: merchant.color,
                border: merchant.isLight
                    ? Border.all(color: Colors.grey[200]!)
                    : null,
              ),
              child: Center(
                child: Image.asset(
                  merchant.logo,
                  //height: 30,
                  //width: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            if (merchant.hasGreenDot)
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981), // Green
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          merchant.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: const Color(0xFF1A1A1A),
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
