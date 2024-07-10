import 'package:bloc/bloc.dart';
//import 'package:fake_store_api/models/goods_model.dart';
//import 'package:fake_store_api/models/goods_model.dart';
import 'package:fake_store_api/models/shopping_cart_model.dart';
import 'package:meta/meta.dart';

part 'shop_cart_event.dart';
part 'shop_cart_state.dart';

class ShopCartBloc extends Bloc<ShopCartEvent, ShopCartState> {
  ShopCartBloc(List<ShoppingCartModel> goods) : super(ShopCartInitial()) {
    on<AddGoodsToShopCartEvent>((event, emit) {
      if (goods.contains(event.addededGoods)) {
      } else {
        goods.add(event.addededGoods);
      }

      emit(ShopCartAddededState(goods: goods));
    });

    on<DeleteGoodsFromShopCartEvent>((event, emit) {
      goods.removeAt(event.index);
      emit(DeletedGoodsFromShopCartState(goods: goods));
    });

    on<IncQuantityGoodsInShopCartEvent>((event, emit) {
      goods[event.index].quantity = goods[event.index].quantity! + 1;
      emit(IncQuantityGoodsInShopCartState(goods: goods));
    });

    on<DecQuantityGoodsInShopCartEvent>((event, emit) {
      if (goods[event.index].quantity! > 1) {
        goods[event.index].quantity = goods[event.index].quantity! - 1;
      }
      emit(DecQuantityGoodsInShopCartState(goods: goods));
    });

    on<ClearGoodsInShopCartEvent>((event, emit) {
      goods.removeRange(0, goods.length);
      emit(ShopCartInitial());
    });

    on<PriceShopCartEvent>((event, emit) {
      double totalPrice = 0;
      for (int i = 0; i < goods.length; i++) {
        totalPrice = totalPrice + goods[i].price * goods[i].quantity!;
      }
      emit(PriceShopCartState(totalPrice: totalPrice, goods: goods));
    });
  }
}
