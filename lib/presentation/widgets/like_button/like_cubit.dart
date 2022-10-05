import 'package:bloc/bloc.dart';
import 'package:musify_mobile/presentation/widgets/like_button/like_state.dart';

class LikeButtonCubit extends Cubit<LikeButtonState> {
  LikeButtonCubit() : super(LikeButtonState.initial());

  void init(String id) {
    if (true) {
      emit(state.copyWith(isLiked: true));
    } else {
      emit(state.copyWith(isLiked: false));
    }
  }

  void like({
    required int id,
    required int userId,
  }) {
    if (state.isLiked) {
      emit(state.copyWith(isLiked: false));
    } else {
      emit(state.copyWith(isLiked: true));
    }
  }
}
