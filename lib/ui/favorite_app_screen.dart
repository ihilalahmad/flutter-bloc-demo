import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/favorite_app/favorite_app_bloc.dart';
import 'package:flutter_bloc_demo/bloc/favorite_app/favorite_app_event.dart';
import 'package:flutter_bloc_demo/bloc/favorite_app/favorite_app_state.dart';
import 'package:flutter_bloc_demo/model/favorite_item_model.dart';

class FavoriteAppScreen extends StatefulWidget {
  const FavoriteAppScreen({super.key});

  @override
  State<FavoriteAppScreen> createState() => _FavoriteAppScreenState();
}

class _FavoriteAppScreenState extends State<FavoriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoriteAppBloc>().add(FetchFavoriteList());
  }

  void _addItemToFavorite(FavoriteItemModel item) {
    item = FavoriteItemModel(
      id: item.id,
      value: item.value,
      isFavorite: item.isFavorite ? false : true,
    );
    context.read<FavoriteAppBloc>().add(AddItemToFavorite(item: item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Favorite App'),
        actions: [
          BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavoriteItems.isNotEmpty ? true : false,
                child: IconButton(
                  onPressed: () {
                    context.read<FavoriteAppBloc>().add(DeleteItem());
                  },
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                    size: 28,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favoriteItems.length,
                itemBuilder: (context, index) {
                  final item = state.favoriteItems[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                    child: Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: state.tempFavoriteItems.contains(item),
                          onChanged: (value) {
                            context.read<FavoriteAppBloc>().add(
                                  state.tempFavoriteItems.contains(item)
                                      ? UnSelectFavoriteItem(item: item)
                                      : SelectFavoriteItem(item: item),
                                );
                          },
                        ),
                        title: InkWell(
                            onTap: () {
                              context.read<FavoriteAppBloc>().add(
                                    state.tempFavoriteItems.contains(item)
                                        ? UnSelectFavoriteItem(item: item)
                                        : SelectFavoriteItem(item: item),
                                  );
                            },
                            child: Text(item.value.toString())),
                        trailing: IconButton(
                          onPressed: () {
                            _addItemToFavorite(item);
                          },
                          icon: Icon(
                            item.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            case ListStatus.failure:
              return const Center(
                child: Text('Something went wrong'),
              );
          }
        },
      ),
    );
  }
}
