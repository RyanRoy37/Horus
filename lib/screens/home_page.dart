import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _videoController;

  final List<String> carouselImages = [
    'assets/images/bird1.jpg',
    'assets/images/bird2.png',
    'assets/images/bird3.jpg',
    'assets/images/bird4.jpg',
  ];

  final List<Map<String, String>> birdsOfTheDay = [
    {
      "name": "Indian Roller",
      "image": "assets/images/bird_of_day1.jpeg",
      "fact": "Known for its vibrant blue wings, often seen perched along roadsides."
    },
    {
      "name": "House Sparrow",
      "image": "assets/images/bird_of_day2.jpg",
      "fact": "A friendly urban dweller that thrives near human settlements."
    },
    {
      "name": "Peacock",
      "image": "assets/images/bird_of_day3.jpeg",
      "fact": "India’s national bird, famous for its colorful courtship display."
    },
    {
      "name": "Kingfisher",
      "image": "assets/images/bird_of_day4.jpeg",
      "fact": "Expert fish hunter with vibrant blue and orange plumage."
    },
  ];

  late Map<String, String> currentBirdOfTheDay;

  @override
  void initState() {
    super.initState();
    currentBirdOfTheDay = _getRandomBird();

    _videoController = VideoPlayerController.asset('assets/video/birds_bg.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController
          ..play()
          ..setLooping(true)
          ..setVolume(0);
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  Map<String, String> _getRandomBird() {
    final random = Random();
    return birdsOfTheDay[random.nextInt(birdsOfTheDay.length)];
  }

  TextStyle _overlayTextStyle({double size = 14, bool bold = false}) {
    return TextStyle(
      fontSize: size,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      color: Colors.white,
      shadows: const [
        Shadow(
          offset: Offset(1, 1),
          blurRadius: 3,
          color: Colors.black54,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background Video
        if (_videoController.value.isInitialized)
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoController.value.size.width,
                height: _videoController.value.size.height,
                child: VideoPlayer(_videoController),
              ),
            ),
          ),

        /// Foreground Content
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 50), // placeholder for left alignment
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/icons/fore.png', height: 50),
                          const SizedBox(width: 10),
                          FadeInDown(
                            child: Text(
                              'Horus',
                              style: _overlayTextStyle(size: 28, bold: true),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50), // placeholder for right alignment
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                /// Carousel
                FadeIn(
                  duration: const Duration(milliseconds: 800),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                    ),
                    items: carouselImages.map((imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 30),

                /// Bird of the Day
                FadeInUp(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.6),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("🌟 Bird of the Day", style: _overlayTextStyle(size: 20, bold: true)),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            currentBirdOfTheDay["image"]!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(currentBirdOfTheDay["name"]!, style: _overlayTextStyle(size: 18, bold: true)),
                        const SizedBox(height: 5),
                        Text(currentBirdOfTheDay["fact"]!, style: _overlayTextStyle(size: 14)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Quick Tips (placeholder)
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.6),
                        width: 1,
                      ),
                    ),
                    child: const SizedBox.shrink(),
                  ),
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
