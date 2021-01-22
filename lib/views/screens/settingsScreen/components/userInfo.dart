import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

final secureStorage = FlutterSecureStorage();

class UserInfo extends StatelessWidget {
  const UserInfo({
    this.info,
    this.icon,
  });

  final String info, icon;
  Future<String> getInfo(String key) async {
    var info = await secureStorage.read(key: '$key');
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: () {},
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.red,
              width: 22,
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info,
                ),
                FutureBuilder<String>(
                    future: getInfo(info),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
