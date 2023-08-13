import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../repositories/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

@singleton
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepo;

  CartBloc({required this.cartRepo}) : super(CartLoadingState()) {
    on<FetchCartItemEvent>((event, state) async {
      emit(CartLoadingState());
      try {
        var cartItems = await cartRepo.getCartItems();
        emit(CartLoadedState(cartData: cartItems));
      } catch (e) {
        emit(CartErrorState(error: e.toString()));
      }
    });

    on<AddCartItemEvent>((event, state) async {
      try {
        var rs = await cartRepo.addProductToCart(
            quantity: event.quantity, productId: event.productId);
        if (rs) {
          emit(AddedCartItemState());
        } else {
          emit(AddCartItemErrorState(error: 'Can not add to Cart'));
        }
      } catch (e) {
        emit(AddCartItemErrorState(error: 'Can not add to Cart'));
      }
    });

    on<UpdateQuantityEvent>((event, state) async {
      await cartRepo.updateProductQuantity(
          quantity: event.quantity,
          productId: event.productId,
          isIncrease: event.isIncrease);
    });
  }
}
