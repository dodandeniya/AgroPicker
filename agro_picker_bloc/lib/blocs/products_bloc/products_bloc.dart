import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:bloc/bloc.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepository();

  @override
  ProductState get initialState => ProductEmpty();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is StartGettingProduct) {
      yield* _mapStartGettingProductEventToState();
    }
    if (event is GetAllProducts) {
      yield* _mapGetAllProductsEventToState(event);
    }
  }

  Stream<ProductState> _mapStartGettingProductEventToState() async* {
    yield ProductLoading();

    productRepository.getAllProducts().listen((event) {
      add(GetAllProducts(event.documents));
    });
  }

  Stream<ProductState> _mapGetAllProductsEventToState(
      GetAllProducts event) async* {
    List<Products> products = [];
    var productList = event.docs.toList();

    if (productList != null || productList.isNotEmpty) {
      for (var item in productList) {
        products.add(Products.fromJson(item.data));
      }
      yield ProductLoaded(products);
    } else {
      yield ProductListEmpty();
    }
  }
}
