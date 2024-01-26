import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_pricing_section.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupons TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark? TColors.black:TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingPricingSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    /// Payment Methods
                    TBillingPaymentSection(),
                    /// Address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(()=> SuccessScreen(image: TImages.successfulPaymentIcon, title: 'Payment Successful!', subtitle: 'Your Item will be shipped soon!', onPressed: () => Get.offAll(() => const NavigationMenu()))),
          child:  const Text('Checkout ₹450'),
        ),
      ),
    );
  }
}

