import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../model/dictionary_model.dart';
import '../viewmodel/home_viewmodel.dart';

extension DictionaryInitialWidget on DictionaryInitial {
  Widget buildWidget(BuildContext context) {
    return returnBody(context);
  }

  Widget returnBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        titleText(context),
        subTitleText(context),
        SizedBox(height: context.veryLowRadius),
        Padding(
          padding: context.paddingSymmetricNormalHorizontal,
          child: searchBarWidget(context),
        ),
      ],
    );
  }

  Widget titleText(BuildContext context) {
    return LocaleText(
      string: LocaleKeys.main_appTitle,
      style: TextStyle(
        color: context.colors.primary,
        fontSize: context.ultraveryLowFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitleText(BuildContext context) {
    return LocaleText(
      string: LocaleKeys.initial_subTitle,
      style: TextStyle(
        color: context.colors.onSurface,
        fontSize: context.mediumveryLowFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  TextField searchBarWidget(BuildContext context) {
    return TextField(
      controller: context.watch<DictionaryCubit>().queryController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
            onPressed: () {
              BlocProvider.of<DictionaryCubit>(context).getWordSearched();
            },
            icon: const Icon(Icons.search)),
        hintText: LocaleKeys.initial_hintInput.locale.toString(),
      ),
    );
  }
}

extension WordSearchingStateWidget on WordSearchingState {
  Widget buildWidget() {
    return const Center(child: CircularProgressIndicator());
  }
}

extension WordSearchedStateWidget on WordSearchedState {
  Widget buildWidget(BuildContext context) {
    return Container(
      padding: context.paddingSymmetricMediumHorizontal,
      child: Column(
        children: <Widget>[
          SizedBox(height: context.heighRadius),
          Text(
            "${word!.word}",
            style: TextStyle(
              color: context.colors.onSurface,
              fontSize: context.ultraBigveryLowFontSize,
            ),
          ),
          SizedBox(height: context.veryLowRadius),
          Expanded(
            child: listViewSeeparated(),
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<DictionaryCubit>(context).tryAgain();
              },
              child: const Icon(Icons.arrow_back)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  ListView listViewSeeparated() {
    return ListView.separated(
      itemBuilder: (context, index) {
        final meaning = word!.meanings![index];
        final definations = meaning.definitions;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meaning.partOfSpeech!,
              style: TextStyle(color: context.colors.onSurface),
            ),
            SizedBox(height: context.lowRadius),
            definationSeparated(definations!)
          ],
        );
      },
      itemCount: word!.meanings!.length,
      separatorBuilder: (context, index) => SizedBox(
        height: context.lowRadius,
      ),
    );
  }

  ListView definationSeparated(List<Definitions> definations) {
    return ListView.separated(
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            LocaleKeys.detail_defination.locale +
                '${definations[index].definition}',
            style: TextStyle(
                color: context.colors.onSurface, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          definations[index].example != null
              ? Text(
                  LocaleKeys.detail_sentence.locale +
                      '${definations[index].example}',
                  style: TextStyle(color: context.colors.onSurface),
                )
              : const SizedBox(),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: context.lowRadius,
      ),
      itemCount: definations.length,
      shrinkWrap: true,
    );
  }
}

extension ErrorStateWidget on ErrorState {
  Widget buildWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(message)),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<DictionaryCubit>(context).tryAgain();
            },
            child: const LocaleText(string: LocaleKeys.tryAgain))
      ],
    );
  }
}
