import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/cart/model/cart_data_model.dart';
import 'package:tashil_food_app/data/cart/model/cart_model.dart';
import 'package:tashil_food_app/data/cart/service/cart_hive_service.dart';
import 'package:tashil_food_app/data/order/model/order_model.dart';
import 'package:tashil_food_app/data/cart/service/cart_services.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';

class CartController extends GetxController {
  // var cartDataList = <CartData>[].obs;
  var cartDataList = <CartDataModel>[].obs;
  CartDataModel? orderAndCartData;
  var storage = SharedPref.instance;
  int count = 0;

  String cartListString = '';
  CartDataModel? cartDataHive;

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  @override
  void onInit() async {
    // storage.remove('cartDataList');
    // cartListString = storage.getString('cartDataList') ?? '';
    // if (cartListString != '') {
    //   final CartDataModel cartList = CartDataModel.decode(cartListString);
    //   orderAndCartData = cartList;
    //   // orderAndCartData.refresh();
    // } else {
    //   getDataOrderAndCart();
    // }
    cartDataHive = CartHiveService().getCartData();
    if (cartDataHive != null) {
      orderAndCartData = cartDataHive;
    } else {
      getDataOrderAndCart();
    }
    super.onInit();
  }

  printData() {
    final cartData = CartHiveService().getCartData();
    if (cartData != null) {
      print(cartData.orderId);
      print(cartData.cartData);
      // orderAndCartData = ;
    }
  }

  void getDataOrderAndCart() async {
    String id = storage.getString('id') ?? '';
    if (id != '') {
      final dataOrder = await CartServices().getOrderById(id, 1);
      if (dataOrder != null) {
        final dataCart =
            await CartServices().getCartData(dataOrder.id.toString());
        if (dataCart != null) {
          final total = cartTotalPriceAdd(dataCart);
          orderAndCartData = CartDataModel(
            orderId: dataOrder.id,
            priceOrder: total,
            cartData: dataCart,
          );
          CartHiveService().addCartData(dataUser: orderAndCartData!);
          update();
        }
      }
    }
  }

  void addProductToCart({
    required int quantity,
    required String mealId,
    required int price,
    required String name,
    required String image,
  }) async {
    startLoading();
    final totalPrice = quantity * price;
    String id = storage.getString('id') ?? '';
    final dataOrder = await CartServices().getOrderById(id, 1);

    if (dataOrder != null) {
      print('هناك طلبات في الكارد');
      if (dataOrder.status == 1) {
        print('أضافة الي طلب سابق ');
        addMealInCart(
            dataOrder: dataOrder,
            totalPrice: totalPrice,
            quantity: quantity,
            price: price,
            mealId: mealId,
            image: image,
            name: name);
        // addMealFromOrder(
        //   dataOrder: dataOrder,
        //   mealId: mealId,
        //   quantity: quantity,
        //   totalPrice: totalPrice,
        //   price: price,
        //   name: name,
        //   image: image,
        // );
      }
    } else {
      print('أضافة طلب جديد');
      addOrderAndMeal(
        id: id,
        mealId: mealId,
        quantity: quantity,
        totalPrice: totalPrice,
        price: price,
        name: name,
        image: image,
      );
      // orderAndCartData.refresh();
    }
    stopLoading();
  }

  void addMealInCart(
      {required int quantity,
      required String mealId,
      required num price,
      required num totalPrice,
      required String name,
      required String image,
      required OrderModel dataOrder}) {
    final orderAndMeal = CartHiveService().getCartData();
    if (orderAndMeal != null) {
      final index = orderAndMeal.cartData!
          .indexWhere((element) => element.mealId == mealId);
      if (index >= 0) {
        final dataCart = orderAndMeal.cartData![index];
        addToCart(
            index: index,
            orderId: orderAndMeal.orderId.toString(),
            cartData: dataCart,
            quantity: quantity);
      } else {
        addMealFromOrder(
          dataOrder: dataOrder,
          mealId: mealId,
          quantity: quantity,
          totalPrice: totalPrice,
          price: price,
          name: name,
          image: image,
        );
      }
    }
  }

