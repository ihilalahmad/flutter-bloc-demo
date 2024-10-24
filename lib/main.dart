import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc/apis/get/posts_bloc.dart';
import 'package:flutter_bloc_demo/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/favorite_app/favorite_app_bloc.dart';
import 'package:flutter_bloc_demo/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_demo/bloc/slider/slider_bloc.dart';
import 'package:flutter_bloc_demo/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_demo/bloc/todo_list/todo_list_bloc.dart';
import 'package:flutter_bloc_demo/repository/favorite_repository.dart';
import 'package:flutter_bloc_demo/repository/post_repository.dart';
import 'package:flutter_bloc_demo/ui/apis/get_api_screen.dart';
import 'package:flutter_bloc_demo/ui/auth/login_screen.dart';
import 'package:flutter_bloc_demo/ui/counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/favorite_app_screen.dart';
import 'package:flutter_bloc_demo/ui/flutter_freezed/flutter_freezed.dart';
import 'package:flutter_bloc_demo/ui/image_picker.dart';
import 'package:flutter_bloc_demo/ui/list_screen.dart';
import 'package:flutter_bloc_demo/ui/switch_example.dart';
import 'package:flutter_bloc_demo/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [

          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
          BlocProvider(
            create: (context) => SliderBloc(),
          ),
          BlocProvider(
            create: (context) => ImagePickerBloc(ImagePickerUtils()),
          ),
          BlocProvider(
            create: (context) => TodoListBloc(),
          ),
          BlocProvider(
            create: (context) => FavoriteAppBloc(FavoriteRepository()),
          ),
          BlocProvider(
            create: (context) => PostsBloc(PostRepository()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const FlutterFreezed(),
        ));
  }
}
