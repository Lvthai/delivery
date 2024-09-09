import 'package:deliveryapp/models/food.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const QuantitySelector({
    super.key,
    required this.food,
    required this.onDecrement,
    required this.onIncrement,
    required this.quantity,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          // nut -
          GestureDetector(
            onTap:  onDecrement,
            child: Icon(Icons.remove, size: 20, color: Theme.of(context).colorScheme.primary,),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  quantity.toString(),
                  ),
                ),
            ),
          ),

          // nut +
          GestureDetector(
            onTap:  onIncrement,
            child: Icon(Icons.add, size: 20, color: Theme.of(context).colorScheme.primary,),
          ),

          ],
      ),
    );
  }
}