class Category {
  final String id;
  final String title;
  final String description;
  final String photo;
  Category parent;
  List<Category> children;

  Category(
      {this.id,
      this.title,
      this.description,
      this.photo,
      this.parent,
      this.children});

  void addChild(Category child) {
    if (children == null) children = <Category>[];

    children.add(child);
    child.parent = this;
  }

  Category copyWith(
      {String id,
      String title,
      String description,
      int photo,
      Category parent,
      List<Category> children}) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      parent: parent ?? this.parent?.copyWith(),
      children:
          children ?? this.children?.map((c) => c.copyWith())?.toList() ?? [],
    );
  }
}
