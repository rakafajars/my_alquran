import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/bloc/b_hadits/hadits_bloc.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_people/hadits_people_arguments.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:my_alquran/ui/widget/loading_progress.dart';
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
                  onPressed: () {},
                ),
              ],
            ),
            body: BlocConsumer<HaditsBloc, HaditsState>(
              listener: (context, state) {
                if (state is ListHaditsPeopleLoadInProgress) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              builder: (context, state) {
                if (state is ListHaditsPeopleLoadInProgress) {
                  return LoadingProgress();
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
                        return Container(
                          padding: EdgeInsets.only(
                            top: 12,
                            right: 20,
                            bottom: 16,
                          ),
                          width: double.infinity,
                          color: index % 2 == 0
                              ? Color(0xFFF0F5FC)
                              : Colors.white,
                          child: ListTile(
                            dense: true,
                            minLeadingWidth: sy(5),
                            leading: Container(
                              alignment: Alignment.center,
                              width: sy(36),
                              height: sy(36),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index % 2 == 0
                                    ? Colors.white
                                    : greyColor1,
                              ),
                              child: Text(
                                state.hadits[index].number.toString(),
                                style: googlePoppinsMedium.copyWith(
                                  fontSize: 20,
                                  color: blueColor,
                                ),
                              ),
                            ),
                            title: Text(
                              state.hadits[index].arab,
                              style: arabicFont.copyWith(
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            subtitle: Text(
                              state.hadits[index].id,
                              style: googlePoppinsRegular.copyWith(
                                letterSpacing: 0.3,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
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
}
