import 'package:flutter/material.dart';
class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                height: 330,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors:[
                    Color(0xFF789373),
                    Color(0xFF0B3644),
                    Color(0xFF170D2D),]),
                  color: Color(0xFF789373),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/users/u1.PNG'),
                          radius: 50,
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: const Icon(
                              Icons.edit,
                              color: Color(0xFF3E503C),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Kullanıcı 1",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Sıralama",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text("#1",
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.9))),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Liderler Sıralaması",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 300,
                  child: ListView(
                      shrinkWrap: true,
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u1.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 1")
                                ],
                              ),
                              leading: Text(
                                "#1",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("20506"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u2.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 2")
                                ],
                              ),
                              leading: Text(
                                "#2",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("18456"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u4.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 3")
                                ],
                              ),
                              leading: Text(
                                "#3",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("14587"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u3.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 4")
                                ],
                              ),
                              leading: Text(
                                "#4",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("12470"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u12.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 5")
                                ],
                              ),
                              leading: Text(
                                "#5",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("9999"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u6.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 6")
                                ],
                              ),
                              leading: Text(
                                "#6",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("9255"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u7.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 7")
                                ],
                              ),
                              leading: Text(
                                "#7",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("7000"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u5.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 8")
                                ],
                              ),
                              leading: Text(
                                "#8",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("3800"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u9.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 9")
                                ],
                              ),
                              leading: Text(
                                "#9",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("1567"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u10.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 10")
                                ],
                              ),
                              leading: Text(
                                "#10",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("1024"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u11.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 11")
                                ],
                              ),
                              leading: Text(
                                "#11",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("247"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),

                            ListTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      'assets/images/users/u12.PNG',
                                      width: 600.0,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text("  Kullanıcı 12")
                                ],
                              ),
                              leading: Text(
                                "#12",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                ("125"),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.black,endIndent: 10,indent: 10,),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
