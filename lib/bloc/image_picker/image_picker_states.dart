import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerStates extends Equatable {
  final XFile? imageFile;

  const ImagePickerStates({this.imageFile});

  ImagePickerStates copyWith({XFile? imageFile}) {
    return ImagePickerStates(imageFile: imageFile ?? this.imageFile);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [imageFile];
}
