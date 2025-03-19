import 'package:flutter/material.dart';
import 'package:movie_addict/src/utils/convert_munites.dart';
import 'package:movie_addict/src/model/movie_model.dart';
import 'package:movie_addict/src/view/widgets/category_card.dart';
import 'package:movie_addict/src/view/widgets/detail_backdrop.dart';
import 'package:movie_addict/src/viewmodel/detail_vm.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movieId});

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailVM(movieId),
      child: Scaffold(
        body: Consumer<DetailVM>(
          builder: (context, viewModel, child) {
            MovieModel? movieData = viewModel.movieData.data;

            return SingleChildScrollView(
              child: Column(
                children: [
                  DetailBackdrop(
                    imageUrl: movieData?.posterPath
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                SizedBox(width: 8),
                                Text(
                                  movieData?.voteAverage != null ? movieData!.voteAverage!.toStringAsFixed(2) : "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.amber
                                  ),
                                ),
                              ]
                            ),
                            Row(
                              children: [
                                Text(
                                  movieData?.releaseDate != null ? DateTime.parse(movieData?.releaseDate ?? '').year.toString() : "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  movieData?.runtime != null ? convertMinutes(movieData!.runtime ?? 0) : "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          movieData?.title ?? "",
                          style: const TextStyle(
                            color: Colors.white, 
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                          softWrap: false,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: movieData?.genres?.map((item) {
                            return CategoryTab(text: item.name);
                          }).toList() ?? [],
                        ),
                        SizedBox(height: 16),
                        Text(
                          movieData?.overview ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
