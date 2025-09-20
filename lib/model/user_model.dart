// ignore_for_file: public_member_api_docs, sort_constructors_first
// class UserModel {
//   final int id;
//   final String name;
//   final String username;
//   final String email;
//   final Address address;
//   final String phone;
//   final String website;
//   final Company company;
//   bool isFavourite;

//   UserModel({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.address,
//     required this.phone,
//     required this.website,
//     required this.company,
//     required this.isFavourite
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       username: json['username'],
//       email: json['email'],
//       address: Address.fromJson(json['address']),
//       phone: json['phone'],
//       website: json['website'],
//       company: Company.fromJson(json['company']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'username': username,
//       'email': email,
//       'address': address.toJson(),
//       'phone': phone,
//       'website': website,
//       'company': company.toJson(),
//     };
//   }
// }

// class Address {
//   final String street;
//   final String suite;
//   final String city;
//   final String zipcode;
//   final Geo geo;

//   Address({
//     required this.street,
//     required this.suite,
//     required this.city,
//     required this.zipcode,
//     required this.geo,
//   });

//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       street: json['street'],
//       suite: json['suite'],
//       city: json['city'],
//       zipcode: json['zipcode'],
//       geo: Geo.fromJson(json['geo']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'street': street,
//       'suite': suite,
//       'city': city,
//       'zipcode': zipcode,
//       'geo': geo.toJson(),
//     };
//   }

//   String get fullAddress => '$street, $suite, $city $zipcode';
// }

// class Geo {
//   final String lat;
//   final String lng;

//   Geo({
//     required this.lat,
//     required this.lng,
//   });

//   factory Geo.fromJson(Map<String, dynamic> json) {
//     return Geo(
//       lat: json['lat'],
//       lng: json['lng'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'lat': lat,
//       'lng': lng,
//     };
//   }
// }

// class Company {
//   final String name;
//   final String catchPhrase;
//   final String bs;

//   Company({
//     required this.name,
//     required this.catchPhrase,
//     required this.bs,
//   });

//   factory Company.fromJson(Map<String, dynamic> json) {
//     return Company(
//       name: json['name'],
//       catchPhrase: json['catchPhrase'],
//       bs: json['bs'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'catchPhrase': catchPhrase,
//       'bs': bs,
//     };
//   }
// }



class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  bool isFavourite; // Keep it mutable if you want to toggle

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
    this.isFavourite = false, // default to false
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
      isFavourite: json['isFavourite'] ?? false, // handle null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': website,
      'company': company.toJson(),
      'isFavourite': isFavourite,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
    bool? isFavourite,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }

  String get fullAddress => '$street, $suite, $city $zipcode';
}

class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}
