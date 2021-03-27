import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:share/share.dart';

class SurahBottomSheetView extends StatefulWidget {
  final String nameSurah;
  final String ayatSurah;
  final int indexAudio;
  final String urlAudio;
  final String textarab;

  const SurahBottomSheetView({
    Key key,
    this.nameSurah,
    this.ayatSurah,
    this.indexAudio,
    this.urlAudio,
    this.textarab,
  }) : super(key: key);

  @override
  _SurahBottomSheetViewState createState() => _SurahBottomSheetViewState();
}

class _SurahBottomSheetViewState extends State<SurahBottomSheetView> {
  AudioPlayer audioPlayer =
      AudioPlayer(); //VARIABLE YANG AKAN MENG-HANDLE AUDIO

  // bool
  int _currentSelectedAyat = -1;

  @override
  void initState() {
    ayatEnd();
    super.initState();
  }

  void ayatEnd() {
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _currentSelectedAyat = -1;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: sy(314),
          width: double.infinity,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  bottom: 24,
                ),
                child: Text(
                  '${widget.nameSurah} : ${widget.ayatSurah}',
                  style: googlePoppinsMedium.copyWith(
                    fontSize: 20,
                    color: blackColor1,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Column(
                children: [
                  buttonFunctionSurah(
                    icon: Icon(
                      _currentSelectedAyat != widget.indexAudio
                          ? Icons.play_arrow_outlined
                          : Icons.pause_outlined,
                      size: sy(24),
                    ),
                    nameFunction: 'Putar Murotal',
                    onTap: () async {
                      if (_currentSelectedAyat == widget.indexAudio) {
                        _currentSelectedAyat = -1;

                        if (_currentSelectedAyat == -1) {
                          await audioPlayer.pause();
                        }
                      } else {
                        _currentSelectedAyat = widget.indexAudio;
                        // ketika _currentSelectedAyat sama dengan index
                        // Maka Ayat akan di jalankan
                        if (_currentSelectedAyat == widget.indexAudio) {
                          await audioPlayer.play(widget.urlAudio);
                        }
                      }
                      setState(() {});
                    },
                  ),
                  buttonFunctionSurah(
                    icon: Icon(
                      Icons.share_outlined,
                      size: sy(24),
                      color: Color(0xFF595959),
                    ),
                    nameFunction: 'Bagikan Ayat',
                    onTap: () async {
                      Share.share(
                        widget.textarab,
                        subject: '${widget.nameSurah} : ${widget.ayatSurah}',
                      );
                    },
                  ),
                  buttonFunctionSurah(
                    icon: Icon(
                      Icons.copy_outlined,
                      size: sy(24),
                      color: Color(0xFF595959),
                    ),
                    nameFunction: 'Salin Ayat',
                    onTap: () {
                      Navigator.pop(context);
                      Clipboard.setData(
                        ClipboardData(
                          text: widget.textarab,
                        ),
                      );

                      final snackBar = SnackBar(
                        content: Text(
                          'Ayat berhasil disalin',
                          style: googlePoppinsMedium.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                            letterSpacing: 0.3,
                          ),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                  buttonFunctionSurah(
                    icon: Icon(
                      Icons.bookmark_border,
                      size: sy(24),
                      color: Color(0xFF595959),
                    ),
                    nameFunction: 'Tandai terakhir dibaca',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buttonFunctionSurah({
    String nameFunction,
    Icon icon,
    VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        bottom: 16,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: icon,
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            nameFunction,
            style: googlePoppinsRegular.copyWith(
              fontSize: 16,
              color: blackColor1,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