  void addMealFromOrder(
      {required String mealId,
      required num quantity,
      required num price,
      required num totalPrice,
      required String name,
      required String image,
      required OrderModel dataOrder}) async {
    CartModel cartModel = CartModel()
      ..mealId = mealId
      ..quantity = quantity
      ..unitPrice = price
      ..totalPrice = totalPrice.toDouble()
      ..name = name
      ..image = image;
    final cart = await CartServices()
        .addToCart(cartModel: cartModel, id: dataOrder.id.toString());
    final dataCart = await CartServices().getCartData(dataOrder.id.toString());
    if (dataCart != null) {
      final total = cartTotalPriceAdd(dataCart);
      CartServices().updateOrderPrice(dataOrder.id.toString(), total);
      orderAndCartData = CartDataModel(
        orderId: dataOrder.id,
        priceOrder: total,
        cartData: dataCart,
      );
      CartHiveService().addCartData(dataUser: orderAndCartData!);
      update();
    }
    // final String encodedData = CartDataModel.encode(orderAndCartData!);
    // storage.setString('cartDataList', encodedData);
  }

  void addOrderAndMeal({
    required String mealId,
    required num quantity,
    required num price,
    required num totalPrice,
    required String name,
    required String image,
    required String id,
  }) async {
    OrderModel orderModel = OrderModel()
      ..userId = id
      ..createdDate = DateTime.now()
      ..deliverDate = DateTime.now()
      ..status = 1
      ..totalPrice = totalPrice.toDouble();

    final order = await CartServices().addToOrder(orderModel: orderModel);
    CartModel cartModel = CartModel()
      ..mealId = mealId
      ..quantity = quantity
      ..unitPrice = price
      ..totalPrice = totalPrice
      ..name = name
      ..image = image;
    await CartServices()
        .addToCart(cartModel: cartModel, id: order.id.toString());
    await CartServices().getMealById(mealId);
    final dataCart = await CartServices().getCartData(order.id.toString());
    if (dataCart != null) {
      final total = cartTotalPriceAdd(dataCart);
      orderAndCartData = CartDataModel(
        orderId: order.id,
        priceOrder: total,
        cartData: dataCart,
      );

      CartHiveService().addCartData(dataUser: orderAndCartData!);
      update();
    }
    // final String encodedData = CartDataModel.encode(orderAndCartData!);
    // storage.setString('cartDataList', encodedData);
  }

  void addToCart(
      {required String orderId,
      required CartModel cartData,
      required int quantity,
      required int index}) {
    int quantityUpdate = cartData.quantity!.toInt() + quantity;
    int newPrice = cartData.unitPrice!.toInt() * quantityUpdate;
    CartModel cartUpdate = CartModel(
      id: cartData.id,
      mealId: cartData.mealId,
      unitPrice: cartData.unitPrice,
      quantity: quantityUpdate,
      totalPrice: newPrice,
      image: cartData.image,
      name: cartData.name,
    );
    CartServices()
        .updateMealToCart(orderId, cartData.id.toString(), cartUpdate);
    orderAndCartData!.cartData![index] = cartUpdate;
    final total = cartTotalPriceAdd(orderAndCartData!.cartData!);
    CartServices().updateOrderPrice(orderId, total);
    orderAndCartData!.priceOrder = total;
    CartHiveService().addCartData(dataUser: orderAndCartData!);
    update();
  }

  void counterAddProductToCart(String orderId, CartModel cartData) {
    int quantityUpdate = cartData.quantity!.toInt() + 1;
    int newPrice = cartData.unitPrice!.toInt() * quantityUpdate;
    print(orderId);
    print(cartData.id);
    CartModel cartUpdate = CartModel(
      id: cartData.id,
      mealId: cartData.mealId,
      unitPrice: cartData.unitPrice,
      quantity: quantityUpdate,
      totalPrice: newPrice,
      image: cartData.image,
      name: cartData.name,
    );
    CartServices()
        .updateMealToCart(orderId, cartData.id.toString(), cartUpdate);
    // final index = orderAndCartData.value.cartData?.indexOf(cartData);
    orderAndCartData!.cartData![orderAndCartData!.cartData!
        .indexWhere((element) => element.id == cartData.id)] = cartUpdate;
    final total = cartTotalPriceAdd(orderAndCartData!.cartData!);
    CartServices().updateOrderPrice(orderId, total);
    orderAndCartData!.priceOrder = total;
    CartHiveService().addCartData(dataUser: orderAndCartData!);
    // final String encodedData = CartDataModel.encode(orderAndCartData!);
    // storage.setString('cartDataList', encodedData);
    // orderAndCartData.refresh();
    update();
  }

