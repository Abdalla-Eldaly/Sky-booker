import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_booker/presentation/resources/assets_manger.dart';
import 'package:sky_booker/presentation/resources/color_manager.dart';
import 'package:sky_booker/presentation/resources/string_manger.dart';
import 'package:sky_booker/presentation/resources/text_style.dart';
import 'package:sky_booker/presentation/resources/value_manger.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductGridItem extends StatefulWidget {
  final String productImage;
  final String title;
  final String description;
  final double price;
  final double discount;
  final double rating;

  const ProductGridItem(
      {super.key,
      required this.productImage,
      required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.rating});

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: ColorManager.secondary.withOpacity(.35), width: AppSize.s2),
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s16),
                          topRight: Radius.circular(AppSize.s16),
                        ),
                        child: CachedNetworkImage(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 2,
                          imageUrl: widget.productImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          child: isFav
                              ? SvgPicture.asset(
                                  SVGAssets.favouriteDark,
                                  width: AppSize.s60,
                                )
                              : SvgPicture.asset(
                                  SVGAssets.favouriteLight,
                                  width: AppSize.s60,
                                ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppTextStyles.generalText(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          widget.description,
                          style: AppTextStyles.generalText(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: AppSize.s5),
                        FittedBox(
                          child: Row(
                            children: [
                              Text(
                                '${AppStrings.egyptionCoin} ${widget.price}',
                                style: AppTextStyles.generalText(context),
                              ),
                              const SizedBox(width: AppSize.s14),
                              Text(
                                '${widget.discount} ${AppStrings.egyptionCoin}',
                                style: TextStyle(
                                  color: ColorManager.primary.withOpacity(.5),
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: ColorManager.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.s5),
                        FittedBox(
                          child: Row(
                            children: [
                              Text(
                                '${AppStrings.review} (${widget.rating})',
                                style: AppTextStyles.smallText(context),
                              ),
                              const SizedBox(width: AppSize.s3),
                              SvgPicture.asset(SVGAssets.star),
                              const SizedBox(width: AppSize.s14),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.s12),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: AppPadding.p8,bottom: AppPadding.p10),
                child: SvgPicture.asset(SVGAssets.plus),
              )

            ],
          );
        },
      ),
    );
  }
}
