import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../../model/dictionary_model.dart';
import '../../../service/INetworkService.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final IDioNetworkService networkService;

  DictionaryCubit(this.networkService) : super(DictionaryInitial());

  final String language = 'en';
  final queryController = TextEditingController();

  Future<void> getWordSearched() async {
    emit(WordSearchingState()); // aramaya başlandı circularprogressindicator

    try {
      final dictionary = await networkService.getRequest(
        language,
        queryController.text.trim(),
      );

      if (dictionary == null) {
        emit(ErrorState("Null"));
      } else {
        emit(WordSearchedState(dictionary));
      }
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void tryAgain() {
    emit(DictionaryInitial());
  }
}

abstract class DictionaryState {}

class DictionaryInitial extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final Dictionary? word;

  WordSearchedState(this.word);
}

class ErrorState extends DictionaryState {
  final String message;

  ErrorState(this.message);
}
