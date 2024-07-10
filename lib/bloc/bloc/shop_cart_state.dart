part of 'shop_cart_bloc.dart';

@immutable
sealed class ShopCartState {}

final class ShopCartInitial extends ShopCartState {
  final List<ShoppingCartModel> goods = [];
}

final class ShopCartAddededState extends ShopCartState {
  final List<ShoppingCartModel> goods;

  ShopCartAddededState({required this.goods});
}

final class DeletedGoodsFromShopCartState extends ShopCartState {
  final List<ShoppingCartModel> goods;

  DeletedGoodsFromShopCartState({required this.goods});
}

final class IncQuantityGoodsInShopCartState extends ShopCartState {
  final List<ShoppingCartModel> goods;

  IncQuantityGoodsInShopCartState({required this.goods});
}

final class DecQuantityGoodsInShopCartState extends ShopCartState {
  final List<ShoppingCartModel> goods;

  DecQuantityGoodsInShopCartState({required this.goods});
}

final class PriceShopCartState extends ShopCartState {
  final double totalPrice;
  final List<ShoppingCartModel> goods;

  PriceShopCartState({required this.goods, required this.totalPrice});
}
