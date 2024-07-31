import 'package:online_store/features/cart/data/models/cart_model.dart';
import 'package:online_store/features/favorite_products/data/models/fav_product_model.dart';
import 'package:online_store/features/home/data/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _db;

  static const String databaseName = "a2z_store.db";
  static const String favoritesTableName = "favorites";
  static const String cartsTableName = "carts";

  get db async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), databaseName);
      _db = await openDatabase(path,
          version: 3, onCreate: _onCreate, onUpgrade: _onUpgrade);
      return _db;
    }
    return _db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $favoritesTableName (
        id INTEGER NOT NULL,
        userId TEXT NOT NULL,
        title TEXT NOT NULL,
        price FLOAT NOT NULL,
        image TEXT NOT NULL,
        category TEXT NOT NULL,
        rate FLOAT NOT NULL,
        reviews INTEGER NOT NULL

        )
''');

    await db.execute('''
  CREATE TABLE $cartsTableName (
        product_id INTEGER NOT NULL,
        user_id TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        price FLOAT NOT NULL,
        image_url TEXT NOT NULL,
        title TEXT NOT NULL

        )
''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('drop table $favoritesTableName');
    await db.execute('drop table $cartsTableName');

    await _onCreate(db, newVersion);
  }

  addProductToFavorites(Product product, String userId) async {
    Database clint = await db;
    await clint.insert(favoritesTableName, {
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'image': product.mainImage,
      'category': product.category,
      'rate': product.rating,
      'reviews': product.reviews!.length,
      'userId': userId
    });
  }

  Future<List<FavProductModel>?> getFavoriteProducts(String userId) async {
    Database clint = await db;
    List<Map> favoriteProducts = await clint.query(favoritesTableName,
        columns: [
          "id",
          "title",
          'price',
          "image",
          'category',
          'rate',
          'reviews',
          'userId'
        ]);
    List<FavProductModel> productsForCurrentUser = [];
    if (favoriteProducts.isNotEmpty) {
      for (int i = 0; i < favoriteProducts.length; i++) {
        if (favoriteProducts[i]['userId'] == userId) {
          FavProductModel s = FavProductModel(
            id: favoriteProducts[i]['id'],
            title: favoriteProducts[i]['title'],
            price: favoriteProducts[i]['price'],
            image: favoriteProducts[i]['image'],
            category: favoriteProducts[i]['category'],
            rating: favoriteProducts[i]['rate'],
            numOfReviews: favoriteProducts[i]['reviews'],
          );
          productsForCurrentUser.add(s);
        }
      }
      return productsForCurrentUser;
    }
    return null;
  }

  Future<bool> isFavoriteProduct(String productTitle, String userId) async {
    Database clint = await db;

    String sql =
        'SELECT 1 FROM $favoritesTableName WHERE title = ? AND userId = ?';
    final List<dynamic> whereArgs = [productTitle, userId];

    final results = await clint.rawQuery(sql, whereArgs);

    return results.isNotEmpty;
  }

  Future<int> deleteFromFavorites(String title) async {
    Database clint = await db;
    Future<int> numOfRecord =
        clint.delete(favoritesTableName, where: "title=?", whereArgs: [title]);
    return numOfRecord;
  }

  addProductToCart(CartModel cart) async {
    Database clint = await db;
    await clint.insert(cartsTableName, {
      'title': cart.title,
      'price': cart.price,
      'image_url': cart.image,
      'user_id': cart.userId,
      'quantity': cart.quantity,
      'product_id': cart.productId,
    });
  }

  Future<List<CartModel>?> getItemsFromCart(String userId) async {
    Database clint = await db;
    List<Map> cart = await clint.query(cartsTableName, columns: [
      "title",
      "price",
      'image_url',
      "user_id",
      'quantity',
      'product_id'
    ]);
    List<CartModel> cartForCurrentUser = [];
    if (cart.isNotEmpty) {
      for (int i = 0; i < cart.length; i++) {
        if (cart[i]['user_id'] == userId) {
          CartModel model = CartModel(
            title: cart[i]['title'],
            price: cart[i]['price'],
            image: cart[i]['image_url'],
            productId: cart[i]['product_id'],
            quantity: cart[i]['quantity'],
            userId: cart[i]['user_id'],
          );
          cartForCurrentUser.add(model);
        }
      }
      return cartForCurrentUser;
    }
    return null;
  }

  Future<int> deleteFromCart(String title) async {
    Database clint = await db;
    Future<int> numOfRecord =
        clint.delete(cartsTableName, where: "title=?", whereArgs: [title]);
    return numOfRecord;
  }

  // Future<int> updateCart(CartModel cart,int newQuantity) async {
  //   Database clint = await db;
  //   int record =await  clint.update(
  //       cartsTableName,
  //       {
  //         'quantity': newQuantity,
  //       },
  //       where: "title=? AND user_id=?",
  //       whereArgs: [cart.title, cart.userId]);
  //   return record;
  // }


 Future<bool> isCartItem(String productTitle, String userId) async {
    Database clint = await db;

    String sql =
        'SELECT 1 FROM $cartsTableName WHERE title = ? AND user_id = ?';
    final List<dynamic> whereArgs = [productTitle, userId];

    final results = await clint.rawQuery(sql, whereArgs);

    return results.isNotEmpty;
  }

}
