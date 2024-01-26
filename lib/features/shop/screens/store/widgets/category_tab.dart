import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Brands
            const TBrandShowcase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3],),
            const TBrandShowcase(images: [TImages.productImage1, TImages.productImage2, TImages.productImage3],),

            /// Products
            TSectionHeading(title: "You Might Like", onPressed: (){},),
            const SizedBox(height: TSizes.spaceBtwItems,),

            TGridLayout(itemCount: 4, itemBuilder: (_,index) => const TProductCardVertical())

          ],

        ),
      ),]
    );
  }
}
