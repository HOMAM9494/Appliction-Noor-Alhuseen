class ItemModel {
  final int id;
  final String name;
  String img;
  final String value;
  bool accepting;

  ItemModel(
      {required this.id,
        required this.name,
      required this.value,
      required this.img,
      this.accepting = false}
      );
}
