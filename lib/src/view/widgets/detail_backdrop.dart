import 'package:flutter/material.dart';

class DetailBackdrop extends StatelessWidget {
  const DetailBackdrop({
    super.key, 
    required this.imageUrl, 
    required this.onBack, 
  });

  final String? imageUrl;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://image.tmdb.org/t/p/w500/";
    String emptyUrl = "https://img.freepik.com/free-photo/empty-minimal-room-interior-design-with-light-gray-wall_53876-128659.jpg";

    return Stack(
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
              fit: BoxFit.fitHeight,
            ),
          )
        ),
        SafeArea(
          child: GestureDetector(
            onTap: onBack,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF212121)
                  ),
                  child: Icon(Icons.arrow_back_ios_new_rounded)
                ),
              )
            ),
          )
        ),
      ],
    );
  }
}