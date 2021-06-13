import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  _WhatsAppState createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validate() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await launch("https://wa.me/91${_controller.text}?text=${_message.text}");
    } else {
      print('Check');
    }
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController _message = TextEditingController();
  // String phoneNumber = "";

  // void _onCountryChange(CountryCode countryCode) {
  //   this.phoneNumber = countryCode.toString();
  //   print("New Country selected: " + countryCode.toString());
  // }

  // void check() {
  //   print("Full Text: " + this.phoneNumber + phoneController.text);
  // }

  @override
  Widget build(BuildContext context) {
    // final phone = new TextFormField(
    //   controller: phoneController,
    //   keyboardType: TextInputType.phone,
    //   autofocus: false,
    //   style: new TextStyle(
    //     fontSize: 18.0,
    //     color: Colors.white,
    //     fontWeight: FontWeight.w400,
    //   ),
    // );

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AppBar(
                brightness: Brightness.dark,
                backgroundColor: Colors.white.withOpacity(.05),
                elevation: 0,
                title: Text(
                  'WhatsApp',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.green.withOpacity(.7),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                centerTitle: true,
                // actions: [
                //   IconButton(
                //     onPressed: () {},
                //     tooltip: 'Info',
                //     enableFeedback: false,
                //     icon: Icon(CupertinoIcons.info),
                //   )
                // ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(children: [
                  Icon(Icons.phone),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFE5B4),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0,
                              offset: Offset(0, 0))
                        ]),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        height: 50,
                        child: TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.phone,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                            decoration: InputDecoration(
                                border: InputBorder.none,

                                // prefixIcon: Padding(
                                //     padding: EdgeInsets.all(15),
                                //     child: Text(
                                //       '+91',
                                //       style: TextStyle(color: Colors.black),
                                //     )),
                                contentPadding: EdgeInsets.only(
                                    top: 5, left: 20, bottom: 5),
                                // prefixIcon: Padding(
                                //     padding: EdgeInsets.only(
                                //         top: 5, left: 20, bottom: 5),
                                //     child: Text(
                                //       '+91',
                                //       style: TextStyle(color: Colors.black),
                                //     )),
                                prefixText: '+91 ',
                                hintText: 'Enter the Phone Number',
                                hintStyle: TextStyle(
                                    color: Colors.black87, fontSize: 14)),
                            validator: (phone) {
                              if (phone!.isEmpty) {
                                return 'Please Enter mobile number';
                              } else if (phone.length < 10) {
                                return 'Enter 10 digit number';
                              } else if (phone.length > 10) {
                                return 'Please enter 10 digit';
                              } else
                                return null;
                            }),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(children: [
                  Icon(Icons.email),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Message',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFE5B4),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0,
                              offset: Offset(0, 0))
                        ]),
                    child: Form(
                      child: Container(
                        height: 80,
                        child: TextFormField(
                          controller: _message,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                          decoration: InputDecoration(
                              border: InputBorder.none,

                              // prefixIcon: Padding(
                              //     padding: EdgeInsets.all(15),
                              //     child: Text(
                              //       '+91',
                              //       style: TextStyle(color: Colors.black),
                              //     )),
                              contentPadding:
                                  EdgeInsets.only(top: 5, left: 20, bottom: 5),
                              // prefixIcon: Padding(
                              //     padding: EdgeInsets.only(
                              //         top: 5, left: 20, bottom: 5),
                              //     child: Text(
                              //       '+91',
                              //       style: TextStyle(color: Colors.black),
                              //     )),
                              prefixText: 'You: ',
                              hintText: 'Enter the Message (Optional)',
                              hintStyle: TextStyle(
                                  color: Colors.black87, fontSize: 14)),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                margin: EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  onPressed: () {
                    validate();
                  },
                  elevation: 1.0,
                  color: Colors.green[400],
                  child: Text("Open",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              )
            ])));
  }
}
