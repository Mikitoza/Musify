import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/delete_genre/delete_genre_cubit.dart';
import 'package:musify_mobile/presentation/pages/delete_genre/delete_genre_state.dart';
import 'package:musify_mobile/presentation/theme/theme_provider.dart';

class DeleteGenre extends StatefulWidget {
  const DeleteGenre({Key? key}) : super(key: key);

  @override
  State<DeleteGenre> createState() => _DeleteGenreState();
}

class _DeleteGenreState extends State<DeleteGenre> {
  final cubit = i.get<DeleteGenreCubit>();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteGenreCubit, DeleteGenreState>(
      bloc: cubit,
      builder: (context, state) {
        return state.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                body: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.025,
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: ListView.builder(
                          itemCount: state.genres.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.genres[index].name,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              onTap: () => cubit.setCurrent(index),
                            );
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => cubit.deleteAlbum(state.genres[state.currentGenre].id),
                      child: const Text("Удалить"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.07,
                        ),
                        textStyle: TextStyle(
                          color: ThemeProvider.of(context).theme.light,
                        ),
                        primary: ThemeProvider.of(context).theme.primaryAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
