import 'dart:convert';
import 'package:http/http.dart';
import 'package:officecafeteria/models/cartItem.dart';
import 'package:officecafeteria/utilities/endpoints.dart';

Future<String> bookOrder({
  String registrationId,
  List<CartItem> cartList,
  String takeAwayTime,
}) async {
  String urlPOSTorder = API.bookOrder;
  Map<String, String> headers = {"Content-type": "application/json"};
  var orderProducts = List<dynamic>.from(cartList.map((x) => x.toJson()));
  var res = jsonEncode(orderProducts);
  String json = '''{
    "registrationId": "$registrationId",
    "orderProducts" : $res,
    "takeAwayTime": "$takeAwayTime"
}''';

  var response = await post(urlPOSTorder, headers: headers, body: json);
  String statusCode = response.statusCode.toString();
  print(response.body);
  print('Order POST request Status Code : ' + statusCode);
  if (statusCode == '201') {
    print('Order POST successfull');
  } else {
    print('Order POST Failed');
  }
  return statusCode;
}

class OrderList {
  OrderList({
    this.cartList,
  });
  List<CartItem> cartList;
  Map<String, dynamic> toJson() => {
        "orderProducts": cartList == null
            ? null
            : List<dynamic>.from(cartList.map((x) => x.toJson())),
      };
}
