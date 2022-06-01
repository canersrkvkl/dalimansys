import 'package:dalimansys_app/pages/insideApp/invosys/allBills/confirmProcess.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BillDetails extends StatefulWidget {
  @override
  _BillDetailsState createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  var tfcYorum = TextEditingController();
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        centerTitle: true,
        title: Text(
          "Fatura Detayı",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.ellipsisV,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFEFEFEF),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                //Column 1. Eleman
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.fileInvoice,
                          size: 20,
                          color: Color(0xFF969696),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "6746295",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "46 sn",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        FaIcon(
                          FontAwesomeIcons.clock,
                          size: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                //Column 2. Eleman
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Tıklandı");
                        },
                        child: Container(
                          width: 100,
                          height: 150,
                          color: Colors.grey[300],
                          child: Image.asset(
                            "assets/images/resim.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "3 sayfa içeriyor.",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Caner Sarıkavaklı ekledi.",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                "Faturayı görüntüle.",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              FaIcon(
                                FontAwesomeIcons.longArrowAltRight,
                                color: Color(0xFF134AE5),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  "Onay Sırası",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF6A6A6A),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmProcess(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      "Onay Bekliyor.",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.hourglassHalf,
                                      color: Color(0xFFF48421),
                                      size: 15,
                                    ),
                                  ],
                                ),
                                FaIcon(
                                  FontAwesomeIcons.infoCircle,
                                  color: Color(0xFF1597D8),
                                  size: 20,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Geylani Arca",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.solidCheckCircle,
                                  color: Color(0xFF1597D8),
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.comment,
                                  color: Color(0xFF134AE5),
                                  size: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
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
                            "Durumunu Değiştir",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //YORUM SAYFASINI AÇ
                      onTap: () {
                        //int value = 0;
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Container(
                                color: Color(0xFF737373),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  child: Column(
                                    //mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        color: Color(0xFFEFEFEF),
                                        height: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SingleChildScrollView(
                                            child: TextField(
                                              controller: tfcYorum,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: null,
                                              autocorrect: true,
                                              decoration: InputDecoration(
                                                hintText: "Bir yorum yaz...",
                                                hintStyle: GoogleFonts.poppins(
                                                  color: Color(0xFF6A6A6A),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              cursorColor: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                                backgroundColor: MaterialStateProperty.all<Color>(
                                                  Color(0xFFEFEFEF),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  FaIcon(FontAwesomeIcons.solidCheckCircle, color: Color(0xFF1597D8),),
                                                  SizedBox(width: 8,),
                                                  Text("Onayla", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500),),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            ElevatedButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                                backgroundColor: MaterialStateProperty.all<Color>(
                                                  Color(0xFFEFEFEF),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  FaIcon(FontAwesomeIcons.solidTimesCircle, color: Color(0xFFFD0001),),
                                                  SizedBox(width: 8,),
                                                  Text("Reddet", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Text(
                  "Fatura Açıklaması",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF6A6A6A),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Fatura Erkby tarafından aylık fatura olarak kesildi. 1399 TL ödenmesi gerekiyor.Fatura Erkby tarafından aylık fatura olarak kesildi. 1399 TL ödenmesi gerekiyor.Fatura Erkby tarafından aylık fatura olarak kesildi. 1399 TL ödenmesi gerekiyor.",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Text(
                  "Fatura Detayı",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF6A6A6A),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Şirket",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Dalisto Adsoft",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Belge Numarası",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "D00202103702",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Departman",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Ankara",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Belge Türü",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Müşteri",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Firma",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "ERKBY Tarım A.Ş.",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fatura Tipi",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Aylık Fatura",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fatura Tutarı",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "1.399,99",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fatura Ekleyen",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF969696),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Caner Sarıkavaklı",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
