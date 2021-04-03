import 'package:date_format/date_format.dart';

class IndonesiaLocale implements DateLocale {
  const IndonesiaLocale();

  final List<String> monthsShort = const [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des'
  ];

  final List<String> monthsLong = const [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  final List<String> daysShort = const [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min'
  ];

  final List<String> daysLong = const [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
  ];

  @override
  String get am => "AM";

  @override
  String get pm => "PM";
}