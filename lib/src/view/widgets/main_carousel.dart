import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_addict/src/model/popular_model.dart';
import 'package:movie_addict/src/view/widgets/landscape_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({super.key, required this.movieLists, required this.onTap});

  final List<Results>? movieLists;
  final void Function(String) onTap;

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.movieLists == null || widget.movieLists!.isEmpty) {
      return const Center(child: Text("No movies available"));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 6),
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          items: widget.movieLists?.map((item) {
            return LandscapeCard(
              imageUrl: item.backdropPath,
              title: item.title,
              rate: item.voteAverage,
              movieId: item.id.toString(),
              onTap: widget.onTap,
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        AnimatedSmoothIndicator(    
          activeIndex: activeIndex,    
          count: widget.movieLists?.length ?? 0,    
          effect: ScrollingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
          ), 
        ),
      ],
    );
  }
}
