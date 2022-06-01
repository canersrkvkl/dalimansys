import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:dalimansys_app/pages/insideApp/invosys/newBill2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class NewBill extends StatefulWidget {
  const NewBill({Key key}) : super(key: key);

  @override
  _NewBillState createState() => _NewBillState();
}

class _NewBillState extends State<NewBill> {
  String companyName = "";
  String department = "";
  String documentType = "";
  String business = "";
  String billsType = "";
  String unit = "";
  var tfcBillNo = TextEditingController();
  var tfcBillPrice = TextEditingController();
  var tfcDescription = TextEditingController();
  var formKey = GlobalKey();
  List<String> listItem = <String>[
    "TL",
    "EURO",
    "USD",
    "RON",
  ];
  List<File> imageFile = [];
  final pdf = pw.Document();
  var pdfFile;

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
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Yeni Fatura Ekle",
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFEFEFEF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                    "Faturayı yükleyin",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6A6A6A),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: imageFile.isEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.camera,
                              size: 25,
                              color: Color(0xFF134AE5),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        color: Color(0xFF737373),
                                        height: 130,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).canvasColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(10),
                                              topRight:
                                                  const Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.camera),
                                                title: Text(
                                                  "Kameradan Çek",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                onTap: () {
                                                  _getFromCamera();
                                                },
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .solidImage),
                                                title: Text(
                                                  "Galeriden Seç",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                onTap: () {
                                                  _getFromGallery();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Fatura görüntüsü ekleyin.",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF134AE5),
                                ),
                              ),
                            ),
                            SizedBox(),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              color: Color(0xFF737373),
                                              height: 130,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            10),
                                                    topRight:
                                                        const Radius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      leading: FaIcon(
                                                          FontAwesomeIcons
                                                              .camera),
                                                      title: Text(
                                                        "Kameradan Çek",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        _getFromCamera();
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidImage),
                                                      title: Text(
                                                        "Galeriden Seç",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        _getFromGallery();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                      ),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.camera,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imageFile.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          left: 4.0,
                                          right: 4,
                                        ),
                                        child: Stack(
                                          children: [
                                            Image.file(
                                              imageFile[index],
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              left: 100,
                                              bottom: 157,
                                              child: SizedBox(
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.6),
                                                  child: IconButton(
                                                    icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .solidTrashAlt,
                                                      size: 17,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        imageFile.remove(
                                                            imageFile[index]);
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 16,
                  bottom: 16,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fatura Bilgilerini Girin",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6A6A6A),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  color: Colors.white,
                  elevation: 10,
                  child: DropdownSearch<String>(
                    popupBackgroundColor: Colors.grey[300],
                    popupTitle: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Şirket Adı",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        hintText: "Şirket Ara",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    mode: Mode.DIALOG,
                    showSelectedItems: true,
                    showSearchBox: true,
                    showClearButton: true,
                    showAsSuffixIcons: true,
                    items: [
                      "Sterk Plast S.R.L.",
                      "Dalisto Adsoft",
                    ],
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Şirket Seçin",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: GoogleFonts.poppins(
                          color: Color(0xFF6A6A6A),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (value) {
                      companyName = value;
                    },
                    validator: (String value) {
                      if (value == null) {
                        return "Şirket alanı boş bırakılamaz.";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  color: Colors.white,
                  elevation: 10,
                  child: TextField(
                    controller: tfcBillNo,
                    decoration: InputDecoration(
                      hintText: "Fatura No",
                      hintStyle: GoogleFonts.poppins(
                        color: Color(0xFF6A6A6A),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      contentPadding: EdgeInsets.all(12.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  color: Colors.white,
                  elevation: 10,
                  child: DropdownSearch<String>(
                    popupBackgroundColor: Colors.grey[300],
                    popupTitle: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Departman Seçin",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    mode: Mode.DIALOG,
                    showSelectedItems: true,
                    showSearchBox: true,
                    showAsSuffixIcons: true,
                    showClearButton: true,
                    items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                    searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      hintText: "Departman Ara",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(),
                    )),
                    dropdownSearchDecoration: InputDecoration(
                      //labelText: "Menu Mode",
                      hintText: "Departman Seçin",
                      hintStyle: GoogleFonts.poppins(
                          color: Color(0xFF6A6A6A),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    //popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (value) {
                      department = value;
                    },
                    //selectedItem: "Brazil",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  color: Colors.white,
                  elevation: 10,
                  child: DropdownSearch<String>(
                    popupBackgroundColor: Colors.grey[300],
                    popupTitle: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Belge Türü Seçin",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    mode: Mode.DIALOG,
                    showSelectedItems: true,
                    showSearchBox: true,
                    showClearButton: true,
                    showAsSuffixIcons: true,
                    items: ["Müşteri", "Tedarikçi"],
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        hintText: "Belge Türü Ara",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Belge Türü Seçin",
                      hintStyle: GoogleFonts.poppins(
                        color: Color(0xFF6A6A6A),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      documentType = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  color: Colors.white,
                  elevation: 10,
                  child: DropdownSearch<String>(
                    popupBackgroundColor: Colors.grey[300],
                    popupTitle: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Firma Seçin",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    mode: Mode.DIALOG,
                    showSelectedItems: true,
                    showSearchBox: true,
                    showAsSuffixIcons: true,
                    showClearButton: true,
                    items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        hintText: "Firma Ara",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Firma Seçin",
                      hintStyle: GoogleFonts.poppins(
                          color: Color(0xFF6A6A6A),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      business = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  color: Colors.white,
                  elevation: 10,
                  child: DropdownSearch<String>(
                    popupBackgroundColor: Colors.grey[300],
                    popupTitle: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Fatura Tipi Seçin",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    mode: Mode.DIALOG,
                    showSelectedItems: true,
                    showSearchBox: true,
                    showClearButton: true,
                    showAsSuffixIcons: true,
                    items: [
                      "1-AIV Aylıkçı Faturası",
                      "2-Kumanya Faturası",
                      "3-Avans Faturası",
                      "4-Personel Yemek Faturası",
                      "5-Personel Servis Faturası",
                      "6-Personel Temizlik Faturası",
                      "7-Güvenlik Hizmeti Faturası",
                      "8-Diğer Faturası",
                      "9-Doğalgaz Faturası",
                      "10-Elektrik Faturası",
                      "11-Kullanma Suyu Faturası",
                      "12-İçme Suyu Faturası",
                      "13-Kira Faturası",
                      "14-Kömür Faturası Faturası",
                      "15-Eğitim Faturası",
                      "16-Tamir Bakım",
                      "17-İade Faturası",
                      "18-Nakliye Faturası",
                    ],
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        hintText: "Fatura Tipi Ara",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Fatura Tipi Seçin",
                      hintStyle: GoogleFonts.poppins(
                          color: Color(0xFF6A6A6A),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      billsType = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Material(
                        color: Colors.white,
                        elevation: 10,
                        child: TextField(
                          controller: tfcBillPrice,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Fatura Tutarı Girin",
                            hintStyle: GoogleFonts.poppins(
                                color: Color(0xFF6A6A6A),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          cursorColor: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Material(
                        color: Colors.white,
                        elevation: 10,
                        child: DropdownSearch<String>(
                          popupBackgroundColor: Colors.grey[300],
                          popupTitle: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Para Birimi",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          mode: Mode.DIALOG,
                          showSelectedItems: true,
                          showSearchBox: true,
                          showClearButton: true,
                          showAsSuffixIcons: true,
                          items: ["TR", "EURO", "USD", "RON"],
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(),
                              hintText: "Para Birimi Ara",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          dropdownSearchDecoration: InputDecoration(
                            //labelText: "Menu Mode",
                            hintText: "Para Birimi",
                            hintStyle: GoogleFonts.poppins(
                              color: Color(0xFF6A6A6A),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            unit = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Material(
                  color: Colors.white,
                  elevation: 10,
                  child: TextField(
                    controller: tfcDescription,
                    decoration: InputDecoration(
                      hintText: "Fatura Açıklaması",
                      hintStyle: GoogleFonts.poppins(
                        color: Color(0xFF6A6A6A),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 4.0, right: 4.0, top: 8.0, bottom: 24.0),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF134AE5)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Devam Edin",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        FaIcon(
                          FontAwesomeIcons.longArrowAltRight,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (companyName.length == 0 ||
                          tfcBillNo.text.length == 0 ||
                          department.length == 0 ||
                          documentType.length == 0 ||
                          business.length == 0 ||
                          billsType.length == 0 ||
                          tfcBillPrice.text.length == 0 ||
                          unit.length == 0 ||
                          tfcDescription.text.length == 0) {
                        Flushbar(
                          icon: Icon(
                            Icons.warning,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Eksik bilgiler var",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          messageText: Text(
                            "Boş alan/alanlar var. Lütfen tüm alanları doldurduğunuzdan emin olun",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewBill2(
                              companyName: companyName,
                              department: department,
                              documentType: documentType,
                              business: business,
                              billType: billsType,
                              unit: unit,
                              billNo: tfcBillNo.text, 
                              billPrice: tfcBillPrice.text,
                              description: tfcDescription.text,
                            ),
                          ),
                        );
                        _createPdf();
                        _savePdf();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getFromCamera() async {
    XFile pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    _cropImage(pickedFile.path);
    Navigator.pop(context);
  }

  void _getFromGallery() async {
    XFile pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    _cropImage(pickedFile.path);
    Navigator.pop(context);
  }

  void _cropImage(String path) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: path,
      //aspectRatioPresets: [CropAspectRatioPreset.ratio7x5],
      aspectRatio: CropAspectRatio(ratioX: 10, ratioY: 14),
      maxHeight: 1400,
      maxWidth: 1000,
    );
    if (croppedImage != null) {
      setState(() {
        imageFile.add(croppedImage);
      });
    }
  }

  void _createPdf() async {
    for (var img in imageFile) {
      final image = pw.MemoryImage(img.readAsBytesSync());
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(image),
            );
          },
        ),
      );
    }
  }

  void _savePdf() async {
    try {
      final dir = await getExternalStorageDirectory();
      final file = File("${dir.path}/filename.pdf");
      await file.writeAsBytes(await pdf.save(), flush: true);
    } catch (error) {
      print(error);
    }
  }
}
