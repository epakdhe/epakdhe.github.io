import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:docxtpl/docxtpl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:open_file/open_file.dart';
import 'package:external_path/external_path.dart';
import 'package:intl/intl.dart';
import 'package:form_validator/form_validator.dart';
import 'package:sippasti_22/beranda.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CeraiBiasa extends StatefulWidget {
  const CeraiBiasa({Key? key}) : super(key: key);

  @override
  CeraiBiasaState createState() => CeraiBiasaState();
}

class CeraiBiasaState extends State<CeraiBiasa> {
//
  String tanggalDoc = DateFormat("yyMMdd-kkmmss").format(DateTime.now());
  String tanggalSurat = DateFormat.d().format(DateTime.now());
  String bulanSurat = DateFormat.M().format(DateTime.now());
  String tahunSurat = DateFormat.y().format(DateTime.now());

  String bulanSuratText = '';

//
  bool loading = false;
  String savedFileDocx = '';
  String cariFile = '';
  List<String> mergeFields = [];
  //

  bool visibleFormP = true;
  bool visibleFormAlamatP = false;
  bool visibleFormT = false;
  bool visibleFormAlamatT = false;
//
  bool visibleFormPernikahan = false;
  bool visibleFormAlamatBersama = false;
  //
  bool visibleFormAnak = false;
  bool visibleJumlahAnak = false;
  bool visibleDataAnak1 = false;
  bool visibleDataAnak2 = false;
  bool visibleDataAnak3 = false;
  bool visibleDataAnak4 = false;
  bool visibleDataAnak5 = false;
  bool visibleDataAnak6 = false;
  bool visibleDataAnak7 = false;
  bool visibleDataAnak8 = false;
  bool visibleDataAnak9 = false;
  bool visibleDataAnak10 = false;
  bool visibleDataAnak11 = false;
  bool visibleDataAnak12 = false;
  //
  bool visibleFormWaktuPertengkaran = false;
  bool visibleFormPuncakPertengkaran = false;

  bool visibleFormSebabPertengkaran = false;
  bool visibleSebabPertengkaranItem1 = false;
  bool visibleSebabPertengkaranItem2 = false;
  bool visibleSebabPertengkaranItem3 = false;
  bool visibleSebabPertengkaranItem4 = false;
  bool visibleSebabPertengkaranItem5 = false;
  bool visibleSebabPertengkaranItem6 = false;
  bool visibleSebabPertengkaranItem7 = false;
  bool visibleSebabPertengkaranItem8 = false;
  bool visibleSebabPertengkaranItem9 = false;
  bool visibleSebabPertengkaranItem10 = false;
  bool visibleSebabPertengkaranLainnya1 = false;
  bool visibleSebabPertengkaranLainnya2 = false;
  bool visibleSebabPertengkaranLainnya3 = false;

  bool visibleFormAkibatPertengkaran = false;
  bool visibleAkibatPertengkaranText = false;
  //
  bool visibleFormDataNafkah = false;
  bool visibleNafkahIddah = false;
  bool visibleNafkahMadhiyah = false;
  bool visiblePemberianMutah = false;
  bool visibleNafkahMadhiyahAnak = false;
  bool visibleHadhanahNafkahAnak = false;
  //
  bool visibleFormDataTidakDiberiNafkah = false;
  //
  bool visibleFormDataPerdamaian = false;
  bool visibleUsahaDamai2 = false;
  //
  bool visibleSimpanData = false;
  //
  String elektronik = '';

  String nomorAnak1text = '';
  String umurAnak1text = '';
  String komaAnak1text = '';
  String tahunAnak1text = '';

  String barisBaruAnak2text = '';
  String nomorAnak2text = '';
  String umurAnak2text = '';
  String komaAnak2text = '';
  String tahunAnak2text = '';

  String barisBaruAnak3text = '';
  String nomorAnak3text = '';
  String umurAnak3text = '';
  String komaAnak3text = '';
  String tahunAnak3text = '';

  String barisBaruAnak4text = '';
  String nomorAnak4text = '';
  String umurAnak4text = '';
  String komaAnak4text = '';
  String tahunAnak4text = '';

  String barisBaruAnak5text = '';
  String nomorAnak5text = '';
  String umurAnak5text = '';
  String komaAnak5text = '';
  String tahunAnak5text = '';

  String barisBaruAnak6text = '';
  String nomorAnak6text = '';
  String umurAnak6text = '';
  String komaAnak6text = '';
  String tahunAnak6text = '';

  String barisBaruAnak7text = '';
  String nomorAnak7text = '';
  String umurAnak7text = '';
  String komaAnak7text = '';
  String tahunAnak7text = '';

  String barisBaruAnak8text = '';
  String nomorAnak8text = '';
  String umurAnak8text = '';
  String komaAnak8text = '';
  String tahunAnak8text = '';

  String barisBaruAnak9text = '';
  String nomorAnak9text = '';
  String umurAnak9text = '';
  String komaAnak9text = '';
  String tahunAnak9text = '';

  String barisBaruAnak10text = '';
  String nomorAnak10text = '';
  String umurAnak10text = '';
  String komaAnak10text = '';
  String tahunAnak10text = '';

  String barisBaruAnak11text = '';
  String nomorAnak11text = '';
  String umurAnak11text = '';
  String komaAnak11text = '';
  String tahunAnak11text = '';

  String barisBaruAnak12text = '';
  String nomorAnak12text = '';
  String umurAnak12text = '';
  String komaAnak12text = '';
  String tahunAnak12text = '';

  String orangAnaktext = '';

  //
  late TextEditingController namaP;
  late TextEditingController namaAyahP;
  late TextEditingController tempatLahirP;
  late TextEditingController tanggalLahirP;
  late SingleValueDropDownController bulanLahirP;
  late TextEditingController tahunLahirP;
  late TextEditingController nikP;
  late SingleValueDropDownController pendidikanP;
  late TextEditingController pekerjaanP;
  //
  late TextEditingController namaT;
  late TextEditingController namaAyahT;
  late TextEditingController tempatLahirT;
  late TextEditingController tanggalLahirT;
  late SingleValueDropDownController bulanLahirT;
  late TextEditingController tahunLahirT;
  late TextEditingController nikT;
  late SingleValueDropDownController pendidikanT;
  late TextEditingController pekerjaanT;
  late TextEditingController penghasilanTergugat;
  late TextEditingController penghasilanTergugatText;
  //
  late TextEditingController jalanP;
  late TextEditingController rtP;
  late TextEditingController rwP;
  late TextEditingController kelP;
  late SingleValueDropDownController kecP;

  late TextEditingController jalanT;
  late TextEditingController rtT;
  late TextEditingController rwT;
  late TextEditingController kelT;
  late TextEditingController kecT;
  late TextEditingController kabT;
  late TextEditingController propT;
  //
  late TextEditingController tanggalMenikah;
  late SingleValueDropDownController bulanMenikah;
  late TextEditingController tahunMenikah;
  late SingleValueDropDownController dokumenNikah;
  late TextEditingController nomorDokumenNikah;
  late TextEditingController tanggalDokumen;
  late SingleValueDropDownController bulanDokumen;
  late TextEditingController tahunDokumen;
  late TextEditingController kecKUA;
  late TextEditingController kabKUA;
  late TextEditingController propKUA;
  //
  late TextEditingController jalanAwal;
  late TextEditingController rtAwal;
  late TextEditingController rwAwal;
  late TextEditingController kelAwal;
  late TextEditingController kecAwal;
  late TextEditingController kabAwal;
  late TextEditingController propAwal;

  late TextEditingController jalanAkhir;
  late TextEditingController rtAkhir;
  late TextEditingController rwAkhir;
  late TextEditingController kelAkhir;
  late TextEditingController kecAkhir;
  late TextEditingController kabAkhir;
  late TextEditingController propAkhir;

  late TextEditingController tahunAkhir;
  late TextEditingController bulanAkhir;
  //
  //
  late SingleValueDropDownController dataAnakHasilPernikahan;
  late TextEditingController jumlahAnak;
  //
  late TextEditingController namaAnak1;
  late TextEditingController umurAnak1;
  late TextEditingController namaAnak2;
  late TextEditingController umurAnak2;
  late TextEditingController namaAnak3;
  late TextEditingController umurAnak3;
  late TextEditingController namaAnak4;
  late TextEditingController umurAnak4;
  late TextEditingController namaAnak5;
  late TextEditingController umurAnak5;
  late TextEditingController namaAnak6;
  late TextEditingController umurAnak6;
  late TextEditingController namaAnak7;
  late TextEditingController umurAnak7;
  late TextEditingController namaAnak8;
  late TextEditingController umurAnak8;
  late TextEditingController namaAnak9;
  late TextEditingController umurAnak9;
  late TextEditingController namaAnak10;
  late TextEditingController umurAnak10;
  late TextEditingController namaAnak11;
  late TextEditingController umurAnak11;
  late TextEditingController namaAnak12;
  late TextEditingController umurAnak12;
  //
  late TextEditingController tanggalMulaiBertengkar;
  late SingleValueDropDownController bulanMulaiBertengkar;
  late TextEditingController tahunMulaiBertengkar;

  late TextEditingController tanggalAkhirBertengkar;
  late SingleValueDropDownController bulanAkhirBertengkar;
  late TextEditingController tahunAkhirBertengkar;

  late TextEditingController tanggalPuncakBertengkar;
  late SingleValueDropDownController bulanPuncakBertengkar;
  late TextEditingController tahunPuncakBertengkar;

  //
  late SingleValueDropDownController sebabPertengkaran;
  String sebabPertengkaranItem1 = '';
  String tandaItem1 = '';
  String akhirItem1 = '';
  String sebabPertengkaranItem2 = '';
  String tandaItem2 = '';
  String akhirItem2 = '';
  String sebabPertengkaranItem3 = '';
  String tandaItem3 = '';
  String akhirItem3 = '';
  String sebabPertengkaranItem4 = '';
  String tandaItem4 = '';
  String akhirItem4 = '';
  String sebabPertengkaranItem5 = '';
  String tandaItem5 = '';
  String akhirItem5 = '';
  String sebabPertengkaranItem6 = '';
  String tandaItem6 = '';
  String akhirItem6 = '';
  String sebabPertengkaranItem7 = '';
  String tandaItem7 = '';
  String akhirItem7 = '';
  String sebabPertengkaranItem8 = '';
  String tandaItem8 = '';
  String akhirItem8 = '';
  String sebabPertengkaranItem9 = '';
  String tandaItem9 = '';
  String akhirItem9 = '';
  String sebabPertengkaranItem10 = '';
  String tandaItem10 = '';
  String akhirItem10 = '';
  late TextEditingController alasanLainnya1;
  String tandaAlasanLainnya1 = '';
  String akhirAlasanLainnya1 = '';
  late TextEditingController alasanLainnya2;
  String tandaAlasanLainnya2 = '';
  String akhirAlasanLainnya2 = '';
  late TextEditingController alasanLainnya3;
  String tandaAlasanLainnya3 = '';
  String akhirAlasanLainnya3 = '';
  //
  late SingleValueDropDownController akibatPertengkaran;
  String akibatPertengkaranText = '';
  late TextEditingController tahunLamaPisah;
  late TextEditingController bulanLamaPisah;
  //
  late SingleValueDropDownController nafkahIddah;
  late TextEditingController nominalNafkahIddah;

  late SingleValueDropDownController nafkahMadhiyah;
  late TextEditingController nominalNafkahMadhiyah;

