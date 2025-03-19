import 'package:flutter/material.dart';

class LandscapeCard extends StatelessWidget {
  const LandscapeCard({
    super.key, 
    required this.imageUrl, 
    this.title, 
    this.rate,
    required this.movieId, 
    required this.onTap
  });

  final String? imageUrl;
  final String? title;
  final double? rate;
  final String movieId;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://image.tmdb.org/t/p/w500/";
    String emptyUrl = "https://img.freepik.com/free-photo/empty-minimal-room-interior-design-with-light-gray-wall_53876-128659.jpg";

    return GestureDetector(
      onTap: () => onTap(movieId),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl != null ? baseUrl+imageUrl! : emptyUrl,
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 15,
              right: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (rate != null)
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        Text(
                          rate!.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.white, 
                            fontSize: 10
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ],
                    ),
                    if (title != null)
                    Text(
                      title!,
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 14
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}