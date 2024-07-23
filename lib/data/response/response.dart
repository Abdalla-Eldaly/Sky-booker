import 'package:json_annotation/json_annotation.dart';


part 'response.g.dart';

@JsonSerializable()
class DimensionsResponse {
  @JsonKey(name: "width")
  double? width;
  @JsonKey(name: "height")
  double? height;
  @JsonKey(name: "depth")
  double? depth;

  DimensionsResponse({this.width, this.height, this.depth});

  factory DimensionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DimensionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsResponseToJson(this);
}

@JsonSerializable()
class ReviewResponse {
  @JsonKey(name: "rating")
  int? rating;
  @JsonKey(name: "comment")
  String? comment;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "reviewerName")
  String? reviewerName;
  @JsonKey(name: "reviewerEmail")
  String? reviewerEmail;

  ReviewResponse({this.rating, this.comment, this.date, this.reviewerName, this.reviewerEmail});

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}

@JsonSerializable()
class MetaResponse {
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "barcode")
  String? barcode;
  @JsonKey(name: "qrCode")
  String? qrCode;

  MetaResponse({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);
}


@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "discountPercentage")
  double? discountPercentage;
  @JsonKey(name: "rating")
  double? rating;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "tags")
  List<String>? tags;
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "weight")
  double? weight;
  @JsonKey(name: "dimensions")
  DimensionsResponse? dimensions;
  @JsonKey(name: "warrantyInformation")
  String? warrantyInformation;
  @JsonKey(name: "shippingInformation")
  String? shippingInformation;
  @JsonKey(name: "availabilityStatus")
  String? availabilityStatus;
  @JsonKey(name: "reviews")
  List<ReviewResponse>? reviews;
  @JsonKey(name: "returnPolicy")
  String? returnPolicy;
  @JsonKey(name: "minimumOrderQuantity")
  int? minimumOrderQuantity;
  @JsonKey(name: "meta")
  MetaResponse? meta;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "thumbnail")
  String? thumbnail;

  ProductResponse({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductListResponse {
  @JsonKey(name: "products")
  List<ProductResponse>? products;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "skip")
  int? skip;
  @JsonKey(name: "limit")
  int? limit;

  ProductListResponse({this.products, this.total, this.skip, this.limit});

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);
}
