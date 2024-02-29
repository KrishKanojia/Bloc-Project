import 'package:bloc/bloc.dart';
import 'package:demo_app/bloc/imagePicker/imagePicker_event.dart';
import 'package:demo_app/bloc/imagePicker/imagePicker_state.dart';
import 'package:demo_app/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imageUtils;
  ImagePickerBloc(this.imageUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

  void _cameraCapture(
      ImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imageUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryImagePicker(
      ImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imageUtils.picKImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
