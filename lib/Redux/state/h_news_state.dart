import 'package:flutter/material.dart';
import 'package:hpulse/Redux/model/h_news.dart';

@immutable
class HNewsState{
  final bool isLoading;
  final bool isError;
  final List<HNews> ask;
  final List<HNews> newStories;
  final List<HNews> showStories;
  final List<HNews> topStories;
  HNewsState({
    this.isLoading = false,
    this.ask = const [],
    this.newStories = const [],
    this.isError = false,
    this.showStories = const [],
    this.topStories = const [],
});
HNewsState copyWith({
 @required  bool isLoading,
 @required bool isError,
 @required List<HNews> ask,
 @required List<HNews> newStories,
 @required List<HNews> showStories,
 @required List<HNews> topStories,
}){
  return HNewsState(
    isLoading: isLoading ?? this.isError,
    isError: isError ?? this.isError,
    ask: ask ?? this.ask,
    newStories: newStories ?? this.newStories,
    showStories: showStories ?? this.showStories,
    topStories: topStories ?? this.topStories,
  );
}

}
