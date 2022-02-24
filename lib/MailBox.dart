import 'dart:ffi';

import 'package:carbon_mail_ui/service/Inbox_model.dart';
import 'package:carbon_mail_ui/service/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:http/http.dart';

class MailBox extends StatefulWidget {
  const MailBox({Key? key}) : super(key: key);

  @override
  _MailBoxState createState() => _MailBoxState();
}

class _MailBoxState extends State<MailBox> {
  InboxModel _inboxModel = InboxModel();
  List<InboxTitle>? _inboxTitle;
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _inboxTitle = await _inboxModel.getPost();
    changeLoading();
  }

  var sayfaListesi = [MailBox()];
  int sayfaIndex = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFF293855),
        body: isLoading
            ? Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    Text(
                      "Keep up the\ncarbon-free\nwork! 🎉",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFAFAFA),
                        height: 1.2,
                        wordSpacing: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Subscriptions (18)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFAFAFA),
                          ),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 86, 106, 146),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "25% CLEANED",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFFAFAFA),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 18,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    height: size.height * 0.1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: size.width * 0.3,
                                                child: Text(
                                                  _inboxTitle?[index].title ??
                                                      "",
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Linkify(
                                                onOpen: (link) {
                                                  print(
                                                      "Linkify link = ${link.url}");
                                                },
                                                text: "www.coding-journey.io",
                                                style: TextStyle(
                                                    color: Colors.black),
                                                linkStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 85,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 205, 223, 255),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 6.0,
                                                bottom: 6.0,
                                                right: 10,
                                                left: 10.0,
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Color.fromARGB(
                                                      255, 83, 70, 160),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
        bottomNavigationBar: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_up),
                label: "",
              ),
            ],
            selectedItemColor: Color.fromARGB(255, 38, 0, 255),
          ),
        ));
  }
}
