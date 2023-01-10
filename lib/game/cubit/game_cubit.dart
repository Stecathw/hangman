import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/game/cubit/game_state.dart';
import 'package:hangman/repository/word_repository.dart';

class GameCubit extends Cubit<GameState> {
  final WordRepository _repository;
  GameCubit(this._repository) : super(InitGameState());

  Future<void> fecthWords() async {
    emit(LoadingGameState());
    try {
      final response = await _repository.getAll();
      emit(ResponseGameState(response));
    } catch (err) {
      emit(ErrorGameState(err.toString()));
    }
  }
}
