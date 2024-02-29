import 'dart:io';

import 'package:demo_app/bloc/imagePicker/imagePicker_bloc.dart';
import 'package:demo_app/bloc/imagePicker/imagePicker_event.dart';
import 'package:demo_app/bloc/imagePicker/imagePicker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Bloc"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return state.file == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => context
                            .read<ImagePickerBloc>()
                            .add(CameraCapture()),
                        child: const CircleAvatar(
                          child: Icon(Icons.camera),
                        ),
                      ),
                      const SizedBox(width: 50),
                      InkWell(
                        onTap: () => context
                            .read<ImagePickerBloc>()
                            .add(GalleryImagePicker()),
                        child: const CircleAvatar(
                          child: Icon(Icons.browse_gallery_sharp),
                        ),
                      ),
                    ],
                  )
                : Image.file(
                    File(state.file!.path.toString()),
                  );
          },
        ),
      ),
    );
  }
}
