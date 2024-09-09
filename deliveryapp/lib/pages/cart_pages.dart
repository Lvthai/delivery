import 'package:deliveryapp/components/my_button.dart';
import 'package:deliveryapp/components/my_cart_tile.dart';
import 'package:deliveryapp/models/cart_item.dart';
import 'package:deliveryapp/models/retaurants.dart';
import 'package:deliveryapp/pages/payment_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            
            actions: [
              //nut clear gio hang
              IconButton(
                onPressed: (){
                  showDialog(context: context, builder:(context) => AlertDialog(
                    title: const Text("Bạn có chắc chắn là muốn xóa tất cả đơn hàng trong giỏ hàng ?"),
                    actions: [
                      //tu choi
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Từ chối")
                        ),
                      //dong y
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          restaurant.clearCart();
                      }, 
                      child: const Text("Đòng ý")
                      ),
                      ],
                    
                  )
                  );
                },
                icon: const Icon(Icons.delete),
                ),
            ],
          ),
          body: Column(
            children: [
              // danh sach gio hang
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty 
                    ? Expanded(
                      child: Center(
                        child: Text("Giỏ hàng trống..."),
                        ),
                        )
                    : Expanded(
                      child: ListView.builder(
                          itemCount: userCart.length,
                          itemBuilder: (context, index) {
                            //nhan item gio hang ca nhan
                            final cartItem = userCart[index];
                
                            // return gio hang UI
                            return MyCartTile(cartItem: cartItem);
                          },
                          ),
                    ),
                  ],
                ),
              ),

              // nut thanh toan
              MyButton(
                text: "Xữ lý thanh toán", 
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage()),
                ),
                ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
