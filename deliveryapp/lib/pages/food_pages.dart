import 'dart:io';

import 'package:deliveryapp/components/my_button.dart';
import 'package:deliveryapp/models/retaurants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({
    super.key,
    required this.food,
  }) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart (Food food, Map<Addon,bool> selectedAddons){

    // dong trang dang mo va quay ve menu
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if (widget.selectedAddons[addon]== true){
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // hinh anh
            Image.asset(widget.food.imagePath),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //ten
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  // gia
                  Text(
                    widget.food.price.toString() + '\ vnđ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  //mo ta
                  Text(
                    widget.food.description,
                  ),

                  const SizedBox(height: 10),

                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                  ),

                  Text(
                    "Thêm",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  //phan an phu
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        Addon addon = widget.food.availableAddons[index];

                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            '${addon.price}\ vnđ',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            MyButton(
              text: "Thêm vào giỏ hàng",
              onTap: () => addToCart(widget.food,widget.selectedAddons),
              ),

            const SizedBox(height: 20),
            //button them vao gio hang
          ],
        ),
      ),
    ),

    SafeArea(
      child: Opacity(
        opacity: 0.5,
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          decoration: 
            BoxDecoration(color: Theme.of(context).colorScheme.secondary, shape: BoxShape.circle,),
          child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    ),


    ],
      
    );
  }
}