  late SingleValueDropDownController pemberianMutah;
  late TextEditingController nominalPemberianMutah;
  late SingleValueDropDownController hakHadhanah;
  late SingleValueDropDownController nafkahMadhiyahAnak;
  late TextEditingController nominalNafkahMadhiyahAnak;
  late SingleValueDropDownController hadhanahNafkahAnak;
  late TextEditingController nominalHadhanahNafkahAnak;
  //
  late TextEditingController tahunLamaTidakNafkah;
  late TextEditingController bulanLamaTidakNafkah;

  //

  late SingleValueDropDownController usahaDamai;
  late SingleValueDropDownController usahaDamai2;
  String usahaDamaiText = '';
  //
  var savedInfo = '';
  var assetDoc = 'assets/ceraigugatbiasa.docx';

  // video

  late VideoPlayerController controllerVideoKonversi;

  FlutterTts ftts = FlutterTts();

  var jarakForm = const EdgeInsets.fromLTRB(8, 8, 8, 0);

  var ukuranForm = const EdgeInsets.fromLTRB(8, 0, 8, 0);

  @override
  void initState() {
    askPermissions();
    super.initState();
    //
    if (bulanSurat == '1') {
      bulanSuratText = 'Januari';
    } else if (bulanSurat == '2') {
      bulanSuratText = 'Februari';
    } else if (bulanSurat == '3') {
      bulanSuratText = 'Maret';
    } else if (bulanSurat == '4') {
      bulanSuratText = 'April';
    } else if (bulanSurat == '5') {
      bulanSuratText = 'Mei';
    } else if (bulanSurat == '6') {
      bulanSuratText = 'Juni';
    } else if (bulanSurat == '7') {
      bulanSuratText = 'Juli';
    } else if (bulanSurat == '8') {
      bulanSuratText = 'Agustus';
    } else if (bulanSurat == '9') {
      bulanSuratText = 'September';
    } else if (bulanSurat == '10') {
      bulanSuratText = 'Oktober';
    } else if (bulanSurat == '11') {
      bulanSuratText = 'November';
    } else if (bulanSurat == '12') {
      bulanSuratText = 'Desember';
    }
    //
    namaP = TextEditingController();
    namaAyahP = TextEditingController();
    tempatLahirP = TextEditingController();
    tanggalLahirP = TextEditingController();
    bulanLahirP = SingleValueDropDownController();
    tahunLahirP = TextEditingController();
    nikP = TextEditingController();
    pendidikanP = SingleValueDropDownController();
    pekerjaanP = TextEditingController();
    //
    namaT = TextEditingController();
    namaAyahT = TextEditingController();
    tempatLahirT = TextEditingController();
    tanggalLahirT = TextEditingController();
    bulanLahirT = SingleValueDropDownController();
    tahunLahirT = TextEditingController();
    nikT = TextEditingController();
    pendidikanT = SingleValueDropDownController();
    pekerjaanT = TextEditingController();
    penghasilanTergugat = TextEditingController();
    penghasilanTergugatText = TextEditingController();
    //
    jalanP = TextEditingController();
    rtP = TextEditingController();
    rwP = TextEditingController();
    kelP = TextEditingController();
    kecP = SingleValueDropDownController();

    jalanT = TextEditingController();
    rtT = TextEditingController();
    rwT = TextEditingController();
    kelT = TextEditingController();
    kecT = TextEditingController();
    kabT = TextEditingController();
    propT = TextEditingController();
    //
    tanggalMenikah = TextEditingController();
    bulanMenikah = SingleValueDropDownController();
    tahunMenikah = TextEditingController();
    dokumenNikah = SingleValueDropDownController();
    nomorDokumenNikah = TextEditingController();
    tanggalDokumen = TextEditingController();
    bulanDokumen = SingleValueDropDownController();
    tahunDokumen = TextEditingController();
    kecKUA = TextEditingController();
    kabKUA = TextEditingController();
    propKUA = TextEditingController();
    //
    jalanAwal = TextEditingController();
    rtAwal = TextEditingController();
    rwAwal = TextEditingController();
    kelAwal = TextEditingController();
    kecAwal = TextEditingController();
    kabAwal = TextEditingController();
    propAwal = TextEditingController();

    jalanAkhir = TextEditingController();
    rtAkhir = TextEditingController();
    rwAkhir = TextEditingController();
    kelAkhir = TextEditingController();
    kecAkhir = TextEditingController();
    kabAkhir = TextEditingController();
    propAkhir = TextEditingController();

    tahunAkhir = TextEditingController();
    bulanAkhir = TextEditingController();
    //
    dataAnakHasilPernikahan = SingleValueDropDownController();
    jumlahAnak = TextEditingController();
    //
    namaAnak1 = TextEditingController();
    umurAnak1 = TextEditingController();
    namaAnak2 = TextEditingController();
    umurAnak2 = TextEditingController();
    namaAnak3 = TextEditingController();
    umurAnak3 = TextEditingController();
    namaAnak4 = TextEditingController();
    umurAnak4 = TextEditingController();
    namaAnak5 = TextEditingController();
    umurAnak5 = TextEditingController();
    namaAnak6 = TextEditingController();
    umurAnak6 = TextEditingController();
    namaAnak7 = TextEditingController();
    umurAnak7 = TextEditingController();
    namaAnak8 = TextEditingController();
    umurAnak8 = TextEditingController();
    namaAnak9 = TextEditingController();
    umurAnak9 = TextEditingController();
    namaAnak10 = TextEditingController();
    umurAnak10 = TextEditingController();
    namaAnak11 = TextEditingController();
    umurAnak11 = TextEditingController();
    namaAnak12 = TextEditingController();
    umurAnak12 = TextEditingController();
    //
    tanggalMulaiBertengkar = TextEditingController();
    bulanMulaiBertengkar = SingleValueDropDownController();
    tahunMulaiBertengkar = TextEditingController();

    tanggalAkhirBertengkar = TextEditingController();
    bulanAkhirBertengkar = SingleValueDropDownController();
    tahunAkhirBertengkar = TextEditingController();

    tanggalPuncakBertengkar = TextEditingController();
    bulanPuncakBertengkar = SingleValueDropDownController();
    tahunPuncakBertengkar = TextEditingController();

    //

    sebabPertengkaran = SingleValueDropDownController();
    alasanLainnya1 = TextEditingController();
    alasanLainnya2 = TextEditingController();
    alasanLainnya3 = TextEditingController();
    //
    akibatPertengkaran = SingleValueDropDownController();
    tahunLamaPisah = TextEditingController();
    bulanLamaPisah = TextEditingController();
//
    nafkahIddah = SingleValueDropDownController();
    nominalNafkahIddah = TextEditingController();

    nafkahMadhiyah = SingleValueDropDownController();
    nominalNafkahMadhiyah = TextEditingController();

    pemberianMutah = SingleValueDropDownController();
    nominalPemberianMutah = TextEditingController();

    hakHadhanah = SingleValueDropDownController();
    nafkahMadhiyahAnak = SingleValueDropDownController();
    nominalNafkahMadhiyahAnak = TextEditingController();
    hadhanahNafkahAnak = SingleValueDropDownController();
    nominalHadhanahNafkahAnak = TextEditingController();

    tahunLamaTidakNafkah = TextEditingController();
    bulanLamaTidakNafkah = TextEditingController();

    //
    usahaDamai = SingleValueDropDownController();
    usahaDamai2 = SingleValueDropDownController();
    //
    loadVideoPlayerKonversi();
  }

  Future<void> askPermissions() async {
    await [
      Permission.storage,
    ].request();
  }

  Future openFile() async {
    try {
      //  await OpenFile.open(savedFileDocx);
      await OpenFile.open(cariFile);
    } catch (e) {
      // error
      // ignore: avoid_print
      print('[ERROR] Failed to open file: $cariFile');
    }
  }

  Future<void> generateDocumentFromAssetTpl() async {
    setState(() {
      loading = true;
    });
    final folderSimpanDocx =
        await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS);

    final namaDocx = "${namaP.text}-IN$tanggalDoc.docx";

    var saveToDocx =
        await File('$folderSimpanDocx/$namaDocx').create(recursive: true);

    final DocxTpl docxTpl = DocxTpl(
      //docxTemplate: 'assets/invite.docx',
      docxTemplate: assetDoc,
      isAssetFile: true,
    );

    var r = await docxTpl.parseDocxTpl();
    // ignore: avoid_print
    print(r.mergeStatus == MergeResponseStatus.Success);
    // ignore: avoid_print
    print(r.message);

    var fields = docxTpl.getMergeFields();

    // ignore: avoid_print
    print('[INFO] asset template file fields found: ');
    // ignore: avoid_print
    print(fields);

