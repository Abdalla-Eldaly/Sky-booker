

import 'package:sky_booker/app/constants.dart';
import 'package:sky_booker/app/extentions.dart';

import '../../domain/models/models.dart';
import '../response/response.dart';

extension DimensionsResponseMapper on DimensionsResponse? {
  Dimensions toDomain() {
    return Dimensions(
        this?.width.orZeroForDouble() ?? Constants.zeroForD,
        this?.height.orZeroForDouble() ?? Constants.zeroForD,
        this?.depth.orZeroForDouble() ?? Constants.zeroForD);
  }
}

extension ReviewResponseMapper on ReviewResponse? {
  Review toDomain() {
    return Review(
        this?.rating.orZeroForInt() ?? Constants.zero,
        this?.comment.orEmpty() ?? Constants.empty,
        this?.date.orEmpty() ?? Constants.empty,
        this?.reviewerName.orEmpty() ?? Constants.empty,
        this?.reviewerEmail.orEmpty() ?? Constants.empty);
  }
}

extension MetaResponseMapper on MetaResponse? {
  Meta toDomain() {
    return Meta(
        this?.createdAt.orEmpty() ?? Constants.empty,
        this?.updatedAt.orEmpty() ?? Constants.empty,
        this?.barcode.orEmpty() ?? Constants.empty,
        this?.qrCode.orEmpty() ?? Constants.empty);
  }
}

extension ProductResponseMapper on ProductResponse? {
  Product toDomain() {
    return Product(
      this?.id.orZeroForInt() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
      this?.category.orEmpty() ?? Constants.empty,
      this?.price.orZeroForDouble() ?? Constants.zeroForD,
      this?.discountPercentage.orZeroForDouble() ?? Constants.zeroForD,
      this?.rating.orZeroForDouble() ?? Constants.zeroForD,
      this?.stock.orZeroForInt() ?? Constants.zero,
      this?.tags ?? Constants.emptyList ,
      this?.brand.orEmpty() ?? Constants.empty,
      this?.sku.orEmpty() ?? Constants.empty,
      this?.weight.orZeroForDouble() ?? Constants.zeroForD,
      this!.dimensions.toDomain(),
      this?.warrantyInformation.orEmpty() ?? Constants.empty,
      this?.shippingInformation.orEmpty() ?? Constants.empty,
      this?.availabilityStatus.orEmpty() ?? Constants.empty,
      this?.reviews?.map((e) => e.toDomain()).toList() ?? const Iterable.empty().cast<Review>().toList(),
      this?.returnPolicy.orEmpty() ?? Constants.empty,
      this?.minimumOrderQuantity.orZeroForInt() ?? Constants.zero,
      this!.meta.toDomain(),
      this?.images ?? Constants.emptyList,
      this?.thumbnail.orEmpty() ?? Constants.empty,
    );
  }
}

extension ProductListResponseMapper on ProductListResponse? {
  ProductObject toDomain() {
    return ProductObject(
      this?.products?.map((e) => e.toDomain()).toList() ?? const Iterable.empty().cast<Product>().toList(),
      this?.total.orZeroForInt() ?? Constants.zero,
      this?.skip.orZeroForInt() ?? Constants.zero,
      this?.limit.orZeroForInt() ?? Constants.zero,
    );
  }
}
