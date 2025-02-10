import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interactive_video_grid/splash_screen.dart';
import 'package:flutter_interactive_video_grid/video_cubit.dart';
import 'package:flutter_interactive_video_grid/video_grid_item.dart';
import 'package:flutter_interactive_video_grid/video_item_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}

class VideoGridPage extends StatelessWidget {
  final List<VideoItemModel> videoItems = List.generate(
    10,
    (index) => VideoItemModel(
      url: videoUrls[index % videoUrls.length],
      title: 'Demo Video $index',
      description: 'This is a interactive video of animal $index.',
    ),
  );

  static const List<String> videoUrls = [
    'https://www.sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4',
  ];

  VideoGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Flutter Interactive Video Grid'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.orangeAccent.shade100,),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 280, // Consistent height for grid items
          ),
          itemCount: videoItems.length,
          itemBuilder: (context, index) {
            return VideoGridItem(index: index, videoItem: videoItems[index]);
          },
        ),
      ),
    );
  }
}
