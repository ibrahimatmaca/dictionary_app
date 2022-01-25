import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/network_service.dart';
import '../../../util/constants/dictionary_constant.dart';
import '../view_extension/view_extension.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DictionaryCubit(
        NetworkService(Dio(DictionaryConstants.instance.baseOptions)),
      ),
      child: BlocBuilder<DictionaryCubit, DictionaryState>(
        builder: (context, state) {
          return scaffoldHomeWidget(context, state);
        },
      ),
    );
  }

  Scaffold scaffoldHomeWidget(BuildContext context, DictionaryState state) {
    return Scaffold(
      body: returnColumnBody(context, state),
    );
  }

  Widget returnColumnBody(BuildContext context, DictionaryState state) {
    if (state is DictionaryInitial) {
      return state.buildWidget(context);
    } else if (state is WordSearchingState) {
      return state.buildWidget();
    } else if (state is WordSearchedState) {
      return state.buildWidget(context);
    } else if (state is ErrorState) {
      return state.buildWidget(context);
    } else {
      return const SizedBox();
    }
  }
}
