import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop/homepage.dart';

class NewData extends StatefulWidget {
  NewData({Key? key}) : super(key: key);

  @override
  State<NewData> createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phnController = TextEditingController();

  Future submit() async {
    addUserDetails(
        _nameController.text.trim(),
        _emailController.text.trim(),
        int.parse(
          _phnController.text.trim(),
        ));

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Bio Data Has been submitted"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.all(14),
                  child: const Text("okay"),
                ),
              ),
            ],
          );
        });
  }

  Future addUserDetails(
    String name,
    String email,
    int phn,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'name': name, 'email': email, 'phn': phn});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phnController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BioData'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 30,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 19,
            ),
            
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Name",
                        style: GoogleFonts.hind(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 167, 167, 167)),
                      ),
                      TextField(
                        maxLength: 20,
                        controller: _nameController,
                        style: GoogleFonts.lato(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                          counter: Offstage(),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.hind(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 167, 167, 167)),
                      ),
                      TextField(
                        maxLength: 40,
                        controller: _emailController,
                        style: GoogleFonts.lato(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counter: Offstage(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Phone Number",
                        style: GoogleFonts.hind(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 167, 167, 167)),
                      ),
                      TextField(
                        controller: _phnController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.lato(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counter: Offstage(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 15, 32, 46),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(150, 47),
                ),
                onPressed: () {
                  submit();
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.hind(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
