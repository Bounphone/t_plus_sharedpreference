import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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

  /// ເຄຍຂໍ້ມູນໃນ Shared preference
  Future<void> clearAllData() async {
    String family = 'family';
    String myPen = 'myPen';
    String height = 'height';
    String score = 'score';
    String firstname = 'firstname';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(family);
    sharedPreferences.remove(myPen);
    sharedPreferences.remove(height);
    sharedPreferences.remove(score);
    sharedPreferences.remove(firstname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
        actions: [
          IconButton(
              onPressed: () async {
                await clearAllData();
                print('Clear success');
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getString(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(child: Text('${snapshot.data}'));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: getInt(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(child: Text('${snapshot.data}'));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: getBool(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(child: Text('${snapshot.data}'));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: getDouble(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(child: Text('${snapshot.data}'));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder<List<String>?>(
            future: getListString(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Center(child: Text('${snapshot.data![index]}'));
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
