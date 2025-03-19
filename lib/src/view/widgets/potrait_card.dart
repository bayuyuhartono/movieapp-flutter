import 'package:flutter/material.dart';

class PotraitCard extends StatelessWidget {
  const PotraitCard({
    super.key, 
    required this.imageUrl,
    required this.title,
    required this.movieId,
    required this.onTap
  });

  final String? imageUrl;
  final String? title;
  final String movieId;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://image.tmdb.org/t/p/w500/";
    String emptyUrl = "https://img.freepik.com/free-photo/empty-minimal-room-interior-design-with-light-gray-wall_53876-128659.jpg";

    return GestureDetector(
      onTap: () => onTap(movieId),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: 150,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl != null ? baseUrl+imageUrl! : emptyUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title ?? "",
                style: const TextStyle(
                  color: Colors.white, 
                  fontSize: 14
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}