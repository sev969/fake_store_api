import 'package:bloc/bloc.dart';
import 'package:fake_store_api/repositories/net_services.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories repository;
  CategoryBloc({required this.repository}) : super(CategoryInitial()) {
    on<ReadCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final List<String> categories = await repository.getCategories();
        emit(CategoryLoadedState(categories: categories));
        //return categories;
      } catch (e) {
        emit(CategoryLoadErrorState(errorMessage: e.toString()));
      }
    });
  }
}
