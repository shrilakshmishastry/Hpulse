import 'package:flutter/material.dart';
import 'package:hpulse/Redux/model/h_news.dart';

@immutable
class HNewsState {
  final bool isAskLoading;
  final bool isNewLoading;
  final bool isTopLoading;
  final bool isShowLoading;
  final bool isAskError;
  final bool isNewError;
  final bool isTopError;
  final bool isShowError;
  final List<HNews> ask;
  final List<HNews> newStories;
  final List<HNews> showStories;
  final List<HNews> topStories;

  HNewsState({
    this.isAskError = false,
    this.isTopError = false,
    this.isNewError = false,
    this.isShowError = false,
    this.ask = const [],
    this.newStories = const [],
    this.isAskLoading = false,
    this.isNewLoading = false,
    this.isTopLoading = false,
    this.isShowLoading = false,
    this.showStories = const [],
    this.topStories = const [],
  });

  factory HNewsState.initial() => HNewsState(
    isAskError : false,
    isTopError : false,
    isNewError : false,
    isShowError : false,
    ask : [],
    newStories : [],
    isAskLoading : false,
    isNewLoading : false,
    isTopLoading : false,
    isShowLoading : false,
    showStories : [],
    topStories :  [],
  );

  HNewsState copyWith({
    @required bool isAskLoading,
    @required bool isNewLoading,
    @required bool isTopLoading,
    @required bool isShowLoading,
    @required bool isAskError,
    @required bool isShowError,
    @required bool isTopError,
    @required bool isNewError,
    @required List<HNews> ask,
    @required List<HNews> newStories,
    @required List<HNews> showStories,
    @required List<HNews> topStories,
  }) {
    return HNewsState(
      isAskLoading: isAskLoading ?? this.isAskLoading,
      isAskError: isAskError ?? this.isAskError,
      isNewLoading: isNewLoading ?? this.isNewLoading,
      isNewError: isNewError ?? this.isNewError,
      isShowError: isShowError ?? this.isShowError,
      isShowLoading: isShowLoading ?? this.isShowLoading,
      isTopError: isTopError ?? this.isTopError,
      isTopLoading: isTopLoading ?? this.isTopLoading,
      ask: ask ?? this.ask,
      newStories: newStories ?? this.newStories,
      showStories: showStories ?? this.showStories,
      topStories: topStories ?? this.topStories,
    );
  }
}
