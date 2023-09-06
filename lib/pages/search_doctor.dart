import 'package:appointment_app/models/doctor_data.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/utils/config.dart';
import 'package:appointment_app/widgets/custom_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  final _searchController = TextEditingController();
  List<DoctorModel> doctorDataList =
      doctorMapList.map((e) => DoctorModel.fromJson(e)).toList();

  List<DoctorModel> displayList = List.from(doctorMapList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appTitle: ""),
      body: Container(
        decoration: Config.gradientBG(),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            children: [
              Config.textFormField(
                _searchController,
                TextInputType.name,
                "Doktor Ara",
                const Icon(FluentIcons.search_16_regular),
                false,
                true,
                () {},
                (value) {
                  // updateList(value);
                },
              ),
              Config.spaceSmall,
              Expanded(
                child: ListView.builder(
                  itemCount: doctorDataList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Container(
                      padding: Config.paddingSymetric(),
                      height: 150,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/doctor_details1");
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          color: const Color.fromRGBO(241, 241, 241, 1),
                          child: Row(children: [
                            SizedBox(
                              width: Config.widthSize * 0.25,
                              child: Image.asset(
                                doctorDataList[index].image!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: Config.paddingSymetric(),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Config.spaceSmall,
                                        Text(
                                          softWrap: true,
                                          doctorDataList[index].name!,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 122,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                FluentIcons.ios_arrow_24_regular,
                                size: 30,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void updateList(String value) {
  //   setState(() {
  //     displayList = displayList
  //         .where((element) =>
  //             element.name!.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }
}
