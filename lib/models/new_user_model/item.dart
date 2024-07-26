class Item {
  Store? store;

  Item({this.store});

  Item.fromJson(Map<String, dynamic> json) {
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Store {
  String? name;
  Location? location;
  List<Products>? products;

  Store({this.name, this.location, this.products});

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? address;
  String? city;
  String? zipcode;

  Location({this.address, this.city, this.zipcode});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    return data;
  }
}

class Products {
  String? id;
  String? name;
  double? price;
  bool? inStock;
  List<String>? categories;
  List<Reviews>? reviews;

  Products(
      {this.id,
      this.name,
      this.price,
      this.inStock,
      this.categories,
      this.reviews});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    inStock = json['inStock'];
    categories = json['categories'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['inStock'] = this.inStock;
    data['categories'] = this.categories;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? user;
  double? rating;
  String? comment;

  Reviews({this.user, this.rating, this.comment});

  Reviews.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    return data;
  }
}
