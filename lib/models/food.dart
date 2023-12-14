class Food {
  String name;
  String price;
  String imagepath;
  String ratings;

  Food({
    required this.name,
    required this.price,
    required this.imagepath,
    required this.ratings,
  });

  String get _name => name;
  String get _price => price;
  String get _imagepath => imagepath;
  String get _ratings => ratings;
}
