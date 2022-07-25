import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_plus_sharedpreference/second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController firstName = TextEditingController();

  /// ກຳນົດຄ່າທີ່ເປັນ String ລົງ Local storage
  Future<void> setStringValue() async {
    String key = 'firstname';
    String value = 'Bounphone';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  /// ກຳນົດຄ່າທີ່ເປັນ int ລົງ Local storage
  Future<void> setIntValue() async {
    String key = 'score';
    int value = 70;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(key, value);
  }

  /// ກຳນົດຄ່າທີ່ເປັນ bool ລົງ Local storage
  Future<void> setBoolValue() async {
    String key = 'myPen';
    bool value = false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }

  /// ກຳນົດຄ່າທີ່ເປັນ double ລົງ Local storage
  Future<void> setDoubleValue() async {
    String key = 'height';
    double value = 1.7;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(key, value);
  }

  /// ກຳນົດຄ່າທີ່ເປັນ double ລົງ Local storage
  Future<void> setStringListValue() async {
    String key = 'family';
    List<String> value = ['somchit', 'sommaiy'];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(key, value);
  }

  /// ດຶງຂໍ້ມູນຈາກ shared preference
  Future<String?> getString() async {
    String key = 'firstname';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? firstname = sharedPreferences.getString(key);
    return firstname;
  }

  Future<int?> getInt() async {
    String key = 'score';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? score = sharedPreferences.getInt(key);
    return score;
  }

  Future<double?> getDouble() async {
    String key = 'height';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double? height = sharedPreferences.getDouble(key);
    return height;
  }

  Future<bool?> getBool() async {
    String key = 'myPen';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? myPen = sharedPreferences.getBool(key);
    return myPen;
  }

  Future<List<String>?> getListString() async {
    String key = 'family';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? family = sharedPreferences.getStringList(key);
    return family;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    String? firstName = await getString();
    if (firstName != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField(
            //   controller: firstName,
            // ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () async {
                  /// ກຳນົດຄ່າທີ່ເປັນ String ລົງ Local storage
                  await setStringValue();

                  /// ກຳນົດຄ່າທີ່ເປັນ int ລົງ Local storage
                  await setIntValue();

                  /// ກຳນົດຄ່າທີ່ເປັນ bool ລົງ Local storage
                  await setBoolValue();

                  /// ກຳນົດຄ່າທີ່ເປັນ double ລົງ Local storage
                  await setDoubleValue();

                  /// ກຳນົດຄ່າທີ່ເປັນ double ລົງ Local storage
                  await setStringListValue();
                  print('save success');
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SecondPage()));
                },
                child: Text('ກົດປຸ່ມ'))
          ],
        ),
      ),
    );
  }
}
