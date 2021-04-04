import 'package:flutter/material.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/pages/alquran/alquran_pages.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_pages.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class CustomeTabBarAlQuran extends StatefulWidget {
  @override
  _CustomeTabBarAlQuranState createState() => _CustomeTabBarAlQuranState();
}

class _CustomeTabBarAlQuranState extends State<CustomeTabBarAlQuran> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return DefaultTabController(
          length: 3,
          child: CustomePage(
            scaffold: Scaffold(
              backgroundColor: whiteColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                  sy(175),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: whiteColor,
                      elevation: 0.0,
                      iconTheme: IconThemeData(
                        color: blackColor,
                        size: 24,
                      ),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: blackColor1,
                            size: 24,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 21,
                        right: 19,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Bacaan Pilihan',
                            style: googlePoppinsMedium.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Lihat Semua',
                            style: googlePoppinsMedium.copyWith(
                              fontSize: 10,
                              color: blueColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: sy(45),
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: 21,
                        ),
                        itemCount: listModelBacaanPilihan.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: 24,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: sy(65),
                                  width: sy(142),
                                  decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(
                                      sy(16),
                                    ),
                                  ),
                                  child: Text(
                                    listModelBacaanPilihan[index].nameBacaan,
                                    style: googlePoppinsMedium.copyWith(
                                      fontSize: 14,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: sy(15),
                                  left: sy(-20),
                                  child: Container(
                                    height: sy(53),
                                    width: sy(53),
                                    child: Image.asset(
                                      'image/segitiga.png',
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: sy(10),
                                  right: sy(-20),
                                  child: Container(
                                    height: sy(86),
                                    width: sy(86),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: sy(10),
                                  right: sy(-20),
                                  child: Container(
                                    height: sy(86),
                                    width: sy(86),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(.1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // TabBar
                    Column(
                      children: [
                        TabBar(
                          labelStyle: googlePoppinsRegular.copyWith(
                            fontSize: 16,
                            letterSpacing: 0.3,
                            color: blackColor1,
                          ),
                          labelColor: blackColor1,
                          unselectedLabelColor: blackColor1.withOpacity(0.5),
                          unselectedLabelStyle: googlePoppinsRegular.copyWith(
                            fontSize: 16,
                            letterSpacing: 0.3,
                            color: blackColor1,
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          // isScrollable: true,
                          indicatorWeight: 2.0,
                          indicatorColor: blackColor1,
                          tabs: <Widget>[
                            Tab(
                              text: 'Surat',
                            ),
                            Tab(
                              text: 'Hadits',
                            ),
                            Tab(
                              text: 'Bookmark',
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: greyColor,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  InitialAlQuranPages(),
                  InitialHaditsPages(),
                  Container(),
                ],
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
