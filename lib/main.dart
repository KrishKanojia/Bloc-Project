import 'package:demo_app/bloc/counter/counter_bloc.dart';
import 'package:demo_app/bloc/imagePicker/imagePicker_bloc.dart';
import 'package:demo_app/bloc/switch/switch_bloc.dart';
import 'package:demo_app/ui/counter/counter_screen.dart';
import 'package:demo_app/ui/imagePicker/imagePicker_screen.dart';
import 'package:demo_app/ui/switch/switch_screen.dart';
import 'package:demo_app/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
