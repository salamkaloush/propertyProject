import 'package:flutter/material.dart';

abstract class LocaleEvent {}

class ChangeLocaleEvent extends LocaleEvent {
  final Locale locale;
  ChangeLocaleEvent(this.locale);
}
