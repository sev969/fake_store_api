part of 'load_goods_bloc.dart';

@immutable
sealed class LoadGoodsState {}

final class LoadGoodsInitial extends LoadGoodsState {}

final class LoadGoodsStartedState extends LoadGoodsState {}

final class LoadGoodsCompliteState extends LoadGoodsState {
  final List<GoodsModel> goodsList;

  LoadGoodsCompliteState({required this.goodsList});
}

final class LoadGoodsErrorState extends LoadGoodsState {
  final String errorMessage;

  LoadGoodsErrorState({required this.errorMessage});
}

final class SendingEmailState extends LoadGoodsState {}

final class SendedEmailState extends LoadGoodsState {}

final class SendingEmailErrorState extends LoadGoodsState {
  final String errorMessage;

  SendingEmailErrorState({required this.errorMessage});
}
