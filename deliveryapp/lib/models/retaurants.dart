

// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:deliveryapp/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  //menu thuc an
  final List<Food> _menu = [
    //burger
    Food(name: "Burger",
     description: "là một loại thức ăn bao gồm bánh mì kẹp thịt xay (thường là thịt bò) ở giữa. Miếng thịt có thể được nướng, chiên, hun khói hay nướng trên lửa",
      imagePath: "lib/images/burgers/classic_burger.jpg", 
      price: 49000, 
      category: FoodCategory.burgers, 
      availableAddons: 
      [
        Addon(name: "Thịt xông khói ", price: 15000),
        Addon(name: "Miếng bò nhỏ", price: 20000),
        Addon(name: "phô mai", price: 5000),
      ],
      ),

    Food(name: "Burger Đen",
     description: "cuốn hút với sắc đen lạ mắt, vỏ bánh thơm nhẹ mùi bơ, ăn kèm cùng nhân thịt bò đậm vị, rau củ tươi mát, phô mai béo ngậy, cực kỳ bổ dưỡng.",
      imagePath: "lib/images/burgers/black_burger.jpg", 
      price: 59000, 
      category: FoodCategory.burgers, 
      availableAddons: 
      [
        Addon(name: "Thịt xông khói ", price: 15000),
        Addon(name: "Miếng bò nhỏ", price: 20000),
        Addon(name: "phô mai", price: 5000),
      ],
      ),

    Food(name: "Burger Phô Mai",
     description: "Là một chiếc burger được thêm một lớp dày phô mai",
      imagePath: "lib/images/burgers/cheese_burger.jpg", 
      price: 49000, 
      category: FoodCategory.burgers, 
      availableAddons: 
      [
        Addon(name: "Thịt xông khói ", price: 15000),
        Addon(name: "Miếng bò nhỏ", price: 20000),
        Addon(name: "phô mai", price: 5000),
      ],
      ),

    Food(name: "Burger Gà",
     description: "là một loại thức ăn bao gồm bánh mì kẹp thịt gà ở giữa. Miếng thịt có thể được nướng, chiên, hun khói hay nướng trên lửa",
      imagePath: "lib/images/burgers/chicken_burger.jpg", 
      price: 39000, 
      category: FoodCategory.burgers, 
      availableAddons: 
      [
        Addon(name: "Thịt xông khói ", price: 15000),
        Addon(name: "Miếng gà", price: 20000),
        Addon(name: "phô mai", price: 5000),
      ],
      ),

    Food(name: "Burger Lớn",
     description: "là một phiên bản nâng cấp so với burger với 2 lớp thịt được thêm vào phần nhân bánh.",
      imagePath: "lib/images/burgers/larger_burger.jpg", 
      price: 89000, 
      category: FoodCategory.burgers, 
      availableAddons: 
      [
        Addon(name: "Thịt xông khói ", price: 15000),
        Addon(name: "Miếng bò nhỏ", price: 20000),
        Addon(name: "phô mai", price: 5000),
      ],
      ),
    
    
    //salads
    Food(name: "Salad ",
     description: "Món salad có thể ăn kèm với sốt tùy thích, rắc thêm ít tiêu để món ăn thêm cay thơm. Ăn cùng ít bánh chiên hoặc bánh nướng sẽ có được bữa ăn đơn giản mà tròn vị.",
      imagePath: "lib/images/salads/salad.jpg", 
      price: 35000, 
      category: FoodCategory.salads, 
      availableAddons: 
      [
        Addon(name: "Thêm mayonnaise ", price: 0),
        Addon(name: "Thêm salad", price: 15000),
        
      ],
      ),

    Food(name: "Salad Rau Củ",
     description: "Món salad có thể ăn kèm với sốt tùy thích, rắc thêm ít tiêu để món ăn thêm cay thơm. Ăn cùng ít bánh chiên hoặc bánh nướng sẽ có được bữa ăn đơn giản mà tròn vị.",
      imagePath: "lib/images/salads/vegetable.jpg", 
      price: 25000, 
      category: FoodCategory.salads, 
      availableAddons: 
      [
        Addon(name: "Thêm mayonnaise ", price: 0),
        Addon(name: "Thêm rau củ", price: 10000),
        
      ],
      ),

    Food(name: "Salad Cà Chua Bi",
     description: "Món salad có thể ăn kèm với sốt tùy thích, rắc thêm ít tiêu để món ăn thêm cay thơm. Ăn cùng ít bánh chiên hoặc bánh nướng sẽ có được bữa ăn đơn giản mà tròn vị.",
      imagePath: "lib/images/salads/tomato-salad.jpg", 
      price: 25000, 
      category: FoodCategory.salads, 
      availableAddons: 
      [
        Addon(name: "Thêm mayonnaise ", price: 0),
        Addon(name: "Thêm cà chua", price: 5000),
        
      ],
      ),

    Food(name: "Salad Dâu",
     description: "Món salad có thể ăn kèm với sốt tùy thích, rắc thêm ít tiêu để món ăn thêm cay thơm. Ăn cùng ít bánh chiên hoặc bánh nướng sẽ có được bữa ăn đơn giản mà tròn vị.",
      imagePath: "lib/images/salads/strawberry-salad.jpg", 
      price: 45000, 
      category: FoodCategory.salads, 
      availableAddons: 
      [
        Addon(name: "Thêm mayonnaise ", price: 0),
        Addon(name: "Thêm dâu", price: 20000),
        
      ],
      ),

    
    //sides
    Food(name: "Bánh Mì",
     description: "Bánh mì là một loại baguette của Việt Nam với lớp vỏ ngoài giòn tan, ruột mềm, còn bên trong là phần nhân.",
      imagePath: "lib/images/sides/bread.jpg", 
      price: 5000, 
      category: FoodCategory.sides, 
      availableAddons: 
      [
        Addon(name: "Thêm trứng ", price: 10000),
        Addon(name: "Thêm Sữa", price: 5000),
        
      ],
      ),

    Food(name: "Cherry",
     description: "Quả cherry còn có tên gọi là quả anh đào. Thuộc loại cây thân gỗ, nhiều cành, sống lâu năm và có chiều cao lên đến 10m.",
      imagePath: "lib/images/sides/cherry.jpg", 
      price: 200000, 
      category: FoodCategory.sides, 
      availableAddons: 
      [
        Addon(name: "Thêm cherry ", price: 100000),
        
        
      ],
      ),

    Food(name: "Bánh Kem",
     description: "Đây là một loại bánh ngọt dạng tháp như bánh bông lan xốp và được phủ lên một lớp kem dày hoặc mỏng vừa để trang trí vừa để tăng thêm hương vị cho bánh.",
      imagePath: "lib/images/sides/cookie.jpg", 
      price: 40000, 
      category: FoodCategory.sides, 
      availableAddons: 
      [
        
        Addon(name: "Thêm sữa", price: 25000),
        Addon(name: "Thêm socola", price: 35000),
        Addon(name: "Trang trí theo yêu cầu", price: 0),
        
      ],
      ),

    Food(name: "Khoai Tây Chiên",
     description: "là khoai tây chiên giòn cắt thành sợi hoặc hình que. Khoai tây chiên được phục vụ nóng, mềm hoặc giòn được dùng kèm trong bữa trưa hay bữa tối hoặc riêng lẻ như một món ăn nhẹ và thường có mặt trên thực đơn của thực khách trong cửa hàng đồ ăn nhanh.",
      imagePath: "lib/images/sides/khoaitaychien.jpg", 
      price: 25000, 
      category: FoodCategory.sides, 
      availableAddons: 
      [
        Addon(name: "Thêm tương ớt", price: 0),
        
        
      ],
      ),

    Food(name: "Salad ",
     description: "Món salad có thể ăn kèm với sốt tùy thích, rắc thêm ít tiêu để món ăn thêm cay thơm. Ăn cùng ít bánh chiên hoặc bánh nướng sẽ có được bữa ăn đơn giản mà tròn vị.",
      imagePath: "lib/images/sides/salad-sides.jpg", 
      price: 25000, 
      category: FoodCategory.sides, 
      availableAddons: 
      [
        Addon(name: "Thêm mayonnaise ", price: 0),
        Addon(name: "Thêm salad", price: 15000),
        
      ],
      ),


    //desserts
    Food(name: "Bánh Flan",
     description: "Bánh flan hay gọi thẳng theo tiếng Việt là bánh lăng hay caramen là loại bánh được hấp chín từ các nguyên liệu chính là trứng và sữa, caramel. Đây là một loại bánh xuất xứ từ nền ẩm thực châu Âu tuy hiện nay đã phổ biến tại nhiều nơi trên thế giới.",
      imagePath: "lib/images/desserts/caramel.jpg", 
      price: 20000, 
      category: FoodCategory.desserts, 
      availableAddons: 
      [
        Addon(name: "Thêm caramel ", price: 5000),
        Addon(name: "Socola", price: 10000),
        Addon(name: "Trái cây", price: 5000),
      ],
      ),

    Food(name: "Bánh Kem",
     description: "Đây là một loại bánh ngọt dạng tháp như bánh bông lan xốp và được phủ lên một lớp kem dày hoặc mỏng vừa để trang trí vừa để tăng thêm hương vị cho bánh.",
      imagePath: "lib/images/desserts/cookie.jpg", 
      price: 400000, 
      category: FoodCategory.desserts, 
      availableAddons: 
      [
        Addon(name: "Thêm socola ", price: 10000),
        Addon(name: "Thêm sữa", price: 25000),
        Addon(name: "Thêm Cheese", price: 35000),
        Addon(name: "Trang trí theo yêu cầu", price: 0),
      ],
      ),

    Food(name: "Bánh Crepe",
     description: "Bánh kếp hay bánh crêpe là một loại bánh rất mỏng, dẹt, thường được làm từ bột mì, trứng, sữa và bơ. Bánh kếp có nguồn gốc từ vùng Bretagne ở tây bắc Pháp, sau lan rộng ra toàn nước Pháp, trở thành món ăn truyền thống và phổ biến ở Pháp, Bỉ, Thụy Sĩ, Canada và Brazil.",
      imagePath: "lib/images/desserts/creme.jpg", 
      price: 25000, 
      category: FoodCategory.desserts, 
      availableAddons: 
      [
        Addon(name: "Thêm caramel ", price: 5000),
        Addon(name: "Socola", price: 10000),
        Addon(name: "Trái cây", price: 5000),
      ],
      ),

    Food(name: "Strawberry Shortcake",
     description: "món Strawberry Shortcake cổ điển tập hợp sự ngon lành của chiếc bánh bông xốp, những quả dâu tây mọng nước và một ít kem đánh bông để tạo nên một món tráng miệng thể hiện sự tươi mát và đơn giản. ",
      imagePath: "lib/images/desserts/custard.jpg", 
      price: 75000, 
      category: FoodCategory.desserts, 
      availableAddons: 
      [
        Addon(name: "Thêm kem ", price: 10000),
        Addon(name: "Socola", price: 10000),
        Addon(name: "Trái cây", price: 25000),
      ],
      ),
    
    Food(name: "Bánh Donut",
     description: "Bánh vòng là một loại bánh ngọt rán hoặc nướng để ăn tráng miệng hay ăn vặt. Đây là loại bánh rất nổi tiếng và phổ biến ở nhiều nước phương Tây, có thể được mua trong cửa hàng hoặc tự làm ở nhà. Thường bánh có dạng hình vòng nhồi nhân bên trong hoặc không nhồi nhân bên trong",
      imagePath: "lib/images/desserts/donut.jpg", 
      price: 20000, 
      category: FoodCategory.desserts, 
      availableAddons: 
      [
        Addon(name: "Thêm caramel ", price: 5000),
        Addon(name: "Socola", price: 10000),
        Addon(name: "Cốm ", price: 5000),
      ],
      ),

    Food(name: "Tiramisu",
     description: "Tiramisu là một loại bánh ngọt tráng miệng vị cà phê của nước Ý, gồm các lớp bánh quy Savoiardi, nhúng cà phê xen kẽ với hỗn hợp trứng, đường, phô mai mascarpone đánh bông, thêm một ít bột cacao. Công thức bánh này được biến tấu thành nhiều món bánh và món tráng miệng khác nhau.",
      imagePath: "lib/images/desserts/tiramisu.jpg", 
      price: 50000, 
      category: FoodCategory.desserts, 
      availableAddons: 
      [
        Addon(name: "Thêm caramel ", price: 5000),
        Addon(name: "Socola", price: 10000),
        Addon(name: "Trái cây", price: 5000),
      ],
      ),
    
    
    //drinks
    Food(name: "Champagne",
     description: "Sâm panh, còn gọi là sâm banh, là một dạng vang nổ được sản xuất bằng cách tạo ra sự lên men thứ cấp trong chai chứa rượu vang để thực hiện sự cacbonat hóa. Nó được đặt tên theo khu vực Champagne của Pháp",
      imagePath: "lib/images/drinks/champagne.jpg", 
      price: 1890000, 
      category: FoodCategory.drinks, 
      availableAddons: 
      [
        Addon(name: "Ly ", price: 0),
        
      ],
      ),

    Food(name: "Coktail",
     description: "Cocktail là một thức uống hỗn hợp có cồn, là sự kết hợp của các loại rượu mạnh, hoặc một hoặc nhiều loại rượu mạnh trộn với các thành phần khác như nước ép trái cây, xi-rô có hương vị, hoặc kem lạnh",
      imagePath: "lib/images/drinks/coktail.jpg", 
      price: 189000, 
      category: FoodCategory.drinks, 
      availableAddons: 
      [
        Addon(name: "Ly ", price: 0),
        
      ],
      ),

    Food(name: "Nước Chanh",
     description: "Nước chanh là một loại nước giải khát được chế biến từ nước cốt chanh, pha loãng với nước và có thể được gia thêm đường, nước đá, lá bạc hà v.v.",
      imagePath: "lib/images/drinks/lemon.jpg", 
      price: 18900, 
      category: FoodCategory.drinks, 
      availableAddons: 
      [
        Addon(name: "Ly ", price: 0),
        
      ],
      ),

    Food(name: "Nước Ép Xoài",
     description: "Nước ép xoài có vị chua chua, ngọt ngọt rất lạ miệng. Hơn hết, thức uống này giúp tăng cường miễn dịch, hỗ trợ tiêu hóa và có tác dụng giảm cân bởi chứa rất ít calo.",
      imagePath: "lib/images/drinks/mango.jpg", 
      price: 18900, 
      category: FoodCategory.drinks, 
      availableAddons: 
      [
        Addon(name: "Ly ", price: 0),
        
      ],
      ),

    Food(name: "Nước Cam",
     description: "Nước cam hay nước cam ép, nước cam vắt là một loại thức uống phổ biến được làm từ cam bằng cách chiết xuất nước từ trái cam tươi bằng việc vắt hay ép thành một loại nước cam tươi Đối với các sản phẩm nước cam được sản xuất theo công nghiệp, nước cam được chế biến có cho thêm các chất phụ gia, bảo quản rồi đóng chai ",
      imagePath: "lib/images/drinks/orange.jpg", 
      price: 18900, 
      category: FoodCategory.drinks, 
      availableAddons: 
      [
        Addon(name: "Ly ", price: 0),
        
      ],
      ),

    Food(name: "Nước Ép Dưa Hấu",
     description: "Dưa hấu có tính hàn có thể dùng làm thức ăn giải nhiệt trong những ngày hè nóng nực. Không chỉ là một loại trái cây để ăn trong những ngày hè nóng bức mà nó còn là một loại thức uống dinh dưỡng rất tốt cho cơ thể.",
      imagePath: "lib/images/drinks/watermelon.jpg", 
      price: 18900, 
      category: FoodCategory.drinks, 
      availableAddons: 
      [
        Addon(name: "Ly ", price: 0),
        
      ],
      ),

    Food(name: "Soda Chanh",
     description: "Những người bị suy giảm chức năng tiêu hóa nên thì nên sử dụng nước soda. Trong nghiên cứu được đăng ở tạp chí Gastroenterology và Hepatology cho rằng những bệnh nhân có chứng khó tiêu, nên uống soda xen kẽ với nước lọc trong vòng hai tuần để cải thiện tình trạng này.",
      imagePath: "lib/images/drinks/soda.jpg", 
      price: 18900, 
      category: FoodCategory.drinks, 
      availableAddons: 
      [
        Addon(name: "Ly ", price: 0),
        
      ],
      ),

  ];


  final List<CartItem> _cart = [];


  String _deliveryAddress = 'An Giang';

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;


  //gio hang
 

  //them vao gio hang
  void addToCart(Food food, List<Addon> selectedAddons){
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      bool isSameFood = item.food == food;
      bool isSameAddons = ListEquality().equals(item.selectedAddons,selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null ){
      cartItem.quantity++;
    }
    else{
      _cart.add(
        CartItem(
          food: food, 
          selectedAddons: selectedAddons,
          ),
      );
    }
    notifyListeners();
  }

  //xoa khoi gio hang
  void removeFromCart (CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);


    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
        
      }else{
        _cart.removeAt(cartIndex);
      }
      
    }
  }

  // tong gia cua gio hang
  double getTotalPrice(){
    double total = 0.0;

    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //tong so luong trong gio hang

  int getTotalItemCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear gio hang
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }


  //update dia chi
  void updateDeliveryAddrress( String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }


  // tao hoa don
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Đây là hóa đơn của bạn.");
    receipt.writeln();

    String formattedDate = 
        DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("---------");

    for (final cartItem in _cart){
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
      
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Tổng vật phẩm : ${getTotalItemCount()}");
    receipt.writeln("Tổng giá: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Giao hàng tới: " + deliveryAddress);

    return receipt.toString();
  }
  String _formatPrice(double price){
      return "${price.toStringAsFixed(2)} \ vnđ";
    }


  String _formatAddons(List<Addon> addons){
    return addons
      .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
      .join(",");
  }
}