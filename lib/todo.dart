import 'package:flutter/material.dart';

class TodoAPP extends StatefulWidget {
  const TodoAPP({Key? key}) : super(key: key);

  @override
  State<TodoAPP> createState() => _TodoAPPState();
}

class _TodoAPPState extends State<TodoAPP> {
  List<dynamic> list = ["ADEEL", "RAO", "NOMAN", "AHMED AMIN"];
  TextEditingController addText = TextEditingController();

  addData() {
    setState(() {
      list.add(addText.text);
      addText.clear();
    });
  }

  var output = "";
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
                  ),
                ],
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: TextField(
                        controller: addText,
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
        InkWell(
          onTap: addData,
          child: Padding(
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
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(
                      color: (Color(0xFF3366FF)),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(0xFF3366FF),
                    //     blurRadius: 20,
                    //     spreadRadius: 6,
                    //   ),
                    // ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Center(
                    child: ListTile(
                      title: Text(
                        "${list[index]}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Container(
                        width: 60,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("EDIT ITEM"),
                                        content: TextField(
                                          onChanged: (value) {
                                            output = value;
                                          },
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  list.replaceRange(index,
                                                      index + 1, {output});
                                                });
                                              },
                                              child: Text("EDIT"))
                                        ],
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.edit,
                                color: Color(0xFF3366FF),
                                size: 25,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    list.removeAt(index);
                                  });
                                },
                                child: Icon(
                                  Icons.delete_forever_outlined,
                                  color: Colors.red,
                                  size: 25,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
