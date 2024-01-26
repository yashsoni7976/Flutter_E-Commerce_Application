import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store/common/widgets/icon/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_images.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_text_title.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verify_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                      imageUrl: TImages.productImage1, applyImageRadius: true),
                ),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                  ),
                ),

                /// -- favourite Icon
                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                )
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTextTitle(title: 'Green Nike Shoes UK-9 Size', smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems/2),
                      TBrandTitleWithVerifiedIconWidget(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: TProductPriceText(price: '256')),

                      /// Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg*1.2,
                          height: TSizes.iconLg*1.2,
                          child: Center(child: Icon(Iconsax.add, color: TColors.white,),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
