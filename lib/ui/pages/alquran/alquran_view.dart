import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_alquran/alquran_bloc.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/pages/surah/surah_arguments.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class AlQuranView extends StatefulWidget {
  @override
  _AlQuranViewState createState() => _AlQuranViewState();
}

class _AlQuranViewState extends State<AlQuranView> {
  // Refresh
  Completer<void> _refreshCompleter;

  // Bloc
  AlQuranBloc _alQuranBloc;

  @override
  void initState() {
    _alQuranBloc = BlocProvider.of<AlQuranBloc>(context);
    _refreshCompleter = Completer<void>();
    super.initState();
  }

  @override
  void dispose() {
    _alQuranBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            backgroundColor: whiteColor,
            body: BlocListener<AlQuranBloc, AlQuranState>(
              listener: (context, state) {
                if (state is AlQuranLoadInProgress) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              child: BlocBuilder<AlQuranBloc, AlQuranState>(
                cubit: _alQuranBloc,
                builder: (context, state) {
                  if (state is AlQuranLoadInProgress) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AlQuranLoadedSuccess) {
                    return RefreshIndicator(
                      onRefresh: () {
                        _alQuranBloc
                          ..add(
                            GetListAlQuranFromApi(),
                          );
                        return _refreshCompleter.future;
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                              bottom: sy(90),
                            ),
                            itemCount: state.modelListAlQuran.data.length,
                            itemBuilder: (context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.detailSurah,
                                    arguments: SurahArguments(
                                      idSurah: state
                                          .modelListAlQuran.data[index].number
                                          .toString(),
                                      nameSurah: state.modelListAlQuran
                                          .data[index].name.transliteration.id,
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: sy(52),
                                      width: double.infinity,
                                      child: ListTile(
                                        dense: true,
                                        minLeadingWidth: sy(5),
                                        leading: Container(
                                          alignment: Alignment.center,
                                          width: sy(36),
                                          height: sy(36),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: greyColor1,
                                          ),
                                          child: Text(
                                            state.modelListAlQuran.data[index]
                                                .number
                                                .toString(),
                                            style: googlePoppinsMedium.copyWith(
                                              fontSize: 20,
                                              color: blueColor,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          state.modelListAlQuran.data[index]
                                              .name.transliteration.id,
                                          style: googlePoppinsMedium.copyWith(
                                            fontSize: 16,
                                            color: blackColor1,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${state.modelListAlQuran.data[index].name.translation.id} | ${state.modelListAlQuran.data[index].numberOfVerses} Ayat',
                                          style: googlePoppinsRegular.copyWith(
                                            letterSpacing: 0.3,
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        trailing: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 24,
                                          ),
                                          child: Text(
                                            state.modelListAlQuran.data[index]
                                                .name.short,
                                            style: arabicFont.copyWith(
                                              fontSize: 30,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 20,
                                        left: 76,
                                      ),
                                      child: Divider(
                                        thickness: 1,
                                        color: greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Container(
                            height: sy(84),
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(
                                    0,
                                    3,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.bookmark,
                                        size: sy(24),
                                        color: orangeColor,
                                      ),
                                      SizedBox(
                                        width: sy(8),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Terakhir dibaca',
                                            style:
                                                googlePoppinsRegular.copyWith(
                                              fontSize: 10,
                                              letterSpacing: 0.3,
                                              color: blackColor1,
                                            ),
                                          ),
                                          Text(
                                            'Al-Qamar Ayat 28',
                                            style: googlePoppinsMedium.copyWith(
                                              fontSize: 14,
                                              letterSpacing: 0.3,
                                              color: blackColor1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(

                                    primary: blueColor,
                                    textStyle: googlePoppinsMedium.copyWith(
                                      color: whiteColor,
                                      letterSpacing: 0.3,
                                      fontSize: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Lanjut Baca',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is AlQuranLoadedError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.message,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _alQuranBloc
                                ..add(
                                  GetListAlQuranFromApi(),
                                );
                            },
                            child: Text(
                              'Refresh',
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class ModelBacaanPilihan {
  final int id;
  final String nameBacaan;

  ModelBacaanPilihan({
    this.id,
    this.nameBacaan,
  });
}

List<ModelBacaanPilihan> listModelBacaanPilihan = [
  ModelBacaanPilihan(
    id: 1,
    nameBacaan: "Kumpulan Do'a",
  ),
  ModelBacaanPilihan(
    id: 2,
    nameBacaan: "Ayat Pilihan",
  ),
  ModelBacaanPilihan(
    id: 3,
    nameBacaan: "Juz Amma",
  ),
  ModelBacaanPilihan(
    id: 4,
    nameBacaan: "Kumpulan Hadits",
  ),
];