  void counterRemoveMealToCart(String orderId, CartModel cartData) {
    int quantityUpdate = cartData.quantity!.toInt() + -1;
    if (quantityUpdate > 0) {
      int newPrice = cartData.unitPrice!.toInt() * quantityUpdate;

      CartModel cartUpdate = CartModel(
        id: cartData.id,
        mealId: cartData.mealId,
        unitPrice: cartData.unitPrice,
        quantity: quantityUpdate,
        totalPrice: newPrice,
        image: cartData.image,
        name: cartData.name,
      );
      CartServices()
          .updateMealToCart(orderId, cartUpdate.id.toString(), cartUpdate);
      orderAndCartData!.cartData![orderAndCartData!.cartData!
          .indexWhere((element) => element.id == cartData.id)] = cartUpdate;
      final total = cartTotalPriceAdd(orderAndCartData!.cartData!);
      orderAndCartData!.priceOrder = total;
      CartServices().updateOrderPrice(orderId, total);
      CartHiveService().addCartData(dataUser: orderAndCartData!);
      update();
    } else {
      getSnackbar(title: 'تحذير', supTitle: 'لا يمكن أن تكون الكمية أقل من 1');
    }
  }

  /// TODO
  double cartTotalPrice() {
    double total = 0;
    cartDataList.forEach((item) {
      // num price = item.unitPrice!;
      // total += item.quantity! * price;
      num price = item.priceOrder!;
      total += item.priceOrder! * price;
    });
    return total;
  }

  double cartTotalPriceAdd(List<CartModel> cart) {
    double total = 0;
    cart.forEach((item) {
      num price = item.unitPrice!;
      total += item.quantity! * price;
    });
    return total;
  }

  void checkOutCart({required List<CartDataModel> cartData}) async {
    // await CartServices().checkOutCart(cartData: cartData);
  }

  void deleteFromCart({required String idOrder, required String cartID}) async {
    CartServices().deleteItemInCart(idOrder, cartID);
    final index = orderAndCartData!.cartData
        ?.indexWhere((element) => element.id == cartID) as int;
    orderAndCartData!.cartData?.removeAt(index);
    // cartDataList
    //     .removeAt(cartDataList.indexWhere((element) => element. == idOrder));
    final total = cartTotalPriceAdd(orderAndCartData!.cartData!);
    CartServices().updateOrderPrice(idOrder, total);
    orderAndCartData!.priceOrder = total;
    if (total == 0.0) {
      // print('0000000000000');
    }
    if (orderAndCartData!.cartData!.isEmpty) {
      print(orderAndCartData!.cartData);
      print('object');
    }
    CartHiveService().addCartData(dataUser: orderAndCartData!);
    // final String encodedData = CartDataModel.encode(orderAndCartData!);
    // storage.setString('cartDataList', encodedData);
    // print('de Done');
    // orderAndCartData.refresh();
    update();
  }

  void deleteFromOrder({required String idOrder}) async {
    CartServices().deleteOrder(idOrder);
    // storage.remove('cartDataList');
    CartHiveService().deleteAll();
    orderAndCartData!.cartData!.clear();
    orderAndCartData = CartDataModel();
    CartHiveService().deleteCartData();
    // orderAndCartData.refresh();
    update();
  }
}
//   double totalPriceSum(int order_id) {
//   return ItemsPrice.where((item) => item.todoListId == todoListId)
//                    .fold(0.0, (sum, item) => sum + item['price']);
// }

// var productsMap = {}.obs;

// @override
// void onInit() {
//   super.onInit();
// }

// void addProductToCart(HomeProdectData productModels) {
//   if (productsMap.containsKey(productModels)) {
//     productsMap[productModels] += 1;

//     print(productsMap[productModels]);
//   } else {
//     productsMap[productModels] = 1;
//     print(productsMap[productModels]);
//   }
// }

// void addProductToCartCounter(HomeProdectData productModels, int counter) {
//   if (productsMap.containsKey(productModels)) {
//     productsMap[productModels] += counter;

//     print(productsMap[productModels]);
//   } else {
//     productsMap[productModels] = counter;

//     print(productsMap[productModels]);
//   }
// }

// void removeProductsFarmCart(HomeProdectData productModels) {
//   if (productsMap.containsKey(productModels) &&
//       productsMap[productModels] == 1) {
//     productsMap.removeWhere((key, value) => key == productModels);
//   } else {
//     productsMap[productModels] -= 1;
//   }
// }

// void removeOneProduct(HomeProdectData productModels) {
//   productsMap.removeWhere((key, value) => key == productModels);
// }

// get productSubTotal =>
//     productsMap.entries.map((e) => e.key.price * e.value).toList();

// get total => productsMap.entries
//     .map((e) => e.key.price * e.value)
//     .toList()
//     .reduce((value, element) => value + element)
//     .toStringAsFixed(2);

// int quantity() {
//   if (productsMap.isEmpty) {
//     return 0;
//   } else {
//     return productsMap.entries
//         .map((e) => e.value)
//         .toList()
//         .reduce((value, element) => value + element);
//   }
// }