    await docxTpl.writeMergeFields(data: {
      'kab': 'Nunukan',
      'tgl_surat': '$tanggalSurat $bulanSuratText $tahunSurat',
      'satker': 'Pengadilan Agama Nunukan',
      //
      'nama_p': namaP.text,
      'nama_ayah_p': namaAyahP.text,
      'tempat_lahir_p': tempatLahirP.text,
      'tgl_lahir_p': 'tanggal Lahir P',
      //  ('${tanggalLahirP.text} ${bulanLahirP.dropDownValue!.value} ${tahunLahirP.text}'),
      'nik_p': nikP.text,
      'pendidikan_p': 'Pendidikan P',
      //  pendidikanP.dropDownValue!.value,
      'pekerjaan_p': pekerjaanP.text,
      //
      'jalan_p': jalanP.text,
      'rt_p': rtP.text,
      'rw_p': rwP.text,
      'kel_p': kelP.text,
      'kec_p': 'kecamatan',
      // kecP.dropDownValue!.value,
      'kab_p': 'Nunukan',
      'prop_p': 'Kalimantan Utara',
      //
      'nama_t': namaT.text,
      'nama_ayah_t': namaAyahT.text,
      'tempat_lahir_t': tempatLahirT.text,
      'tgl_lahir_t': 'tanggal lahir T',
      //  ('${tanggalLahirT.text} ${bulanLahirT.dropDownValue!.value} ${tahunLahirT.text}'),
      'nik_t': nikT.text,
      'pendidikan_t': 'pendidikan T',
      //   pendidikanT.dropDownValue!.value,
      'pekerjaan_t': pekerjaanT.text,

      'jalan_t': jalanT.text,
      'rt_t': rtT.text,
      'rw_t': rwT.text,
      'kel_t': kelT.text,
      'kec_t': 'kecamatan',
      //  kecT.text,
      'kab_t': 'Nunukan',
      'prop_t': 'Kalimantan Utara',
      //
      'tgl_menikah': 'tanggal menikah',
      //   ('${tanggalMenikah.text} ${bulanMenikah.dropDownValue!.value} ${tahunMenikah.text}'),
      'dokumen_nikah': 'dokumen Nikah',
      //dokumenNikah.dropDownValue!.value,
      'nomor_dokumen_nikah': nomorDokumenNikah.text,
      'tanggal_dokumen_nikah': 'tanggal dokumen nikah',
      /* ('${tanggalDokumen.text} ${bulanDokumen.dropDownValue!.value} ${tahunDokumen.text}'), */
      'kec_kua': kecKUA.text,
      'kab_kua': kabKUA.text,
      'prop_kua': propKUA.text,
      //
      'alamat_tinggal_awal':
          ('${jalanAwal.text} ${rtAwal.text} ${rwAwal.text} ${kelAwal.text} ${kabAwal.text} ${propAwal.text}'),
      'alamat_tinggal_akhir':
          ('${jalanAkhir.text} ${rtAkhir.text} ${rwAkhir.text} ${kelAkhir.text} ${kabAkhir.text} ${propAkhir.text}'),
      'lamanya_bersama': ('${tahunAkhir.text} tahun ${bulanAkhir.text} bulan'),
//
      'dikaruniai_anak': 'data anak',
      // dataAnakHasilPernikahan.dropDownValue!.value,
      'data_anak':
          ('$nomorAnak1text${namaAnak1.text}$komaAnak1text $umurAnak1text ${umurAnak1.text} $tahunAnak1text$komaAnak1text $barisBaruAnak2text$nomorAnak2text${namaAnak2.text}$komaAnak2text $umurAnak2text ${umurAnak2.text} $tahunAnak2text$komaAnak2text $barisBaruAnak3text$nomorAnak3text${namaAnak3.text}$komaAnak3text $umurAnak3text ${umurAnak3.text} $tahunAnak3text$komaAnak3text $barisBaruAnak4text$nomorAnak4text${namaAnak4.text}$komaAnak4text $umurAnak4text ${umurAnak4.text} $tahunAnak4text$komaAnak4text $barisBaruAnak5text$nomorAnak5text${namaAnak5.text}$komaAnak5text $umurAnak5text ${umurAnak5.text} $tahunAnak5text$komaAnak5text $barisBaruAnak6text$nomorAnak6text${namaAnak6.text}$komaAnak6text $umurAnak6text ${umurAnak6.text} $tahunAnak6text$komaAnak6text $barisBaruAnak7text$nomorAnak7text${namaAnak7.text}$komaAnak7text $umurAnak7text ${umurAnak7.text} $tahunAnak7text$komaAnak7text $barisBaruAnak8text$nomorAnak8text${namaAnak8.text}$komaAnak8text $umurAnak8text ${umurAnak8.text} $tahunAnak8text$komaAnak8text $barisBaruAnak9text$nomorAnak9text${namaAnak9.text}$komaAnak9text $umurAnak9text ${umurAnak9.text} $tahunAnak9text$komaAnak9text $barisBaruAnak10text$nomorAnak10text${namaAnak10.text}$komaAnak10text $umurAnak10text ${umurAnak10.text} $tahunAnak10text$komaAnak10text $barisBaruAnak11text$nomorAnak11text${namaAnak11.text}$komaAnak11text $umurAnak11text ${umurAnak11.text} $tahunAnak11text$komaAnak11text $barisBaruAnak12text$nomorAnak12text${namaAnak12.text}$komaAnak12text $umurAnak12text ${umurAnak12.text} $tahunAnak12text$komaAnak12text'),
      'jumlah_anak': jumlahAnak.text,
      'orang_anak': ('$orangAnaktext:'),
      //
      'mulai_bertengkar': 'mulai bertengkar',
      /*('${tanggalMulaiBertengkar.text} ${bulanMulaiBertengkar.dropDownValue!.value} ${tahunMulaiBertengkar.text} '), */
      'akhir_bertengkar': 'akhir bertengkar',
      /*('${tanggalAkhirBertengkar.text} ${bulanAkhirBertengkar.dropDownValue!.value} ${tahunAkhirBertengkar.text} '), */
      'puncak_bertengkar': 'puncak bertengkar',
      /*('${tanggalPuncakBertengkar.text} ${bulanPuncakBertengkar.dropDownValue!.value} ${tahunPuncakBertengkar.text} '), */
      //
      'sebab_pertengkaran':
          ('$tandaItem1$sebabPertengkaranItem1$akhirItem1$tandaItem2$sebabPertengkaranItem2$akhirItem2$tandaItem3$sebabPertengkaranItem3$akhirItem3$tandaItem4$sebabPertengkaranItem4$akhirItem4$tandaItem5$sebabPertengkaranItem5$akhirItem5$tandaItem6$sebabPertengkaranItem6$akhirItem6$tandaItem7$sebabPertengkaranItem7$akhirItem7$tandaItem8$sebabPertengkaranItem8$akhirItem8$tandaItem9$sebabPertengkaranItem9$akhirItem9$tandaItem10$sebabPertengkaranItem10$akhirItem10$tandaAlasanLainnya1$visibleSebabPertengkaranLainnya1$akhirAlasanLainnya1$tandaAlasanLainnya2$visibleSebabPertengkaranLainnya2$akhirAlasanLainnya2$tandaAlasanLainnya3$visibleSebabPertengkaranLainnya3$akhirAlasanLainnya3 '),
      'akibat_pertengkaran': ('$akibatPertengkaranText '),
      'lama_pisah':
          ('${tahunLamaPisah.text} tahun ${bulanLamaPisah.text} bulan'),
      'lama_tidak_diberi_nafkah':
          ('${tahunLamaTidakNafkah.text} tahun ${bulanLamaTidakNafkah.text} bulan'),
      'data_damai': usahaDamaiText,
    });

    var savedAssetDocx = await docxTpl.save(saveToDocx.path);

    // ignore: avoid_print
    // print('[INFO] Generated document [asset] saved to: $savedAssetDocx');

