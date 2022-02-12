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
        appBar: AppBar(
          backgroundColor: const Color(0xFF3E503C),
          leading: const Icon(Icons.arrow_back),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ],
          title: const Text(
            "Liderler",
            style: TextStyle(fontSize: 29),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                height: 330,
                decoration: const BoxDecoration(
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
                          backgroundImage: AssetImage('assets/avatar.png'),
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
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset(
                                  'assets/avatar.png',
                                  width: 600.0,
                                  height: 240.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text("  Kullanıcı ${index + 1}")
                            ],
                          ),
                          leading: Text(
                            "#${index + 1}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            (200000 / (index + 1)).toString().substring(0, 5),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 1,
                        color: Color(0xFF789373),
                        indent: 10,
                        endIndent: 10,
                      ),
                      itemCount: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
