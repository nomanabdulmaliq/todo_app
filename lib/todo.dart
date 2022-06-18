import 'package:flutter/material.dart';

class TodoAPP extends StatefulWidget {
  const TodoAPP({Key? key}) : super(key: key);

  @override
  State<TodoAPP> createState() => _TodoAPPState();
}

class _TodoAPPState extends State<TodoAPP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'TODO LIST',
          style: TextStyle(
            fontSize: 30,
          ),
        )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF3366FF),
                    blurRadius: 20,
                    spreadRadius: 6,
                  )
                ],
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: TextField(
                        cursorColor: Color(0xffB6B7B7),
                        cursorWidth: 3.0,
                        cursorHeight: 30,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 100, 100, 100),
                          // fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Todo Task...",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 100, 100, 100),
                          ),
                          border: InputBorder.none,
                        )),
                  ))),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListTile(
            title: Text(
              "data",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            trailing: Container(
              width: 60,
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Color(0xFF3366FF),
                    size: 30,
                  ),
                  Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
