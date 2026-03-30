import 'package:ecommerce_app2/core/routing/app_routes.dart';
import 'package:ecommerce_app2/core/styles/app_colors.dart';
import 'package:ecommerce_app2/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app2/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app2/features/home/widgets/category_item_widget.dart';
import 'package:ecommerce_app2/features/home/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(28),
          SizedBox(width: 335.w, child: Text("Discover")),
          const HeightSpace(16),
          Row(
            children: [
              CustomTextField(width: 270.w, hintText: "Search For Clothes"),
              const WidthSpace(8),
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),
          const HeightSpace(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
                CategoryItemWidget(categoryName: "All"),
              ],
            ),
          ),
          const HeightSpace(16),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 16.sp,
                childAspectRatio: 0.8,
              ),
              children: [
                ProductItemWidget(
                  title: "Shoes",
                  price: "1190 \$",
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRouter.productScreen);
                  },
                ),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
                ProductItemWidget(title: "Shoes", price: "1190 \$"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