    setState(() {
      mergeFields = fields;
      loading = false;
      savedFileDocx = savedAssetDocx;
      savedInfo =
          ('Data tersimpan.\nFolder: "Download"\nNama File:\n"$namaDocx"');
      cariFile = folderSimpanDocx;
    });
  }

  GlobalKey<FormState> keyDataPemohon = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataTergugat = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataAlamatP = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataAlamatT = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataPernikahan = GlobalKey<FormState>();
  GlobalKey<FormState> keyRiwayatTinggal = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataAnak = GlobalKey<FormState>();
  GlobalKey<FormState> keyWaktuPertengkaran = GlobalKey<FormState>();
  GlobalKey<FormState> keyPuncakPertengkaran = GlobalKey<FormState>();
  GlobalKey<FormState> keySebabPertengkaran = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataPisah = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataNafkah = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataTidakDiberiNafkah = GlobalKey<FormState>();
  GlobalKey<FormState> keyDataPerdamaian = GlobalKey<FormState>();

  loadVideoPlayerKonversi() {
    controllerVideoKonversi =
        VideoPlayerController.asset('assets/video/konversi_file.mp4');
    controllerVideoKonversi.addListener(() {
      setState(() {});
    });
    controllerVideoKonversi.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Image.asset('assets/image/logo_sippasti.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Form Cerai Gugat'),
            Text(
              'Pengadilan Agama Nunukan',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        actions: [
          Image.asset(
            'assets/image/logo_sippasti.png',
          ),
        ],
        // centerTitle: true,
      ),
      body: ListView(
        children: [
          // Data Penggugat
          Visibility(
            visible: visibleFormP,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Penggugat'),
                ),
                Form(
                  key: keyDataPemohon,
                  child: Column(
                    children: [
                      Padding(
                        padding: jarakForm,
                        child: TextFormField(
                          controller: namaP,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            contentPadding: ukuranForm,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: jarakForm,
                        child: TextFormField(
                          controller: namaAyahP,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Nama Ayah',
                            contentPadding: ukuranForm,
                            border: const OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: jarakForm,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: tempatLahirP,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: 'Tempat Lahir',
                                  contentPadding: ukuranForm,
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalLahirP,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  labelText: 'Tanggal',
                                  contentPadding: ukuranForm,
                                  border: const OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Silahkan isi tanggal';
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1955),
                                    lastDate: DateTime(2024),
                                  );
                                  if (date != null) {
                                    String? month;
                                    if (date.month == 1) {
                                      month = "Januari";
                                    } else if (date.month == 2) {
                                      month = "Februari";
                                    } else if (date.month == 3) {
                                      month = "Maret";
                                    } else if (date.month == 4) {
                                      month = "April";
                                    } else if (date.month == 5) {
                                      month = "Mei";
                                    } else if (date.month == 6) {
                                      month = "Juni";
                                    } else if (date.month == 7) {
                                      month = "Juli";
                                    } else if (date.month == 8) {
                                      month = "Agustus";
                                    } else if (date.month == 9) {
                                      month = "September";
                                    } else if (date.month == 10) {
                                      month = "Oktober";
                                    } else if (date.month == 11) {
                                      month = "November";
                                    } else if (date.month == 12) {
                                      month = "Desember";
                                    }
                                    tanggalLahirP.text =
                                        "${date.day} $month ${date.year}";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: jarakForm,
                        child: TextFormField(
                          controller: nikP,
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                          decoration: InputDecoration(
                            labelText: 'NIK',
                            contentPadding: ukuranForm,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: jarakForm,
                        child: DropDownTextField(
                          textFieldDecoration: InputDecoration(
                            labelText: 'Pendidikan',
                            contentPadding: ukuranForm,
                            border: const OutlineInputBorder(),
                          ),
                          singleController: pendidikanP,
                          clearOption: false,
                          enableSearch: false,
                          dropDownItemCount: 3,
                          dropDownList: _pendidikan,
                          onChanged: (val) {},
                        ),
                      ),
                      Padding(
                        padding: jarakForm,
                        child: TextFormField(
                          controller: pekerjaanP,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Pekerjaan',
                            contentPadding: ukuranForm,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: jarakForm,
                        child: TextFormField(
                          controller: pekerjaanP,
                          keyboardType: TextInputType.emailAddress,
                          // textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            contentPadding: ukuranForm,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Beranda()),
                                );
                              },
                              child: const Text('Kembali'))),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataPemohon,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Alamat Penggugat
          Visibility(
            visible: visibleFormAlamatP,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Alamat Penggugat'),
                ),
                Form(
                  key: keyDataAlamatP,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: jalanP,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Jalan',
                            hintText: 'contoh: Bukit Raya No.5',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rtP,
                                //  maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RT',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //    .maxLength(3)
                                //    .build(),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rwP,
                                // maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RW',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(3)
                                //   .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kelP,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Desa/Kelurahan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropDownTextField(
                          textFieldDecoration: const InputDecoration(
                            labelText: 'Kecamatan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                          singleController: kecP,
                          clearOption: false,
                          enableSearch: false,
                          dropDownItemCount: 5,
                          dropDownList: _kecamatan,
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormAlamatP = false;
                              visibleFormP = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataAlamatP,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Tergugat
          Visibility(
            visible: visibleFormT,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Tergugat'),
                ),
                Form(
                  key: keyDataTergugat,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: namaT,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Nama',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: namaAyahT,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Nama Ayah',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: tempatLahirT,
                                textCapitalization: TextCapitalization.words,
                                decoration: const InputDecoration(
                                  labelText: 'Tempat Lahir',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder().minLength(2).build(),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalLahirT,
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Silahkan isi tanggal';
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                  );
                                  if (date != null) {
                                    tanggalLahirT.text =
                                        '${date.day}-${date.month}-${date.year}';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalLahirT,
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Silahkan isi tanggal';
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                  );
                                  if (date != null) {
                                    tanggalLahirT.text =
                                        '${date.day}-${date.month}-${date.year}';
                                  }
                                },
                              ),
                            ),
                            /*  Expanded(
                              flex: 2,
                              child: DropDownTextField(
                                textFieldDecoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator:
                                //    ValidationBuilder().minLength(2).build(),
                                singleController: bulanLahirT,
                                clearOption: false,
                                enableSearch: false,
                                dropDownItemCount: 3,
                                dropDownList: _bulan,
                                onChanged: (val) {},
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunLahirT,
                                keyboardType: TextInputType.datetime,
                                //  maxLength: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(4)
                                //  .maxLength(4)
                                //  .build(),
                              ),
                            ),
                        */
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nikT,
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                          decoration: const InputDecoration(
                            labelText: 'NIK',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(16).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropDownTextField(
                          textFieldDecoration: const InputDecoration(
                            labelText: 'Pendidikan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                          singleController: pendidikanT,
                          clearOption: false,
                          enableSearch: false,
                          dropDownItemCount: 3,
                          dropDownList: _pendidikan,
                          onChanged: (val) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: pekerjaanT,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Pekerjaan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: penghasilanTergugat,
                    inputFormatters: [
                      CurrencyTextInputFormatter(locale: 'id', symbol: 'Rp.')
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Rata-rata penghasilan per bulan',
                      hintText: 'contoh: Rp.3.500.000,00',
                      border: OutlineInputBorder(),
                    ),
                    validator: ValidationBuilder().minLength(2).build(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: penghasilanTergugatText,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Rata-rata penghasilan (dalam text)',
                      hintText: 'contoh: tiga juta lima ratus ribu',
                      border: OutlineInputBorder(),
                    ),
                    validator: ValidationBuilder().minLength(2).build(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormT = false;
                              visibleFormAlamatP = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataTergugat,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Alamat Tergugat
          /*  Visibility(
            visible: visibleFormAlamatT,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Alamat Tergugat'),
                ),
                Form(
                  key: keyDataAlamatT,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: jalanT,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Jalan',
                            hintText: 'contoh: Bukit Raya No.5',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rtT,
                                //  maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RT',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //    .maxLength(3)
                                //    .build(),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rwT,
                                // maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RW',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(3)
                                //   .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kelT,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Desa/Kelurahan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kecT,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Kecamatan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kabT,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Kabupaten',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: propT,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Propinsi',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormAlamatT = false;
                              visibleFormT = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataAlamatT,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Pernikahan
          Visibility(
            visible: visibleFormPernikahan,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Pernikahan'),
                ),
                const Text('Tanggal menikah'),
                Form(
                  key: keyDataPernikahan,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalMenikah,
                                keyboardType: TextInputType.datetime,
                                // maxLength: 2,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(2)
                                //   .build(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DropDownTextField(
                                textFieldDecoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator:
                                //    ValidationBuilder().minLength(1).build(),
                                singleController: bulanMenikah,
                                clearOption: false,
                                enableSearch: false,
                                dropDownItemCount: 5,
                                dropDownList: _bulan,
                                onChanged: (val) {},
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunMenikah,
                                keyboardType: TextInputType.datetime,
                                //  maxLength: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(4)
                                //    .maxLength(4)
                                //    .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text('Data Dokumen'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 4),
                              child: Text(
                                'Kutipan Akta Nikah adalah Buku Nikah yang dikeluarkan oleh Kantor Urusan Agama.\n\nDuplikat Akta Nikah adalah Kutipan Akta Nikah yang diterbitkan oleh Kantor Urusan Agama karena sebab Buku Nikah telah hilang atau tidak diketahui keberadaannya',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            DropDownTextField(
                              textFieldDecoration: const InputDecoration(
                                labelText: 'Berdasarkan dokumen',
                                hintText: "Pilih satu dari kategori berikut!",
                                //  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                border: OutlineInputBorder(),
                              ),
                              //   validator: ValidationBuilder().minLength(4).build(),
                              singleController: dokumenNikah,
                              clearOption: false,
                              enableSearch: false,
                              dropDownItemCount: 3,
                              dropDownList: _dokumenNikah,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nomorDokumenNikah,
                          textCapitalization: TextCapitalization.characters,
                          decoration: const InputDecoration(
                            labelText: 'Nomor Dokumen',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(4).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalDokumen,
                                keyboardType: TextInputType.datetime,
                                // maxLength: 2,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(2)
                                //   .build(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DropDownTextField(
                                textFieldDecoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator:
                                //    ValidationBuilder().minLength(1).build(),
                                singleController: bulanDokumen,
                                clearOption: false,
                                enableSearch: false,
                                dropDownItemCount: 5,
                                dropDownList: _bulan,
                                onChanged: (val) {},
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunDokumen,
                                keyboardType: TextInputType.datetime,
                                //  maxLength: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(4)
                                //    .maxLength(4)
                                //    .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kecKUA,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Kecamatan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(4).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kabKUA,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Kabupaten',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(4).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: propKUA,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Propinsi',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(4).build(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormPernikahan = false;
                              visibleFormAlamatT = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataPernikahan,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Riwayat Tinggal Bersama
          Visibility(
            visible: visibleFormAlamatBersama,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Riwayat Tinggal Bersama'),
                ),
                Form(
                  key: keyRiwayatTinggal,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                            'Dimanakah alamat anda dan suami bertempat tinggal setelah akad nikah/resepsi pernikahan selesai dilaksanakan?'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: jalanAwal,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Jalan',
                            hintText: 'contoh: Bukit Raya No.5',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rtAwal,
                                //  maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RT',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //    .maxLength(3)
                                //    .build(),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rwAwal,
                                // maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RW',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(3)
                                //   .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kelAwal,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Desa/Kelurahan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kecAwal,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Kecamatan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kabAwal,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Kabupaten',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: propAwal,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Propinsi',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      //
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                            '\nDimanakah alamat anda dan suami terakhir bertempat tinggal bersama?'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: jalanAkhir,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Jalan',
                            hintText: 'contoh: Bukit Raya No.5',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rtAkhir,
                                //  maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RT',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //    .maxLength(3)
                                //    .build(),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: rwAkhir,
                                // maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'RW',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(3)
                                //   .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kelAkhir,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Desa/Kelurahan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kecAkhir,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Kecamatan',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: kabAkhir,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Kabupaten',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: propAkhir,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            labelText: 'Propinsi',
                            border: OutlineInputBorder(),
                          ),
                          //   validator: ValidationBuilder().minLength(2).build(),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                            'Di alamat ini, berapa lama anda tinggal bersama suami?'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunAkhir,
                                //  maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //    .maxLength(3)
                                //    .build(),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: bulanAkhir,
                                // maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(3)
                                //   .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormAlamatBersama = false;
                              visibleFormPernikahan = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateLamaBersama,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Anak
          Visibility(
            visible: visibleFormAnak,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Anak'),
                ),
                Form(
                  key: keyDataAnak,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropDownTextField(
                                textFieldDecoration: const InputDecoration(
                                  labelText: 'Data anak',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator:
                                //    ValidationBuilder().minLength(1).build(),
                                singleController: dataAnakHasilPernikahan,
                                clearOption: false,
                                enableSearch: false,
                                dropDownItemCount: 2,
                                dropDownList: _dataAnakHasilPernikahan,
                                onChanged: (val) {
                                  setState(() {
                                    if (dataAnakHasilPernikahan
                                            .dropDownValue!.name ==
                                        "Sudah ada anak") {
                                      visibleJumlahAnak = true;
                                      orangAnaktext = 'orang';
                                    }
                                    if (dataAnakHasilPernikahan
                                            .dropDownValue!.name ==
                                        "Belum ada anak") {
                                      jumlahAnak.text = '';
                                      visibleJumlahAnak = false;
                                      visibleDataAnak1 = false;
                                      visibleDataAnak2 = false;
                                      visibleDataAnak3 = false;
                                      visibleDataAnak4 = false;
                                      visibleDataAnak5 = false;
                                      visibleDataAnak6 = false;
                                      visibleDataAnak7 = false;
                                      visibleDataAnak8 = false;
                                      visibleDataAnak9 = false;
                                      visibleDataAnak10 = false;
                                      visibleDataAnak11 = false;
                                      visibleDataAnak12 = false;
                                    }
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Visibility(
                              visible: visibleJumlahAnak,
                              child: Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: jumlahAnak,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Jumlah Anak',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      if (jumlahAnak.text == '1') {
                                        visibleDataAnak1 = true;
                                      } else {
                                        visibleDataAnak1 = false;
                                      }
                                      if (jumlahAnak.text == '2') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                      } else {
                                        visibleDataAnak2 = false;
                                      }
                                      if (jumlahAnak.text == '3') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                      } else {
                                        visibleDataAnak3 = false;
                                      }
                                      if (jumlahAnak.text == '4') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                      } else {
                                        visibleDataAnak4 = false;
                                      }
                                      if (jumlahAnak.text == '5') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                      } else {
                                        visibleDataAnak5 = false;
                                      }
                                      if (jumlahAnak.text == '6') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                        visibleDataAnak6 = true;
                                      } else {
                                        visibleDataAnak6 = false;
                                      }
                                      if (jumlahAnak.text == '7') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                        visibleDataAnak6 = true;
                                        visibleDataAnak7 = true;
                                      } else {
                                        visibleDataAnak7 = false;
                                      }
                                      if (jumlahAnak.text == '8') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                        visibleDataAnak6 = true;
                                        visibleDataAnak7 = true;
                                        visibleDataAnak8 = true;
                                      } else {
                                        visibleDataAnak8 = false;
                                      }
                                      if (jumlahAnak.text == '9') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                        visibleDataAnak6 = true;
                                        visibleDataAnak7 = true;
                                        visibleDataAnak8 = true;
                                        visibleDataAnak9 = true;
                                      } else {
                                        visibleDataAnak9 = false;
                                      }
                                      if (jumlahAnak.text == '10') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                        visibleDataAnak6 = true;
                                        visibleDataAnak7 = true;
                                        visibleDataAnak8 = true;
                                        visibleDataAnak9 = true;
                                        visibleDataAnak10 = true;
                                      } else {
                                        visibleDataAnak10 = false;
                                      }
                                      if (jumlahAnak.text == '11') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                        visibleDataAnak6 = true;
                                        visibleDataAnak7 = true;
                                        visibleDataAnak8 = true;
                                        visibleDataAnak9 = true;
                                        visibleDataAnak10 = true;
                                        visibleDataAnak11 = true;
                                      } else {
                                        visibleDataAnak11 = false;
                                      }
                                      if (jumlahAnak.text == '12') {
                                        visibleDataAnak1 = true;
                                        visibleDataAnak2 = true;
                                        visibleDataAnak3 = true;
                                        visibleDataAnak4 = true;
                                        visibleDataAnak5 = true;
                                        visibleDataAnak6 = true;
                                        visibleDataAnak7 = true;
                                        visibleDataAnak8 = true;
                                        visibleDataAnak9 = true;
                                        visibleDataAnak10 = true;
                                        visibleDataAnak11 = true;
                                        visibleDataAnak12 = true;
                                      } else {
                                        visibleDataAnak12 = false;
                                      }
                                      if (jumlahAnak.text == '') {
                                        visibleDataAnak1 = false;
                                        visibleDataAnak2 = false;
                                        visibleDataAnak3 = false;
                                        visibleDataAnak4 = false;
                                        visibleDataAnak5 = false;
                                        visibleDataAnak6 = false;
                                        visibleDataAnak7 = false;
                                        visibleDataAnak8 = false;
                                        visibleDataAnak9 = false;
                                        visibleDataAnak10 = false;
                                        visibleDataAnak11 = false;
                                        visibleDataAnak12 = false;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak1,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak1,
                                    onChanged: (val) {
                                      setState(() {
                                        nomorAnak1text = "1. ";
                                        komaAnak1text = ',';
                                        umurAnak1text = 'umur';
                                        tahunAnak1text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak2,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 2',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak2,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak2text = '\n';
                                        nomorAnak2text = '2. ';
                                        komaAnak2text = ', ';
                                        umurAnak2text = 'umur';
                                        tahunAnak2text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak3,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 3',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak3,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak3text = '\n';
                                        nomorAnak3text = '3. ';
                                        komaAnak3text = ', ';
                                        umurAnak3text = 'umur';
                                        tahunAnak3text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak4,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 4',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak4,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak4text = '\n';
                                        nomorAnak4text = '4. ';
                                        komaAnak4text = ', ';
                                        umurAnak4text = 'umur';
                                        tahunAnak4text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak5,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 5',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak5,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak5text = '\n';
                                        nomorAnak5text = '5. ';
                                        komaAnak5text = ', ';
                                        umurAnak5text = 'umur';
                                        tahunAnak5text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak6,
                                  onChanged: (val) {},
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 6',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak6,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak6text = '\n';
                                        nomorAnak6text = '6. ';
                                        komaAnak6text = ', ';
                                        umurAnak6text = 'umur';
                                        tahunAnak6text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak7,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak7,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 7',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak7,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak7text = '\n';
                                        nomorAnak7text = '7. ';
                                        komaAnak7text = ', ';
                                        umurAnak7text = 'umur';
                                        tahunAnak7text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak8,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 8',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak8,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak8text = '\n';
                                        nomorAnak8text = '8. ';
                                        komaAnak8text = ', ';
                                        umurAnak8text = 'umur';
                                        tahunAnak8text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak9,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 9',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak9,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak9text = '\n';
                                        nomorAnak9text = '9. ';
                                        komaAnak9text = ', ';
                                        umurAnak9text = 'umur';
                                        tahunAnak9text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak10,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 10',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak10,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak10text = '\n';
                                        nomorAnak10text = '10.';
                                        komaAnak10text = ', ';
                                        umurAnak10text = 'umur';
                                        tahunAnak10text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak11,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak11,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 11',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak11,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak11text = '\n';
                                        nomorAnak11text = '11.';
                                        komaAnak11text = ', ';
                                        umurAnak11text = 'umur';
                                        tahunAnak11text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibleDataAnak12,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextField(
                                  controller: namaAnak12,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama anak ke 12',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.yellow.withOpacity(0.1),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: umurAnak12,
                                    onChanged: (val) {
                                      setState(() {
                                        barisBaruAnak12text = '\n';
                                        nomorAnak12text = '12.';
                                        komaAnak12text = ', ';
                                        umurAnak12text = 'umur';
                                        tahunAnak12text = 'tahun';
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      hintText: 'tahun',
                                      border: OutlineInputBorder(),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormAnak = false;
                              visibleFormAlamatBersama = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataAnak,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Waktu Pertengkaran
          Visibility(
            visible: visibleFormWaktuPertengkaran,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Waktu Pertengkaran'),
                ),
                Form(
                  key: keyWaktuPertengkaran,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text('Kapan anda dan suami mulai bertengkar?'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalMulaiBertengkar,
                                keyboardType: TextInputType.datetime,
                                //   maxLength: 2,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //   .maxLength(2)
                                //   .build(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DropDownTextField(
                                textFieldDecoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator:
                                //    ValidationBuilder().minLength(2).build(),
                                singleController: bulanMulaiBertengkar,
                                clearOption: false,
                                enableSearch: false,
                                dropDownItemCount: 3,
                                dropDownList: _bulan,
                                onChanged: (val) {},
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunMulaiBertengkar,
                                keyboardType: TextInputType.datetime,
                                //  maxLength: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(4)
                                //    .maxLength(4)
                                //    .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text('Kapan terakhir bertengkar?'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalAkhirBertengkar,
                                keyboardType: TextInputType.datetime,
                                //   maxLength: 2,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //   .maxLength(2)
                                //   .build(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DropDownTextField(
                                textFieldDecoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator:
                                //    ValidationBuilder().minLength(2).build(),
                                singleController: bulanAkhirBertengkar,
                                clearOption: false,
                                enableSearch: false,
                                dropDownItemCount: 3,
                                dropDownList: _bulan,
                                onChanged: (val) {},
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunAkhirBertengkar,
                                keyboardType: TextInputType.datetime,
                                //  maxLength: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(4)
                                //    .maxLength(4)
                                //    .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormWaktuPertengkaran = false;
                              visibleFormAnak = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateWaktuPertengkaran,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Data Puncak Pertengkaran
          Visibility(
            visible: visibleFormPuncakPertengkaran,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Puncak Pertengkaran'),
                ),
                Form(
                  key: keyPuncakPertengkaran,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                            'Kapan anda dan suami berselisih dan bertengkar sehingga memutuskan untuk bercerai?'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tanggalPuncakBertengkar,
                                keyboardType: TextInputType.datetime,
                                //   maxLength: 2,
                                decoration: const InputDecoration(
                                  labelText: 'Tanggal',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //   .maxLength(2)
                                //   .build(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DropDownTextField(
                                textFieldDecoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator:
                                //    ValidationBuilder().minLength(2).build(),
                                singleController: bulanPuncakBertengkar,
                                clearOption: false,
                                enableSearch: false,
                                dropDownItemCount: 3,
                                dropDownList: _bulan,
                                onChanged: (val) {},
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunPuncakBertengkar,
                                keyboardType: TextInputType.datetime,
                                //  maxLength: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(4)
                                //    .maxLength(4)
                                //    .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormPuncakPertengkaran = false;
                              visibleFormWaktuPertengkaran = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validatePuncakPertengkaran,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Data Penyebab Pertengkaran
          Visibility(
            visible: visibleFormSebabPertengkaran,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Sebab Pertengkaran'),
                ),
                Form(
                  key: keySebabPertengkaran,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropDownTextField(
                          textFieldDecoration: const InputDecoration(
                            labelText: 'Sebab-sebab terjadinya pertengkaran',
                            hintText: "*dapat memilih lebih dari 1 sebab",
                            border: OutlineInputBorder(),
                          ),
                          singleController: sebabPertengkaran,
                          clearOption: false,
                          enableSearch: true,
                          dropDownItemCount: 8,
                          dropDownList: _sebabPertengkaran,
                          onChanged: (val) {
                            // alasan lainnya 1
                            if (sebabPertengkaran.dropDownValue!.name ==
                                    'alasan lainnya' &&
                                alasanLainnya1.text == '') {
                              setState(() {
                                visibleSebabPertengkaranLainnya1 = true;
                                tandaAlasanLainnya1 = '- ';
                                akhirAlasanLainnya1 = ';\n';
                              });
                            }
                            // alasan lainnya 2
                            else if (sebabPertengkaran.dropDownValue!.name ==
                                    'alasan lainnya' &&
                                alasanLainnya1.text != '' &&
                                alasanLainnya2.text == '') {
                              setState(() {
                                visibleSebabPertengkaranLainnya2 = true;
                                tandaAlasanLainnya2 = '- ';
                                akhirAlasanLainnya2 = ';\n';
                              });
                            }
                            // alasan lainnya 3
                            else if (sebabPertengkaran.dropDownValue!.name ==
                                    'alasan lainnya' &&
                                alasanLainnya1.text != '' &&
                                alasanLainnya2.text != '' &&
                                alasanLainnya3.text == '') {
                              setState(() {
                                visibleSebabPertengkaranLainnya3 = true;
                                tandaAlasanLainnya3 = '- ';
                                akhirAlasanLainnya3 = ';\n';
                              });
                            }
                            // alasan 1
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 == '') {
                              setState(() {
                                sebabPertengkaranItem1 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem1 = true;
                                tandaItem1 = '- ';
                                akhirItem1 = ';\n';
                              });
                            }
                            // alasan 2
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 == '') {
                              setState(() {
                                sebabPertengkaranItem2 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem2 = true;
                                tandaItem2 = '- ';
                                akhirItem2 = ';\n';
                              });
                            }
                            // alasan 3
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 == '') {
                              setState(() {
                                sebabPertengkaranItem3 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem3 = true;
                                tandaItem3 = '- ';
                                akhirItem3 = ';\n';
                              });
                            }
                            // alasan 4
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 != '' &&
                                sebabPertengkaranItem4 == '') {
                              setState(() {
                                sebabPertengkaranItem4 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem4 = true;
                                tandaItem4 = '- ';
                                akhirItem4 = ';\n';
                              });
                            }
                            //alasan 5
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 != '' &&
                                sebabPertengkaranItem4 != '' &&
                                sebabPertengkaranItem5 == '') {
                              setState(() {
                                sebabPertengkaranItem5 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem5 = true;
                                tandaItem5 = '- ';
                                akhirItem5 = ';\n';
                              });
                            }
                            //alasan 6
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 != '' &&
                                sebabPertengkaranItem4 != '' &&
                                sebabPertengkaranItem5 != '' &&
                                sebabPertengkaranItem6 == '') {
                              setState(() {
                                sebabPertengkaranItem6 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem6 = true;
                                tandaItem6 = '- ';
                                akhirItem6 = ';\n';
                              });
                            }
                            // alasan 7
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 != '' &&
                                sebabPertengkaranItem4 != '' &&
                                sebabPertengkaranItem5 != '' &&
                                sebabPertengkaranItem6 != '' &&
                                sebabPertengkaranItem7 == '') {
                              setState(() {
                                sebabPertengkaranItem7 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem7 = true;
                                tandaItem7 = '- ';
                                akhirItem7 = ';\n';
                              });
                            }
                            // alasan 8
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 != '' &&
                                sebabPertengkaranItem4 != '' &&
                                sebabPertengkaranItem5 != '' &&
                                sebabPertengkaranItem6 != '' &&
                                sebabPertengkaranItem7 != '' &&
                                sebabPertengkaranItem8 == '') {
                              setState(() {
                                sebabPertengkaranItem8 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem8 = true;
                                tandaItem8 = '- ';
                                akhirItem8 = ';\n';
                              });
                            }
                            //alasan 9
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 != '' &&
                                sebabPertengkaranItem4 != '' &&
                                sebabPertengkaranItem5 != '' &&
                                sebabPertengkaranItem6 != '' &&
                                sebabPertengkaranItem7 != '' &&
                                sebabPertengkaranItem8 != '' &&
                                sebabPertengkaranItem9 == '') {
                              setState(() {
                                sebabPertengkaranItem9 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem9 = true;
                                tandaItem9 = '- ';
                                akhirItem9 = ';\n';
                              });
                            }
                            // alasan 10
                            else if (sebabPertengkaran.dropDownValue!.name !=
                                    '' &&
                                sebabPertengkaranItem1 != '' &&
                                sebabPertengkaranItem2 != '' &&
                                sebabPertengkaranItem3 != '' &&
                                sebabPertengkaranItem4 != '' &&
                                sebabPertengkaranItem5 != '' &&
                                sebabPertengkaranItem6 != '' &&
                                sebabPertengkaranItem7 != '' &&
                                sebabPertengkaranItem8 != '' &&
                                sebabPertengkaranItem9 != '' &&
                                sebabPertengkaranItem10 == '') {
                              setState(() {
                                sebabPertengkaranItem10 =
                                    sebabPertengkaran.dropDownValue!.value;
                                visibleSebabPertengkaranItem10 = true;
                                tandaItem10 = '- ';
                                akhirItem10 = ';\n';
                              });
                            }
                            // alasan lainnya
                          },
                          //   validator: ValidationBuilder().minLength(1).build(),
                        ),
                      ),
                      // item sebab pertengkaran
                      // item 1
                      Visibility(
                        visible: visibleSebabPertengkaranItem1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem1)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem1 = '';
                                      visibleSebabPertengkaranItem1 = false;
                                      tandaItem1 = '';
                                      akhirItem1 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 2
                      Visibility(
                        visible: visibleSebabPertengkaranItem2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem2)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem2 = '';
                                      visibleSebabPertengkaranItem2 = false;
                                      tandaItem2 = '';
                                      akhirItem2 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 3
                      Visibility(
                        visible: visibleSebabPertengkaranItem3,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem3)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem3 = '';
                                      visibleSebabPertengkaranItem3 = false;
                                      tandaItem3 = '';
                                      akhirItem3 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 4
                      Visibility(
                        visible: visibleSebabPertengkaranItem4,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem4)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem4 = '';
                                      visibleSebabPertengkaranItem4 = false;
                                      tandaItem4 = '';
                                      akhirItem4 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 5
                      Visibility(
                        visible: visibleSebabPertengkaranItem5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem5)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem5 = '';
                                      visibleSebabPertengkaranItem5 = false;
                                      tandaItem5 = '';
                                      akhirItem5 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 6
                      Visibility(
                        visible: visibleSebabPertengkaranItem6,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem6)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem6 = '';
                                      visibleSebabPertengkaranItem6 = false;
                                      tandaItem6 = '';
                                      akhirItem6 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 7
                      Visibility(
                        visible: visibleSebabPertengkaranItem7,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem7)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem7 = '';
                                      visibleSebabPertengkaranItem7 = false;
                                      tandaItem7 = '';
                                      akhirItem7 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 8
                      Visibility(
                        visible: visibleSebabPertengkaranItem8,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem8)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem8 = '';
                                      visibleSebabPertengkaranItem8 = false;
                                      tandaItem8 = '';
                                      akhirItem8 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 9
                      Visibility(
                        visible: visibleSebabPertengkaranItem9,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem9)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem9 = '';
                                      visibleSebabPertengkaranItem9 = false;
                                      tandaItem9 = '';
                                      akhirItem9 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // item 10
                      Visibility(
                        visible: visibleSebabPertengkaranItem10,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text(sebabPertengkaranItem10)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      sebabPertengkaranItem10 = '';
                                      visibleSebabPertengkaranItem10 = false;
                                      tandaItem10 = '';
                                      akhirItem10 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // sebab lainnya 1
                      Visibility(
                        visible: visibleSebabPertengkaranLainnya1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: alasanLainnya1,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                    labelText: 'Alasan lainnya',
                                    // border: OutlineInputBorder(),
                                  ),
                                  //   validator: ValidationBuilder()
                                  //    .minLength(4)
                                  //    .maxLength(4)
                                  //    .build(),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      alasanLainnya1.text = '';
                                      visibleSebabPertengkaranLainnya1 = false;
                                      tandaAlasanLainnya1 = '';
                                      akhirAlasanLainnya1 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // alasan lainnya 2
                      Visibility(
                        visible: visibleSebabPertengkaranLainnya2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: alasanLainnya2,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  maxLines: 2,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    labelText: 'Alasan lainnya',
                                    // border: OutlineInputBorder(),
                                  ),
                                  //   validator: ValidationBuilder()
                                  //    .minLength(4)
                                  //    .maxLength(4)
                                  //    .build(),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      alasanLainnya2.text = '';
                                      visibleSebabPertengkaranLainnya2 = false;
                                      tandaAlasanLainnya2 = '';
                                      akhirAlasanLainnya2 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                      // alasan lainnya 3
                      Visibility(
                        visible: visibleSebabPertengkaranLainnya3,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: alasanLainnya3,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  maxLines: 2,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    labelText: 'Alasan lainnya',
                                    // border: OutlineInputBorder(),
                                  ),
                                  //   validator: ValidationBuilder()
                                  //    .minLength(4)
                                  //    .maxLength(4)
                                  //    .build(),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      alasanLainnya3.text = '';
                                      visibleSebabPertengkaranLainnya3 = false;
                                      tandaAlasanLainnya3 = '';
                                      akhirAlasanLainnya3 = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormSebabPertengkaran = false;
                              visibleFormPuncakPertengkaran = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateSebabPertengkaran,

                          /*() {
                            setState(() {
                              visibleFormSebabPertengkaran = false;
                              visibleSimpanData = true;
                            });
                          },*/
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Data Akibat Pertengkaran
          Visibility(
            visible: visibleFormAkibatPertengkaran,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data Akibat Pertengkaran'),
                ),
                Form(
                  key: keyDataPisah,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropDownTextField(
                          textFieldDecoration: const InputDecoration(
                            labelText: 'Akibat pertengkaran?',
                            //  hintText: "*dapat memilih lebih dari 1 sebab",
                            border: OutlineInputBorder(),
                          ),
                          singleController: akibatPertengkaran,
                          clearOption: false,
                          //  enableSearch: true,
                          dropDownItemCount: 4,
                          dropDownList: _akibatPertengkaran,
                          onChanged: (val) {
                            setState(() {
                              akibatPertengkaranText =
                                  akibatPertengkaran.dropDownValue!.value;
                              visibleAkibatPertengkaranText = true;
                            });
                          },
                          //   validator: ValidationBuilder().minLength(1).build(),
                        ),
                      ),
                      Visibility(
                        visible: visibleAkibatPertengkaranText,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(akibatPertengkaranText)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          akibatPertengkaranText = '';
                                          visibleAkibatPertengkaranText = false;
                                        });
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red)),
                                ],
                              ),
                              const Text('Sudah berapa lama?'),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        controller: tahunLamaPisah,
                                        //  maxLength: 2,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: 'Tahun',
                                          border: OutlineInputBorder(),
                                        ),
                                        //   validator: ValidationBuilder()
                                        //    .minLength(1)
                                        //    .maxLength(3)
                                        //    .build(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        controller: bulanLamaPisah,
                                        // maxLength: 2,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: 'Bulan',
                                          border: OutlineInputBorder(),
                                        ),
                                        //   validator: ValidationBuilder()
                                        //   .minLength(1)
                                        //   .maxLength(3)
                                        //   .build(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormAkibatPertengkaran = false;
                              visibleFormSebabPertengkaran = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataPisah,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Data Nafkah
          Visibility(
            visible: visibleFormDataNafkah,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Text(
                    'Hak hak Perempuan dan Anak Pasca Perceraian',
                    //style: TextStyle(color: Colors.blue),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "UU No 1 tahun 1974 diubah dengan UU No 16 Tahun 2019 jo PERMA No 3 Tahun 2017 jo SEMA No 3 tahun 2018 jo SEMA No 2 Tahun 2019 jo Kompilasi Hukum Islam",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(color: Colors.black),
                Form(
                  key: keyDataNafkah,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Hak hak Perempuan',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ),
                          // Nafkah Iddah
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            child: Text(
                              "Nafkah Iddah adalah nafkah yang wajib diberikan oleh mantan suami kepada mantan istri yang dijatuhi talak selama mantan istri menjalani masa iddah (masa tunggu). Nafkah hidup, biaya tempat tinggal dan pakaian dapat dimasukkan kedalam Nafkah Iddah.",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownTextField(
                              textFieldDecoration: const InputDecoration(
                                labelText: 'Apakah akan meminta\nNafkah Iddah?',
                                border: OutlineInputBorder(),
                              ),
                              singleController: nafkahIddah,
                              clearOption: false,
                              //  enableSearch: true,
                              //  dropDownItemCount: 8,
                              dropDownList: _nafkahIddah,
                              onChanged: (val) {
                                if (nafkahIddah.dropDownValue!.name == 'Ya') {
                                  setState(() {
                                    visibleNafkahIddah = true;
                                  });
                                } else {
                                  setState(() {
                                    visibleNafkahIddah = false;
                                  });
                                }
                              },
                              //   validator: ValidationBuilder().minLength(1).build(),
                            ),
                          ),
                          Visibility(
                            visible: visibleNafkahIddah,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: nominalNafkahIddah,
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                          locale: 'id', symbol: 'Rp.')
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Jumlah nominal',
                                      hintText: 'contoh: Rp.3.000.000,00',
                                      border: OutlineInputBorder(),
                                    ),
                                    //   validator: ValidationBuilder()
                                    //    .minLength(1)
                                    //    .maxLength(3)
                                    //    .build(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Nafkah Madhiyah
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            child: Text(
                              "Nafkah Madhiyah adalah nafkah terdahulu yang dilalaikan atau tidak dilaksanakan oleh mantan suami kepada mantan istri sewaktu keduanya masih terikat perkawinan yang sah",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownTextField(
                              textFieldDecoration: const InputDecoration(
                                labelText:
                                    "Apakah akan meminta\nNafkah Madhiyah?",
                                //  hintText: "*dapat memilih lebih dari 1 sebab",
                                border: OutlineInputBorder(),
                              ),
                              singleController: nafkahMadhiyah,
                              clearOption: false,
                              //  enableSearch: true,
                              //  dropDownItemCount: 8,
                              dropDownList: _nafkahMadhiyah,
                              onChanged: (val) {
                                if (nafkahMadhiyah.dropDownValue!.name ==
                                    'Ya') {
                                  setState(() {
                                    visibleNafkahMadhiyah = true;
                                  });
                                } else {
                                  setState(() {
                                    visibleNafkahMadhiyah = false;
                                  });
                                }
                              },
                              //   validator: ValidationBuilder().minLength(1).build(),
                            ),
                          ),
                          Visibility(
                            visible: visibleNafkahMadhiyah,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: nominalNafkahMadhiyah,
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                          locale: 'id', symbol: 'Rp.')
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Jumlah nominal',
                                      hintText: 'contoh: Rp.3.000.000,00',
                                      border: OutlineInputBorder(),
                                    ),
                                    //   validator: ValidationBuilder()
                                    //    .minLength(1)
                                    //    .maxLength(3)
                                    //    .build(),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Mut'ah
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            child: Text(
                              "Mut‘ah adalah pemberian mantan suami kepada isteri yang dijatuhi talak, berupa benda atau uang dan lainnya",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownTextField(
                              textFieldDecoration: const InputDecoration(
                                labelText: "Apakah akan meminta Mut'ah?",
                                //  hintText: "*dapat memilih lebih dari 1 sebab",
                                border: OutlineInputBorder(),
                              ),
                              singleController: pemberianMutah,
                              clearOption: false,
                              //  enableSearch: true,
                              //  dropDownItemCount: 8,
                              dropDownList: _pemberianMutah,
                              onChanged: (val) {
                                if (pemberianMutah.dropDownValue!.name ==
                                    'Ya') {
                                  setState(() {
                                    visiblePemberianMutah = true;
                                  });
                                } else {
                                  setState(() {
                                    visiblePemberianMutah = false;
                                  });
                                }
                              },
                              //   validator: ValidationBuilder().minLength(1).build(),
                            ),
                          ),
                          Visibility(
                            visible: visiblePemberianMutah,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: nominalPemberianMutah,
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                          locale: 'id', symbol: 'Rp.')
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Jumlah nominal',
                                      hintText: 'contoh: Rp.3.000.000,00',
                                      border: OutlineInputBorder(),
                                    ),
                                    //   validator: ValidationBuilder()
                                    //    .minLength(1)
                                    //    .maxLength(3)
                                    //    .build(),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Hadhanah
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            child: Text(
                              "Hadhanah adalah hak pemeliharaan atau hak asuh atas anak yang belum mumayyiz (terlihat fungsi akalnya) atau belum berumur 12 tahun, atau anak yang telah berumur 12 tahun atau lebih namun memilih dipelihara oleh ibunya.",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownTextField(
                              textFieldDecoration: const InputDecoration(
                                labelText: "Apakah akan mengajukan Hadhanah?",
                                border: OutlineInputBorder(),
                              ),
                              singleController: hakHadhanah,
                              clearOption: false,
                              //  enableSearch: true,
                              //  dropDownItemCount: 8,
                              dropDownList: _hakHadhanah,
                              onChanged: (val) {},
                              //   validator: ValidationBuilder().minLength(1).build(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Hak hak Anak',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ),
                          // Nafkah Madhiyah Anak
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            child: Text(
                              "Nafkah Madhiyah Anak adalah nafkah terdahulu yang dilalaikan atau tidak dilaksanakan oleh ayah (mantan suami) kepada anaknya sewaktu anak tersebut belum dewasa dan mandiri (berusia 21 tahun).",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownTextField(
                              textFieldDecoration: const InputDecoration(
                                labelText:
                                    "Apakah akan meminta Nafkah\nMadhiyah Anak?",
                                border: OutlineInputBorder(),
                              ),
                              singleController: nafkahMadhiyahAnak,
                              clearOption: false,
                              //  enableSearch: true,
                              //  dropDownItemCount: 8,
                              dropDownList: _nafkahMadhiyahAnak,
                              onChanged: (val) {
                                if (nafkahMadhiyahAnak.dropDownValue!.name ==
                                    'Ya') {
                                  setState(() {
                                    visibleNafkahMadhiyahAnak = true;
                                  });
                                } else {
                                  setState(() {
                                    visibleNafkahMadhiyahAnak = false;
                                  });
                                }
                              },
                              //   validator: ValidationBuilder().minLength(1).build(),
                            ),
                          ),
                          Visibility(
                            visible: visibleNafkahMadhiyahAnak,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: nominalNafkahMadhiyahAnak,
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                          locale: 'id', symbol: 'Rp.')
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Jumlah nominal',
                                      hintText: 'contoh: Rp.3.000.000,00',
                                      border: OutlineInputBorder(),
                                    ),
                                    //   validator: ValidationBuilder()
                                    //    .minLength(1)
                                    //    .maxLength(3)
                                    //    .build(),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Hadhanah dan nafkah anak
                          const Divider(color: Colors.black),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                            child: Text(
                              "Biaya Hadhanah & Nafkah Anak adalah biaya pemeliharaan dan nafkah untuk anak yang hak hadhanah (hak pemeliharaannya) telah ditetapkan kepada salah satu dari orang tuanya atau keluarga lain yang menggantikannya.",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownTextField(
                              textFieldDecoration: const InputDecoration(
                                labelText:
                                    "Apakah akan meminta Biaya\nHadhanah & Nafkah Anak??",
                                //  hintText: "*dapat memilih lebih dari 1 sebab",
                                border: OutlineInputBorder(),
                              ),
                              singleController: hadhanahNafkahAnak,
                              clearOption: false,
                              //  enableSearch: true,
                              //  dropDownItemCount: 8,
                              dropDownList: _hadhanahNafkahAnak,
                              onChanged: (val) {
                                if (hadhanahNafkahAnak.dropDownValue!.name ==
                                    'Ya') {
                                  setState(() {
                                    visibleHadhanahNafkahAnak = true;
                                  });
                                } else {
                                  setState(() {
                                    visibleHadhanahNafkahAnak = false;
                                  });
                                }
                              },
                              //   validator: ValidationBuilder().minLength(1).build(),
                            ),
                          ),
                          Visibility(
                            visible: visibleHadhanahNafkahAnak,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: nominalHadhanahNafkahAnak,
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                          locale: 'id', symbol: 'Rp.')
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Jumlah nominal per bulan',
                                      hintText: 'contoh: Rp.1.000.000,00',
                                      border: OutlineInputBorder(),
                                    ),
                                    //   validator: ValidationBuilder()
                                    //    .minLength(1)
                                    //    .maxLength(3)
                                    //    .build(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormDataNafkah = false;
                              visibleFormAkibatPertengkaran = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataNafkah,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Data tidak diberi nafkah
          Visibility(
            visible: visibleFormDataTidakDiberiNafkah,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Data tidak diberi nafkah',
                    //style: TextStyle(color: Colors.blue),
                  ),
                ),
                Form(
                  key: keyDataTidakDiberiNafkah,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Sudah berapa lama suami tidak memberi nafkah lahir maupun nafkah batin? '),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: tahunLamaTidakNafkah,
                                //  maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Tahun',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //    .minLength(1)
                                //    .maxLength(3)
                                //    .build(),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: bulanLamaTidakNafkah,
                                // maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Bulan',
                                  border: OutlineInputBorder(),
                                ),
                                //   validator: ValidationBuilder()
                                //   .minLength(1)
                                //   .maxLength(3)
                                //   .build(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormDataNafkah = true;
                              visibleFormDataTidakDiberiNafkah = false;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataTidakDiberiNafkah,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Data usaha damai
          Visibility(
            visible: visibleFormDataPerdamaian,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                  child: Text('Data Usaha Perdamaian'),
                ),
                Form(
                  key: keyDataPerdamaian,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropDownTextField(
                          singleController: usahaDamai,
                          textFieldDecoration: const InputDecoration(
                            labelText:
                                'Adakah upaya penyelesaian\npermasalahan secara musyarawah\nbersama Suami?',
                            border: OutlineInputBorder(),
                          ),
                          clearOption: false,
                          dropDownList: _usahaDamai,
                          onChanged: (val) {
                            setState(() {
                              visibleUsahaDamai2 = true;
                            });
                          },
                        ),
                      ),
                      Visibility(
                        visible: visibleUsahaDamai2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropDownTextField(
                            singleController: usahaDamai2,
                            textFieldDecoration: const InputDecoration(
                              labelText: 'Apakah turut melibatkan keluarga?',
                              border: OutlineInputBorder(),
                            ),
                            clearOption: false,
                            dropDownList: _usahaDamai2,
                            onChanged: (val) {
                              if (usahaDamai.dropDownValue!.name == 'Ada' &&
                                  usahaDamai2.dropDownValue!.name == 'Ya') {
                                setState(() {
                                  usahaDamaiText =
                                      'Bahwa Penggugat telah berupaya mengatasi masalah rumah tangga Penggugat dan Tergugat melalui musyawarah dengan melibatkan keluarga namun tidak berhasil;';
                                });
                              }
                              //
                              else if (usahaDamai.dropDownValue!.name ==
                                      'Ada' &&
                                  usahaDamai2.dropDownValue!.name == 'Tidak') {
                                setState(() {
                                  usahaDamaiText =
                                      'Bahwa Penggugat telah berupaya mengatasi masalah rumah tangga Penggugat dan Tergugat melalui musyawarah namun tidak berhasil;';
                                });
                              }
                              //
                              else if (usahaDamai.dropDownValue!.name ==
                                          'Tidak' &&
                                      usahaDamai2.dropDownValue!.name == 'Ya' ||
                                  usahaDamai.dropDownValue!.name == 'Tidak' &&
                                      usahaDamai2.dropDownValue!.name ==
                                          'Tidak') {
                                setState(() {
                                  usahaDamaiText =
                                      'Bahwa Penggugat tidak berupaya mengatasi masalah rumah tangga Penggugat dan Tergugat melalui musyawarah;';
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(usahaDamaiText),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleFormDataPerdamaian = false;
                              visibleFormDataTidakDiberiNafkah = true;
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateDataPerdamaian,
                          child: const Text('Lanjut'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Simpan Data
          Visibility(
            visible: visibleSimpanData,
            child: Column(
              children: [
                SizedBox(
                  height: tinggi / 1.35,
                  child: AspectRatio(
                    aspectRatio: controllerVideoKonversi.value.aspectRatio,
                    child: VideoPlayer(controllerVideoKonversi),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: VideoProgressIndicator(
                    controllerVideoKonversi,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      //  backgroundColor: Colors.grey,
                      playedColor: Colors.red,
                      bufferedColor: Colors.yellow,
                    ),
                  ),
                ),
                Column(
                  children: [
                    loading
                        ? const Center(
                            child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ))
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        savedInfo,
                        // style: const TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visibleSimpanData = false;
                              visibleFormDataNafkah = true;
                              controllerVideoKonversi.pause();
                            });
                          },
                          child: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            if (controllerVideoKonversi.value.isPlaying) {
                              controllerVideoKonversi.pause();
                            } else {
                              controllerVideoKonversi.play();
                            }
                            setState(() {});
                          },
                          icon: Row(
                            children: [
                              Icon(
                                controllerVideoKonversi.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              Text(
                                controllerVideoKonversi.value.isPlaying
                                    ? 'Stop'
                                    : 'Play',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          iconSize: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await generateDocumentFromAssetTpl();
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.save,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Simpan',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              return await openFile();
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.image_search,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Cari File',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),

                /*   const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Pastikan semua data sudah benar!',
                    // style: TextStyle(color: Colors.red),
                  ),
                ),
                Column(
                  children: [
                    loading
                        ? const Center(
                            child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          ))
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        savedInfo,
                        // style: const TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await generateDocumentFromAssetTpl();
                                },
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.save,
                                      size: 40,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      'Simpan',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  return await openFile();
                                },
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.image_search,
                                      size: 40,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      'Cari File',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      visibleSimpanData = false;
                      visibleFormSebabPertengkaran = true;
                    });
                  },
                  child: const Text('Kembali'),
                ),
            */
              ],
            ),
          ),
          //
        */
        ],
      ),
      /*  floatingActionButton: FloatingActionButton(
        onPressed: switchStepsType,
        child: const Icon(Icons.list),
      ),*/
    );
  }

  final _pendidikan = [
    const DropDownValueModel(
      name: 'Tidak Sekolah',
      value: "Tidak Sekolah",
    ),
    const DropDownValueModel(
      name: 'SD/Madrasah Ibtidaiyah',
      value: "Sekolah Dasar",
    ),
    const DropDownValueModel(
      name: 'SMP/Madrasah Tsanawiyah',
      value: "Sekolah Menengah Pertama (Sederajat)",
    ),
    const DropDownValueModel(
      name: 'SMA/SMK/Madrasah Aliyah',
      value: "Sekolah Menengah Atas (Sederajat)",
    ),
    const DropDownValueModel(
      name: 'D1',
      value: "D1",
    ),
    const DropDownValueModel(
      name: 'D2',
      value: "D2",
    ),
    const DropDownValueModel(
      name: 'D3',
      value: "D3",
    ),
    const DropDownValueModel(
      name: 'S1',
      value: "S1",
    ),
    const DropDownValueModel(
      name: 'S2',
      value: "S2",
    ),
    const DropDownValueModel(
      name: 'S3',
      value: "S3",
    ),
  ];

  final _kecamatan = [
    const DropDownValueModel(
      name: 'Krayan Selatan',
      value: "Krayan Selatan",
    ),
    const DropDownValueModel(
      name: 'Krayan Tengah',
      value: "Krayan Tengah",
    ),
    const DropDownValueModel(
      name: 'Krayan',
      value: "Krayan",
    ),
    const DropDownValueModel(
      name: 'Krayan Timur',
      value: "Krayan Timur",
    ),
    const DropDownValueModel(
      name: 'Krayan Barat',
      value: "Krayan Barat",
    ),
    const DropDownValueModel(
      name: 'Lumbis Ogong',
      value: "Lumbis Ogong",
    ),
    const DropDownValueModel(
      name: 'Lumbis Pansiangan',
      value: "Lumbis Pansiangan",
    ),
    const DropDownValueModel(
      name: 'Lumbis Hulu',
      value: "Lumbis Hulu",
    ),
    const DropDownValueModel(
      name: 'Lumbis',
      value: "Lumbis",
    ),
    const DropDownValueModel(
      name: 'Sembakung Atulai',
      value: "Sebakung Atulai",
    ),
    const DropDownValueModel(
      name: 'Sembakung',
      value: "Sebakung",
    ),
    const DropDownValueModel(
      name: 'Sebuku',
      value: "Sebuku",
    ),
    const DropDownValueModel(
      name: 'Tulin Onsui',
      value: "Tulin Onsui",
    ),
    const DropDownValueModel(
      name: 'Sei Menggaris',
      value: "Sei Menggaris",
    ),
    const DropDownValueModel(
      name: 'Nunukan',
      value: "Nunukan",
    ),
    const DropDownValueModel(
      name: 'Nunukan Selatan',
      value: "Nunukan Selatan",
    ),
    const DropDownValueModel(
      name: 'Sebatik Barat',
      value: "Sebatik Barat",
    ),
    const DropDownValueModel(
      name: 'Sebatik',
      value: "Sebatik",
    ),
    const DropDownValueModel(
      name: 'Sebatik Timur',
      value: "Sebatik Timur",
    ),
    const DropDownValueModel(
      name: 'Sebatik Tengah',
      value: "Sebatik Tengah",
    ),
    const DropDownValueModel(
      name: 'Sebatik Utara',
      value: "Sebatik Utara",
    ),
  ];

  final _dataAnakHasilPernikahan = [
    const DropDownValueModel(
      name: 'Belum ada anak',
      value: "belum dikaruniai anak.",
    ),
    const DropDownValueModel(
      name: 'Sudah ada anak',
      value: "sudah dikaruniai anak ",
    ),
  ];
  final _sebabPertengkaran = [
    const DropDownValueModel(
      name: 'Tergugat tidak memberikan nafkah lahir',
      value: "Tergugat tidak memberikan nafkah lahir.",
    ),
    const DropDownValueModel(
      name: 'Tergugat memberikan nafkah lahir\nnamun tidak mencukupi',
      value: "Tergugat memberikan nafkah lahir namun tidak mencukupi.",
    ),
    const DropDownValueModel(
      name: 'Tergugat memberikan nafkah lahir\nnamun tidak mencukupi',
      value: "Tergugat memberikan nafkah lahir namun tidak mencukupi.",
    ),
    const DropDownValueModel(
        name: 'Tergugat sering berkata-kata kasar\nkepada Penggugat',
        value: "Tergugat sering berkata-kata kasar kepada Penggugat"),
    const DropDownValueModel(
        name:
            "Tergugat sering berkata-kata kasar\nkepada anak Penggugat dan Tergugat",
        value:
            "Tergugat sering berkata-kata kasar kepada anak Penggugat dan Tergugat"),
    const DropDownValueModel(
      name: "Tergugat sering berkata-kata kasar\nkepada orang tua Penggugat",
      value: "Tergugat sering berkata-kata kasar kepada orang tua Penggugat",
    ),
    const DropDownValueModel(
      name: 'Tergugat sering memukul tubuh Penggugat',
      value: "Tergugat sering memukul tubuh Penggugat.",
    ),
    const DropDownValueModel(
      name: 'Tergugat sering menampar wajah Penggugat',
      value: "Tergugat sering menampar wajah Penggugat.",
    ),
    const DropDownValueModel(
      name:
          'Tergugat sering memukul anak Penggugat\ndan Tergugat jika sedang marah',
      value:
          "Tergugat sering memukul anak Penggugat dan Tergugat jika sedang marah.",
    ),
    const DropDownValueModel(
      name: 'Tergugat sering mengancam Penggugat\ndengan senjata tajam',
      value: "Tergugat sering mengancam Penggugat dengan senjata tajam.",
    ),
    const DropDownValueModel(
      name: 'Tergugat menggunakan narkoba',
      value: "Tergugat terlibat penggunaan narkotika dan obat-obat terlarang.",
    ),
    const DropDownValueModel(
      name:
          'Tergugat selingkuh dengan wanita lain\nyang Penggugat ketahui sendiri',
      value:
          "Tergugat selingkuh dengan wanita lain yang Penggugat ketahui sendiri",
    ),
    const DropDownValueModel(
      name:
          'Tergugat selingkuh dengan wanita lain\nyang Penggugat ketahui dari orang lain',
      value:
          "Tergugat selingkuh dengan wanita lain yang Penggugat ketahui dari orang lain",
    ),
    const DropDownValueModel(
      name: 'alasan lainnya',
      value: "",
    ),
  ];

  final _akibatPertengkaran = [
    const DropDownValueModel(
        name:
            'Penggugat meninggalkan tempat tinggal\nbersama tanpa sepengetahuan Tergugat',
        value:
            'Penggugat meninggalkan tempat tinggal bersama tanpa sepengetahuan Tergugat'),
    const DropDownValueModel(
        name:
            'Tergugat meninggalkan tempat tinggal\nbersama tanpa sepengetahuan Penggugat',
        value:
            'Tergugat meninggalkan tempat tinggal bersama tanpa sepengetahuan Penggugat'),
    const DropDownValueModel(
        name: 'Penggugat dan Tergugat memutuskan\npisah tempat tinggal',
        value: 'Penggugat dan Tergugat memutuskan pisah tempat tinggal'),
    const DropDownValueModel(
        name: 'Penggugat dan Tergugat masih serumah\nnamun pisah ranjang',
        value: 'Penggugat dan Tergugat masih serumah namun pisah ranjang'),
  ];

  final _nafkahIddah = [
    const DropDownValueModel(name: 'Ya', value: ''),
    const DropDownValueModel(name: 'Tidak', value: '')
  ];
  final _nafkahMadhiyah = [
    const DropDownValueModel(name: 'Ya', value: ''),
    const DropDownValueModel(name: 'Tidak', value: '')
  ];
  final _pemberianMutah = [
    const DropDownValueModel(name: 'Ya', value: 'Ya'),
    const DropDownValueModel(name: 'Tidak', value: 'Tidak')
  ];
  final _hakHadhanah = [
    const DropDownValueModel(name: 'Ya', value: 'Ya'),
    const DropDownValueModel(name: 'Tidak', value: 'Tidak')
  ];
  final _nafkahMadhiyahAnak = [
    const DropDownValueModel(name: 'Ya', value: 'Ya'),
    const DropDownValueModel(name: 'Tidak', value: 'Tidak')
  ];
  final _hadhanahNafkahAnak = [
    const DropDownValueModel(name: 'Ya', value: 'Ya'),
    const DropDownValueModel(name: 'Tidak', value: 'Tidak')
  ];
  final _usahaDamai = [
    const DropDownValueModel(name: 'Ada', value: ''),
    const DropDownValueModel(name: 'Tidak', value: '')
  ];
  final _usahaDamai2 = [
    const DropDownValueModel(name: 'Ya', value: ''),
    const DropDownValueModel(name: 'Tidak', value: '')
  ];

  void _validateSebabPertengkaran() {
    keySebabPertengkaran.currentState!.validate();
    if (keySebabPertengkaran.currentState!.validate() == true) {
      setState(() {
        visibleFormSebabPertengkaran = false;
        visibleFormAkibatPertengkaran = true;
      });
    }
  }

  void _validateWaktuPertengkaran() {
    keyWaktuPertengkaran.currentState!.validate();
    if (keyWaktuPertengkaran.currentState!.validate() == true) {
      setState(() {
        visibleFormWaktuPertengkaran = false;
        visibleFormPuncakPertengkaran = true;
      });
    }
  }

  void _validateDataAnak() {
    keyDataAnak.currentState!.validate();
    if (keyDataAnak.currentState!.validate() == true) {
      setState(() {
        visibleFormAnak = false;
        visibleFormWaktuPertengkaran = true;
      });
    }
  }

  void _validateLamaBersama() {
    keyRiwayatTinggal.currentState!.validate();
    if (keyRiwayatTinggal.currentState!.validate() == true) {
      setState(() {
        visibleFormAlamatBersama = false;
        visibleFormAnak = true;
      });
    }
  }

  void _validateDataPernikahan() {
    keyDataPernikahan.currentState!.validate();
    if (keyDataPernikahan.currentState!.validate() == true) {
      setState(() {
        visibleFormPernikahan = false;
        visibleFormAlamatBersama = true;
      });
    }
  }

  void _validateDataAlamatP() {
    keyDataAlamatP.currentState!.validate();
    if (keyDataAlamatP.currentState!.validate() == true) {
      setState(() {
        visibleFormAlamatP = false;
        visibleFormT = true;
      });
    }
  }

  void _validateDataAlamatT() {
    keyDataAlamatT.currentState!.validate();
    if (keyDataAlamatT.currentState!.validate() == true) {
      setState(() {
        visibleFormAlamatT = false;
        visibleFormPernikahan = true;
      });
    }
  }

  void _validateDataTergugat() {
    keyDataTergugat.currentState!.validate();
    if (keyDataTergugat.currentState!.validate() == true) {
      setState(() {
        visibleFormT = false;
        visibleFormAlamatT = true;
      });
    }
  }

  void _validateDataPemohon() {
    keyDataPemohon.currentState!.validate();
    if (keyDataPemohon.currentState!.validate() == true) {
      setState(() {
        visibleFormP = false;
        visibleFormAlamatP = true;
      });
    }
  }

  void _validatePuncakPertengkaran() {
    keyPuncakPertengkaran.currentState!.validate();
    if (keyPuncakPertengkaran.currentState!.validate() == true) {
      setState(() {
        visibleFormPuncakPertengkaran = false;
        visibleFormSebabPertengkaran = true;
      });
    }
  }

  void _validateDataPisah() {
    keyDataPisah.currentState!.validate();
    if (keyDataPisah.currentState!.validate() == true) {
      setState(() {
        visibleFormAkibatPertengkaran = false;
        visibleFormDataNafkah = true;
      });
    }
  }

  void _validateDataNafkah() {
    keyDataNafkah.currentState!.validate();
    if (keyDataNafkah.currentState!.validate() == true) {
      setState(() {
        visibleFormDataNafkah = false;
        visibleFormDataTidakDiberiNafkah = true;
      });
    }
  }

  void _validateDataTidakDiberiNafkah() {
    keyDataTidakDiberiNafkah.currentState!.validate();
    if (keyDataTidakDiberiNafkah.currentState!.validate() == true) {
      setState(() {
        visibleFormDataTidakDiberiNafkah = false;
        visibleFormDataPerdamaian = true;
      });
    }
  }

  void _validateDataPerdamaian() {
    keyDataPerdamaian.currentState!.validate();
    if (keyDataPerdamaian.currentState!.validate() == true) {
      setState(() {
        visibleFormDataPerdamaian = false;
        visibleSimpanData = true;
      });
    }
  }
}
