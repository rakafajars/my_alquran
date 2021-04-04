import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_alquran/config/route_name.dart';
import 'package:my_alquran/cubit/c_hadits/hadits_cubit.dart';
import 'package:my_alquran/theme/theme_color.dart';
import 'package:my_alquran/theme/theme_text.dart';
import 'package:my_alquran/ui/pages/hadits/hadits_people/hadits_people_arguments.dart';
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
            backgroundColor: whiteColor,
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
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.ListHaditsPeople,
                            arguments: HaditsPeopleArguments(
                              idPeople: state.modeListHadits.data[index].id,
                              namePeople: state.modeListHadits.data[index].name,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: sy(32),
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
                                    '${index + 1}',
                                    style: googlePoppinsMedium.copyWith(
                                      fontSize: 20,
                                      color: blueColor,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  state.modeListHadits.data[index].name,
                                  style: googlePoppinsMedium.copyWith(
                                    fontSize: 16,
                                    color: blackColor1,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                trailing: Text(
                                  state.modeListHadits.data[index].available
                                      .toString(),
                                  style: googlePoppinsRegular.copyWith(
                                    letterSpacing: 0.3,
                                    color: Colors.grey,
                                    fontSize: 12,
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
