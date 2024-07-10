part of 'load_goods_bloc.dart';

@immutable
sealed class LoadGoodsEvent {}

final class StartLoadGoodsEvent extends LoadGoodsEvent {
  final String goodsUrl;

  StartLoadGoodsEvent({required this.goodsUrl});
}

final class SendEmailEvent extends LoadGoodsEvent {
  final String email;
  final String toName;

  SendEmailEvent({required this.email, required this.toName});
}
