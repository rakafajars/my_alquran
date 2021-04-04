import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_hadits/hadits_bloc.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_people/hadits_people_arguments.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:my_alquran/ui/widget/loading_progress.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:relative_scale/relative_scale.dart';

class HaditsPeopleView extends StatefulWidget {
  final String idPeople;

  const HaditsPeopleView({
    Key key,
    @required this.idPeople,
  }) : super(key: key);
  @override
  _HaditsPeopleViewState createState() => _HaditsPeopleViewState();
}

class _HaditsPeopleViewState extends State<HaditsPeopleView> {
  // Refresh
  Completer<void> _refreshCompleter;

  // Bloc
  HaditsBloc _haditsBloc;

  // Infinite Scroll
  ScrollController _scrollController = ScrollController();

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      _haditsBloc.add(
        GetPaginationListHaditsPeople(
          idPeople: widget.idPeople,
        ),
      );
    }
  }

  // Controller buat filter
  TextEditingController firstFilter = TextEditingController();
  TextEditingController lastFilter = TextEditingController();

  @override
  void initState() {
    _haditsBloc = BlocProvider.of<HaditsBloc>(context);
    _refreshCompleter = Completer<void>();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _haditsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HaditsPeopleArguments arg = ModalRoute.of(context).settings.arguments;

    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: blueColor,
              title: Text(
                'Hadits ${arg.namePeople}',
                style: googlePoppinsMedium.copyWith(
                  fontSize: 18,
                  color: whiteColor,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: whiteColor,
                    size: 24,
                  ),
                  onPressed: () {
                    _showBottomSheet(
                      idPeople: arg.idPeople,
                    );
                  },
                ),
              ],
            ),
            body: BlocConsumer<HaditsBloc, HaditsState>(
              listener: (context, state) {
                if (state is ListHaditsPeopleLoadInProgress) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
                if (state is ListHaditsRangeLoadInProgress) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              builder: (context, state) {
                if (state is ListHaditsPeopleLoadInProgress) {
                  return LoadingProgress();
                }
                if (state is ListHaditsRangeLoadInProgress) {
                  return LoadingProgress();
                }
                if (state is ListHaditsRangeLoadedSuccess) {
                  return RefreshIndicator(
                    onRefresh: () {
                      _haditsBloc
                        ..add(
                          GetListHaditsPeopleRange(
                            idPeople: arg.idPeople,
                            range: '${firstFilter.text}-${lastFilter.text}',
                          ),
                        );
                      return _refreshCompleter.future;
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.modelListHaditsRange.data.hadits.length,
                      itemBuilder: (context, int index) {
                        return itemHadits(
                          index,
                          idAyat:
                              state.modelListHaditsRange.data.hadits[index].id,
                          number: state
                              .modelListHaditsRange.data.hadits[index].number
                              .toString(),
                          textArab: state
                              .modelListHaditsRange.data.hadits[index].arab,
                        );
                      },
                    ),
                  );
                }
                if (state is ListHaditsPeopleLoadedSuccess) {
                  return RefreshIndicator(
                    onRefresh: () {
                      _haditsBloc
                        ..add(
                          GetListHaditsPeople(idPeople: arg.idPeople),
                        );
                      return _refreshCompleter.future;
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: state.hasReachedMax
                          ? state.hadits.length
                          : state.hadits.length,
                      itemBuilder: (context, int index) {
                        return itemHadits(
                          index,
                          idAyat: state.hadits[index].id,
                          number: state.hadits[index].number.toString(),
                          textArab: state.hadits[index].arab,
                        );
                      },
                    ),
                  );
                }
                if (state is ListHaditsPeopleLoadedError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.message,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _haditsBloc
                              ..add(
                                GetListHaditsPeople(idPeople: arg.idPeople),
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
        );
      },
    );
  }

  Widget itemHadits(
    int index, {
    @required String number,
    @required String textArab,
    @required String idAyat,
  }) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        padding: EdgeInsets.only(
          top: 12,
          right: 20,
          bottom: 16,
        ),
        width: double.infinity,
        color: index % 2 == 0 ? Color(0xFFF0F5FC) : Colors.white,
        child: ListTile(
          dense: true,
          minLeadingWidth: sy(5),
          leading: Container(
            alignment: Alignment.center,
            width: sy(36),
            height: sy(36),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index % 2 == 0 ? Colors.white : greyColor1,
            ),
            child: Text(
              number,
              style: googlePoppinsMedium.copyWith(
                fontSize: 20,
                color: blueColor,
              ),
            ),
          ),
          title: Text(
            textArab,
            style: arabicFont.copyWith(
              fontSize: 24,
            ),
            textAlign: TextAlign.right,
          ),
          subtitle: Text(
            idAyat,
            style: googlePoppinsRegular.copyWith(
              letterSpacing: 0.3,
              color: Colors.grey,
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      );
    });
  }

  _showBottomSheet({
    @required String idPeople,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return RelativeBuilder(
          builder: (context, height, width, sy, sx) {
            return Container(
              height: sy(500),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        height: sy(50),
                        child: TextFormField(
                          controller: firstFilter,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: '0',
                            hintStyle: googlePoppinsMedium.copyWith(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        height: sy(50),
                        child: TextFormField(
                          controller: lastFilter,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: '150',
                            hintStyle: googlePoppinsMedium.copyWith(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: blueColor, // background
                          ),
                          onPressed: () {
                            _haditsBloc
                              ..add(
                                GetListHaditsPeopleRange(
                                  idPeople: idPeople,
                                  range:
                                      '${firstFilter.text}-${lastFilter.text}',
                                ),
                              );
                          },
                          child: Text(
                            'Filter',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _haditsBloc
                              ..add(
                                GetListHaditsPeople(
                                  idPeople: idPeople,
                                ),
                              );
                          },
                          child: Text(
                            'Reset Filter',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
