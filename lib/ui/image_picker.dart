

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_demo/bloc/image_picker/image_picker_events.dart';
import 'package:flutter_bloc_demo/bloc/image_picker/image_picker_states.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Image Picker'),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
        builder: (context, state) {
          if (state.imageFile == null) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<ImagePickerBloc>()
                          .add(TakeImageFromCamera());
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.camera),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<ImagePickerBloc>()
                          .add(PickImageFromGallery());
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.image),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Image.file(File(state.imageFile!.path.toString()));
          }
        },
      ),
    );
  }
}
