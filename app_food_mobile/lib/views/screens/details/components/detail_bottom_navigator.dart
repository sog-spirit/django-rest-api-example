import 'package:app_food_mobile/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../models/product.dart';
import '../../../../viewmodels/Carts/cart_view_model.dart';

class DetailBottomNavigator extends StatefulWidget {
  const DetailBottomNavigator({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<DetailBottomNavigator> createState() => _DetailBottomNavigatorState();
}

class _DetailBottomNavigatorState extends State<DetailBottomNavigator> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    //user model view to add product to cart
    return Container(
      height: 85,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          GestureDetector(
            onTap: () {
              if (count > 1) {
                setState(() {
                  count--;
                });
              } else
                // ignore: curly_braces_in_flow_control_structures
                setState(() {
                  count = 1;
                });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SvgPicture.asset(
                "assets/icons/minus.svg",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            count.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 15),
          GestureDetector(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  count++;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SvgPicture.asset(
                  "assets/icons/plus.svg",
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ]),
        Consumer<CartViewModel>(
          builder: ((context, provider, child) => TextButton(
                onPressed: () async {
                  // await provider.updateCart(1, widget.product.id, count);
                  await provider.updateCart(widget.product, count, true);
                },
                child: Container(
                  height: 90,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Thêm",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.apply(color: kWhiteColor),
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          margin: EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          (widget.product.price.toInt() * count).toVND(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.apply(color: kWhiteColor),
                        ),
                      ]),
                ),
              )),
        ),
      ]),
    );
  }
}
