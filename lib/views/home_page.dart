import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openion/data/data.dart';
import 'package:openion/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _notesController = TextEditingController();
  final _hintsController = TextEditingController();
  @override
  void initState() {
    NotesClass.retriveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 11, 175, 172),
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 11, 175, 172),
        title: Text(
          'Note Keeper',
          style: GoogleFonts.varelaRound(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(
          Icons.sticky_note_2_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: NotesClass.data.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return CustomCard(
                    index: index,
                    onPressed: () {
                      setState(() {
                        NotesClass.removeData(index);
                      });
                    },
                  );
                },
                itemCount: NotesClass.data.length,
              )
            : Center(
                child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Icon(
                      Icons.eco_sharp,
                      color: Color.fromARGB(100, 11, 175, 172),
                      size: 100,
                    ),
                    Text(
                      'No Data To Display...',
                      style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      'Add Notes',
                      style: GoogleFonts.varelaRound(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    content: SizedBox(
                      height: 150,
                      child: Column(
                        children: [
                          TextField(
                            controller: _notesController,
                            decoration: InputDecoration(
                              label: Text(
                                'Notes',
                                style:
                                    GoogleFonts.varelaRound(color: Colors.grey),
                              ),
                            ),
                          ),
                          TextField(
                            controller: _hintsController,
                            decoration: InputDecoration(
                                label: Text(
                              'Hints',
                              style:
                                  GoogleFonts.varelaRound(color: Colors.grey),
                            )),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        child: Text(
                          'OK',
                          style: GoogleFonts.varelaRound(
                            color: Colors.purple,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            NotesClass.addData(
                                _notesController.text, _hintsController.text);
                            Navigator.pop(context);
                            _notesController.clear();
                            _hintsController.clear();
                          });
                        },
                      ),
                      GestureDetector(
                        child: Text(
                          'CANCEL',
                          style: GoogleFonts.varelaRound(
                            color: Colors.purple,
                          ),
                        ),
                        onTap: () {
                          _hintsController.clear();
                          _notesController.clear();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            },
          );
        },
        backgroundColor:const Color.fromARGB(255, 11, 175, 172),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
