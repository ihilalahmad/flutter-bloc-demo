
import 'package:flutter_bloc_demo/model/favorite_item_model.dart';

class FavoriteRepository {

  Future<List<FavoriteItemModel>> fetchItems() async {
    print('fetch items');
    await Future.delayed(const Duration(seconds: 2));
    return List.of(_generateList(10));
  }

  List<FavoriteItemModel> _generateList(int length){
    return List.generate(length, (index) => FavoriteItemModel(id: index.toString(), value: 'Breaking News $index'));
  }
}