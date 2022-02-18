import 'dart:math';

class RappiCategory {
  const RappiCategory({
    required this.name,
    required this.products,
  });
  final String name;
  final List<RappiProduct> products;
}

class RappiProduct {
  const RappiProduct({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  final String name;
  final String description;
  final double price;
  final String image;
}

/// Lista total de categorías con sus productos que se usará en la app.
final List<RappiCategory> rappiCategories = generateCatProd();

generateCatProd({int? cat, int? prod}) {
  Random random = Random();

  int rCat = cat ?? random.nextInt(10) + 10;

  List<RappiCategory> categories = [];
  int prodNum = 0;

  for (int ic = 0; ic < rCat; ic++) {
    int rPro = prod ?? random.nextInt(10) + 3;

    List<RappiProduct> products = [];

    for (int ip = 0; ip < rPro; ip++) {
      prodNum++;

      products.add(RappiProduct(
          name: 'Producto $prodNum',
          description: 'Producto $prodNum de la categoría ${ic + 1}',
          price: random.nextDouble() * 1000,
          image:
              "https://random.imagecdn.app/${prodNum + 200}/${prodNum + 200}"));
    }

    categories.add(RappiCategory(
      name: 'Categoría ${ic + 1}',
      products: products,
    ));
  }

  return categories;
}
