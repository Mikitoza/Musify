import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/data/models/genre.dart';
import 'package:musify_mobile/data/repositories/genre_repository.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/add_genre/add_genre_state.dart';

class AddGenreCubit extends Cubit<AddGenreState> {
  final GenreRepostiory _genreRepostiory;
  final appRouter = i.get<AppRouter>();

  AddGenreCubit(this._genreRepostiory) : super(AddGenreState());

  void addAlbum(Genre genre) async {
    final response = await _genreRepostiory.createGenre(genre);
    if(response.isSuccess) appRouter.replaceNamed(homePath);
  }
}
