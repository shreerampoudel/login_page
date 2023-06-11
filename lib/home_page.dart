import 'package:flutter/material.dart';
import 'package:login_app/description.dart';
import 'package:login_app/data.dart';
import 'package:login_app/data2.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Restaurant Menu")),
        backgroundColor: Colors.black,
      ),
      endDrawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blue, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 8.0),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/08/10/03/47/guy-2617866_1280.jpg"),
                  radius: 50,
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 7,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Shreeram Poudel",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 255, 204, 204),
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: drawerList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              drawerList[index].icon,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            title: Text(
                              drawerList[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 204, 204),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  title: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 204, 204),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.red, Colors.black, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Description(
                        image: data[index]["image"].toString(),
                        name: data[index]["name"].toString(),
                        price: data[index]["price"].toString(),
                        description: data[index]["description"].toString(),
                        category: data[index]["category"].toString(),
                        ingredients:
                            (data[index]["ingredients"] as Iterable<dynamic>)
                                .toList()
                                .cast<String>(),
                      );
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        data[index]["image"].toString(),
                        height: 138,
                        width: 150,
                      ),
                      Text(
                        data[index]["name"].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs.${data[index]["price"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
