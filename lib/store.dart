class Store{
  final int id;
  final String name;
  final String app;
  final String category;
  final int discount;
  final int minimunPrice;
  final String content;
  final int visible;

  Store(this.id, this.name, this.app, this.category, this.discount, this.minimunPrice, this.content, this.visible);

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      json['id'] as int,
      json['name'] as String,
      json['app'] as String,
      json['category'] as String,
      json['discount'] as int,
      json['minimunPrice'] as int,
      json['content'] as String,
      json['visible'] as int,
    );
  }

  @override
  String toString() {
    return "($id, $name, $app, $category, $discount, $minimunPrice, $content, $visible)";
  }
}
