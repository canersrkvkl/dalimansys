import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewBill2 extends StatefulWidget {
  final String companyName;
  final String department;
  final String documentType;
  final String business;
  final String billType;
  final String unit;
  final String billNo;
  final String billPrice;
  final String description;

  const NewBill2(
      {Key key,
      this.companyName,
      this.department,
      this.documentType,
      this.business,
      this.billType,
      this.unit,
      this.billNo,
      this.billPrice,
      this.description})
      : super(key: key);

  @override
  _NewBill2State createState() => _NewBill2State();
}

class _NewBill2State extends State<NewBill2> {
  List<String> yetkililer = [
    "Akın Altun",
    "Ali İslambay",
    "Av. Süleyman İslambay",
    "Bekir Ünal",
    "Beynaz Enan",
    "Cenk Öztürk",
    "Dalisto Genel Kullanıcı",
    "Elif Pirbudak",
    "Erbil Şaka",
    "Erkan Genç",
    "Filiz Osman",
    "Geylani Arca",
    "İbrahim Karakaya",
    "Kaan Kamil Akkurt",
    "Mehmet Ali Yalçın",
    "Mehmet Tünen",
    "Oğuz Gümüş",
    "Ömer Karakaya",
    "Salih Tepe",
    "Yağmur Pastutmaz",
  ];
  List<String> secilenYetkililer = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF1597D8),
                Color(0xFF9BDEF7),
              ],
            ),
          ),
        ),
        title: Text(
          "Onay Yetkilileri",
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFEFEFEF),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 16.0,
                bottom: 16.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Onay Yetkililerini Seçin",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6A6A6A),
                  ),
                ),
              ),
            ),
            secilenYetkililer.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: secilenYetkililer.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                yetkililer.insert(0, secilenYetkililer[index]);
                                secilenYetkililer
                                    .remove(secilenYetkililer[index]);
                              });
                            },
                            title: Text(
                              secilenYetkililer[index],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[400],
                              child: Text(
                                "${index + 1}".toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Onay sırasında kimse yok. Aşağıdan seçin.",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kişi Listesi",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6A6A6A),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: yetkililer.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          secilenYetkililer.add(yetkililer[index]);
                          yetkililer.remove(yetkililer[index]);
                        });
                      },
                      title: Text(
                        yetkililer[index],
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print(widget.billType);
                  print(widget.business);
                  print(widget.companyName);
                  print(widget.department);
                  print(widget.description);
                  print(widget.documentType);
                  print(widget.unit);
                  print(widget.billNo);
                  print(widget.billPrice);
                  print(secilenYetkililer);
                  Flushbar(
                    icon: Icon(
                      Icons.warning,
                      color: Colors.white,
                    ),
                    titleText: Text(
                      "Başarılı",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    messageText: Text(
                      "Fatura başarıyla eklendi.",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    duration: Duration(seconds: 3),
                    backgroundColor: Colors.green,
                    flushbarPosition: FlushbarPosition.TOP,
                  ).show(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0XFF134AE5),
                        Color(0XFF6587E8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Fatura Ekle",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
