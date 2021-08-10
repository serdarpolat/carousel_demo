class ItemModel {
  final int idx;
  final String img;
  final String title;

  ItemModel(this.idx, this.img, this.title);
}

List<ItemModel> items = [
  ItemModel(0, "assets/images/1.jpg", "TOKYO"),
  ItemModel(1, "assets/images/2.jpg", "LONDON"),
  ItemModel(2, "assets/images/3.jpg", "BERLIN"),
  ItemModel(3, "assets/images/4.jpg", "PARIS"),
];
