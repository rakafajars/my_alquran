import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_alquran/cubit/c_hadits/hadits_cubit.dart';
import 'package:my_alquran/ui/widget/custome_page.dart';
import 'package:relative_scale/relative_scale.dart';

class HaditsViewPage extends StatefulWidget {
  @override
  _HaditsViewPageState createState() => _HaditsViewPageState();
}

class _HaditsViewPageState extends State<HaditsViewPage> {
  @override
  void initState() {
    super.initState();
    context.read<HaditsCubit>().getListHadits();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return CustomePage(
          scaffold: Scaffold(
            appBar: AppBar(
              title: Text('List Hadits'),
            ),
            body: BlocConsumer<HaditsCubit, HaditsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ListHaditsLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ListHaditsLoadedSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.modeListHadits.data.length,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
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
                            title: Text(
                              state.modeListHadits.data[index].name,
                              style: GoogleFonts.robotoSlab(
                                fontSize: sy(12),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Text(
                              state.modeListHadits.data[index].available
                                  .toString(),
                              style: GoogleFonts.robotoMono(
                                fontSize: sy(12),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is ListHaditsLoadedError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.message,
                        ),
                        ElevatedButton(
                          onPressed: () {},
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
