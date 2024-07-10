part of 'shop_cart_bloc.dart';

@immutable
sealed class ShopCartEvent {}

final class AddGoodsToShopCartEvent extends ShopCartEvent {
  final ShoppingCartModel addededGoods;

  AddGoodsToShopCartEvent({required this.addededGoods});
}

final class DeleteGoodsFromShopCartEvent extends ShopCartEvent {
  final int index;

  DeleteGoodsFromShopCartEvent({required this.index});
}

final class IncQuantityGoodsInShopCartEvent extends ShopCartEvent {
  final int index;

  IncQuantityGoodsInShopCartEvent({required this.index});
}

final class DecQuantityGoodsInShopCartEvent extends ShopCartEvent {
  final int index;

  DecQuantityGoodsInShopCartEvent({required this.index});
}

final class ClearGoodsInShopCartEvent extends ShopCartEvent {}

final class PriceShopCartEvent extends ShopCartEvent {}
