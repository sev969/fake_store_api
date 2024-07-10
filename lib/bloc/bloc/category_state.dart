part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategoryLoadedState extends CategoryState {
  CategoryLoadedState({required this.categories});

  final List<String> categories;
}

final class CategoryLoadErrorState extends CategoryState {
  CategoryLoadErrorState({required this.errorMessage});

  final String errorMessage;
}
