// To parse this JSON data, do
//
//     final facebookPagesResponse = facebookPagesResponseFromJson(jsonString);

import 'dart:convert';

FacebookPagesResponse facebookPagesResponseFromJson(String str) => FacebookPagesResponse.fromJson(json.decode(str));

String facebookPagesResponseToJson(FacebookPagesResponse data) => json.encode(data.toJson());

class FacebookPagesResponse {
  List<FbPageData> data;
  Paging paging;

  FacebookPagesResponse({
    this.data,
    this.paging,
  });

  factory FacebookPagesResponse.fromJson(Map<String, dynamic> json) => new FacebookPagesResponse(
    data: new List<FbPageData>.from(json["data"].map((x) => FbPageData.fromJson(x))),
    paging: Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "paging": paging.toJson(),
  };
}

class FbPageData {
  String name;
  Picture picture;
  String id;
  InstagramBusinessAccount instagramBusinessAccount;

  FbPageData({
    this.name,
    this.picture,
    this.id,
    this.instagramBusinessAccount,
  });

  factory FbPageData.fromJson(Map<String, dynamic> json) => new FbPageData(
    name: json["name"],
    picture: Picture.fromJson(json["picture"]),
    id: json["id"],
    instagramBusinessAccount: json["instagram_business_account"] == null ? null : InstagramBusinessAccount.fromJson(json["instagram_business_account"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "picture": picture.toJson(),
    "id": id,
    "instagram_business_account": instagramBusinessAccount == null ? null : instagramBusinessAccount.toJson(),
  };
}

class InstagramBusinessAccount {
  String id;

  InstagramBusinessAccount({
    this.id,
  });

  factory InstagramBusinessAccount.fromJson(Map<String, dynamic> json) => new InstagramBusinessAccount(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class Picture {
  PictureData data;

  Picture({
    this.data,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => new Picture(
    data: PictureData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class PictureData {
  int height;
  bool isSilhouette;
  String url;
  int width;

  PictureData({
    this.height,
    this.isSilhouette,
    this.url,
    this.width,
  });

  factory PictureData.fromJson(Map<String, dynamic> json) => new PictureData(
    height: json["height"],
    isSilhouette: json["is_silhouette"],
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "is_silhouette": isSilhouette,
    "url": url,
    "width": width,
  };
}

class Paging {
  Cursors cursors;

  Paging({
    this.cursors,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => new Paging(
    cursors: Cursors.fromJson(json["cursors"]),
  );

  Map<String, dynamic> toJson() => {
    "cursors": cursors.toJson(),
  };
}

class Cursors {
  String before;
  String after;

  Cursors({
    this.before,
    this.after,
  });

  factory Cursors.fromJson(Map<String, dynamic> json) => new Cursors(
    before: json["before"],
    after: json["after"],
  );

  Map<String, dynamic> toJson() => {
    "before": before,
    "after": after,
  };
}
