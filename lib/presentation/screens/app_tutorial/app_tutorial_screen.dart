import 'package:flutter/material.dart';

class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(title: 'Busca la comida', caption: 'Lore ipsum', imageUrl: 'assets/1.png'),
  SlideInfo(title: 'Entrega rapida', caption: 'Magna laborum', imageUrl: 'assets/2.png'),
  SlideInfo(title: 'Disfruta la comida', caption: 'Nulla dolore', imageUrl: 'assets/3.png')
];


class AppTutorialScreen extends StatelessWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: slides.map((slideData) => _Slides (
          title: slideData.title,
          caption: slideData.caption,
          imageUrl: slideData.imageUrl))
          .toList()
        )
      );
  }
}

class _AppTutorialScreen extends StatefulWidget {
  const _AppTutorialScreen({super.key});

  @override
  State<_AppTutorialScreen> createState() => __AppTutorialScreenState();
}

class __AppTutorialScreenState extends State<_AppTutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Slides extends StatelessWidget{
  final String title;
  final String caption;
  final String imageUrl;

  const _Slides({super.key, required this.title, required this.caption, required this.imageUrl});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const  Scaffold();
  }


}