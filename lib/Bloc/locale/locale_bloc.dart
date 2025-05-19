import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleState(const Locale('ar'))) {
    on<ChangeLocaleEvent>((event, emit) {
      emit(LocaleState(event.locale));
    });
  }
}
