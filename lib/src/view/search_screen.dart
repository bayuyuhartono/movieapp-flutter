import 'package:flutter/material.dart';
import 'package:movie_addict/src/data/response/api_status.dart';
import 'package:movie_addict/src/view/widgets/potrait_card.dart';
import 'package:movie_addict/src/view/widgets/search_field.dart';
import 'package:movie_addict/src/viewmodel/search_vm.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchVM viewModel = SearchVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SearchVM>(
        create: (BuildContext context) => viewModel,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                SearchField(onChange: (value) => viewModel.onSearch(value)),
                const SizedBox(height: 10), // Jeda agar tidak mepet
                Expanded(
                  child: Consumer<SearchVM>(
                    builder: (context, viewModel, _) {
                      if (viewModel.searchData.status == ApiStatus.loading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (viewModel.searchData.status == ApiStatus.completed &&
                          viewModel.searchData.data?.results != null &&
                          viewModel.searchData.data!.results!.isNotEmpty) {
                        return GridView.builder(
                          padding: const EdgeInsets.only(bottom: 20), // Hindari overflow bawah
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: viewModel.searchData.data!.results!.length,
                          itemBuilder: (context, index) {
                            final searchData = viewModel.searchData.data!.results![index];
                            return PotraitCard(
                              imageUrl: searchData.posterPath, 
                              title: searchData.title, 
                              movieId: searchData.id.toString(), 
                              onTap: (movieId) => viewModel.onMovieTap(context, movieId)
                            );
                          },
                        );
                      } else if (viewModel.searchData.status == ApiStatus.error) {
                        return const Center(child: Text("Failed to load data"));
                      }else if (viewModel.searchData.status == ApiStatus.error) {
                        return const Center(child: Text("No results found"));
                      }
                      return const Center(child: Text("Input search text"));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
