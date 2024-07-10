import 'package:bloc/bloc.dart';
import 'package:fake_store_api/models/goods_model.dart';
import 'package:fake_store_api/repositories/net_services.dart';
import 'package:meta/meta.dart';

part 'load_goods_event.dart';
part 'load_goods_state.dart';

class LoadGoodsBloc extends Bloc<LoadGoodsEvent, LoadGoodsState> {
  final GetCategories repository;
  LoadGoodsBloc({required this.repository}) : super(LoadGoodsInitial()) {
    on<StartLoadGoodsEvent>((event, emit) async {
      emit(LoadGoodsStartedState());
      try {
        List<GoodsModel> goodsList =
            await repository.getSubCategories(event.goodsUrl);
        emit(LoadGoodsCompliteState(goodsList: goodsList));
      } catch (e) {
        emit(LoadGoodsErrorState(errorMessage: e.toString()));
      }
    });

    on<SendEmailEvent>((event, emit) async {
      emit(SendingEmailState());
      try {
        await repository.sendEmail(
          toName: event.toName,
          email: event.email,
        );
        emit(SendedEmailState());
      } catch (e) {
        emit(
          SendingEmailErrorState(errorMessage: e.toString()),
        );
      }
    });
  }
}
