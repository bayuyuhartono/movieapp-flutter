import 'package:flutter/material.dart';
import 'package:movie_addict/src/model/popular_model.dart';
import 'package:movie_addict/src/view/widgets/potrait_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key, 
    required this.title, 
    this.movieLists, 
    required this.onTap
  });

  final String title;
  final List<Results>? movieLists;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.amber
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movieLists?.map((item) {
              return PotraitCard(
                imageUrl: item.posterPath, 
                title: item.title,
                movieId: item.id.toString(),
                onTap: onTap, 
              );
            }).toList() ?? [],
          ),
        ),
      ],
    );
  }
}