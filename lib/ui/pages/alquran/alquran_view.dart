import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_alquran/bloc/b_alquran/alquran_bloc.dart';
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
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            appBar: AppBar(
              title: Text('Al-Quran App'),
            ),
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.modelListAlQuran.data.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            height: sy(50),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: ListTile(
                              leading: Text('${index + 1}'),
                              title: Row(
                                children: [
                                  Text(
                                    state.modelListAlQuran.data[index].name
                                        .transliteration.id,
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: sy(12),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ' (${state.modelListAlQuran.data[index].name.translation.id})',
                                    style: GoogleFonts.lato(
                                      fontSize: sy(8),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                '${state.modelListAlQuran.data[index].numberOfVerses} Ayat',
                                style: GoogleFonts.robotoMono(
                                  fontSize: sy(12),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: Text(
                                state.modelListAlQuran.data[index].name.short,
                                style: GoogleFonts.robotoSlab(
                                  fontSize: sy(12),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              dense: true,
                            ),
                          );
                        },
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
