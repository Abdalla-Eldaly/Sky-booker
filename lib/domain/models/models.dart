class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions(this.width, this.height, this.depth);
}

class Review {
  int rating;
  String comment;
  String date;
  String reviewerName;
  String reviewerEmail;

  Review(this.rating, this.comment, this.date, this.reviewerName,
      this.reviewerEmail);
}

class Meta {
  String createdAt;
  String updatedAt;
  String barcode;
  String qrCode;

  Meta(this.createdAt, this.updatedAt, this.barcode, this.qrCode);
}

class Product {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> tags;
  String brand;
  String sku;
  double weight;
  Dimensions dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<Review> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Meta meta;
  List<String> images;
  String thumbnail;

  Product(
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
      );
}

class ProductObject {
  List<Product>? products;
  int total;
  int skip;
  int limit;

  ProductObject(this.products, this.total, this.skip, this.limit);
}
