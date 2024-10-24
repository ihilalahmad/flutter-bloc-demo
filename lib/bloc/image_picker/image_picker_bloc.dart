import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/bloc/image_picker/image_picker_events.dart';
import 'package:flutter_bloc_demo/bloc/image_picker/image_picker_states.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<PickImageFromGallery>(_pickImageFromGallery);
    on<TakeImageFromCamera>(_takeImageFromCamera);
  }

  void _pickImageFromGallery(
      PickImageFromGallery event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.takeImageFromGallery();
    emit(state.copyWith(imageFile: file));
  }

  void _takeImageFromCamera(
      TakeImageFromCamera event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.takeImageFromCamera();
    emit(state.copyWith(imageFile: file));
  }
}
