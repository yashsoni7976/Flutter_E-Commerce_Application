import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_images.dart';
import 'package:t_store/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCatergoriesScreen extends StatelessWidget {
  const SubCatergoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Sports Shirt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          /// Banner
          children: [
            const TRoundedImage(
              imageUrl: TImages.promoBanner3,
              width: double.infinity,
              applyImageRadius: true,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sub Category
            Column(
              children: [
                /// Heading
                TSectionHeading(title: 'Sports Shirt', onPressed: () {}),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    itemBuilder: (context, index) => const TProductCardHorizontal(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
