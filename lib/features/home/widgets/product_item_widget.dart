import 'package:ecommerce_app2/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final Function()? onTap;
  const ProductItemWidget({
    super.key,
    required this.title,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
          ),
          const HeightSpace(8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const HeightSpace(4),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
