import 'package:deliveryapp/models/retaurants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Địa Chỉ Của Bạn"),
              content: const TextField(
                decoration: const InputDecoration(hintText: "Chọn Địa Chỉ"),
              ),
              actions: [
                // huy
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    textController.clear();
                  },
                  child: const Text('Hủy'),
                ),

                MaterialButton(
                  onPressed: () {

                    String newAddress = textController.text;
                    context.read<Restaurant>().updateDeliveryAddrress(newAddress);
                    Navigator.pop(context);
                    textController.clear();

                  },
                  child: const Text('Lưu'),
                ),

                //luu
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Giao Hàng Ngay",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(builder: (context, restaurant, child) => Text(
                  restaurant.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
