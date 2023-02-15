class MovieData {
  String? title;
  String? desc;
  String? month;
  int? year;
  String? img;
  String? logo;
  int? runtime;

  MovieData(
      {this.title,
      this.desc,
      this.month,
      this.year,
      this.img,
      this.logo,
      this.runtime});

  factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
        title: json['title'],
        desc: json['desc'],
        month: json['month'],
        year: json['year'],
        img: json['img'],
        logo: json['logo'],
        runtime: json['runtime'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'month': month,
        'year': year,
        'img': img,
        'logo': logo,
        'runtime': runtime,
      };
}
