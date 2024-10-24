import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickImageFromGallery extends ImagePickerEvents {
  // final XFile? imageFile;
  //
  // PickImageFromGallery({required this.imageFile});
  //
  // @override
  // List<Object?> get props => [imageFile];
}

class TakeImageFromCamera extends ImagePickerEvents {
  // final XFile? imageFile;
  //
  // TakeImageFromCamera({required this.imageFile});
  //
  // @override
  // List<Object?> get props => [imageFile];
}
