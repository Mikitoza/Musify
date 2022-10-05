import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/data/models/genre.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/add_album/add_album_cubit.dart';
import 'package:musify_mobile/presentation/pages/add_genre/add_genre_cubit.dart';
import 'package:musify_mobile/presentation/pages/add_genre/add_genre_state.dart';
import 'package:musify_mobile/presentation/theme/theme_provider.dart';

class AddGenrePage extends StatefulWidget {
  const AddGenrePage({Key? key}) : super(key: key);

  @override
  State<AddGenrePage> createState() => _AddGenrePageState();
}

class _AddGenrePageState extends State<AddGenrePage> {
  final cubit = i.get<AddGenreCubit>();
  final _genreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddGenreCubit, AddGenreState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeProvider.of(context).theme.secondaryAction,
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(0.0, -0.9),
                  image: AssetImage(
                    'assets/images/bg.png',
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25,
                      right: MediaQuery.of(context).size.width * 0.25,
                      top: MediaQuery.of(context).size.width * 0.4,
                      bottom: MediaQuery.of(context).size.width * 0.15,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: TextField(
                      controller: _genreController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                          color: ThemeProvider.of(context).theme.light,
                        ),
                        hintText: "Жанр",
                        fillColor: ThemeProvider.of(context).theme.light.withOpacity(0.5),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => cubit.addAlbum(
                      Genre(
                        id: 0,
                        name: _genreController.text,
                      ),
                    ),
                    child: const Text("Создать"),
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
            ),
          ),
        );
      },
    );
  }
}
