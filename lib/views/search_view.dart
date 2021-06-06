import 'package:flutter/material.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchVM = context.read<SearchViewModel>();
    var reactiveSearchVM = context.watch<SearchViewModel>();
    return ResponsiveWidget(
        appBar: AppBar(
          title: Text('Search MicroChips'),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              searchVM.goBack();
            },
          ),
        ),
        builder: (context, size) {
          return Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                CustomSpacer(flex: 3),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: TextField(
                    controller: searchVM.searchController,
                    focusNode: searchVM.searchFocus,
                    onChanged: (_) {
                      reactiveSearchVM.search();
                    },
                    decoration: InputDecoration(
                      hintText: 'Search micro chips',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          reactiveSearchVM.search();
                        },
                      ),
                      filled: true,
                      fillColor: Theme.of(context).primaryColorLight,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.h),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.h),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.h),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomSpacer(flex: 5),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: reactiveSearchVM.searchResults.length,
                      itemBuilder: (context, index) {
                        var animalDetail =
                            reactiveSearchVM.searchResults[index];
                        return Column(
                          children: [
                            ListTile(
                              tileColor: Theme.of(context).primaryColorLight,
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 20.h,
                                    child:
                                        Image.asset('assets/images/chip.png'),
                                  ),
                                  CustomSpacer(horizontal: true),
                                  VerticalDivider(
                                    indent: 12.h,
                                    endIndent: 12.h,
                                    width: 5.w,
                                    color: Theme.of(context)
                                        .primaryColorDark
                                        .withOpacity(.4),
                                  )
                                ],
                              ),
                              title: Container(
                                width: size.width,
                                child: Text(
                                  animalDetail.chipNo,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onTap: () {
                                context
                                    .read<MicroChipsViewModel>()
                                    .navigateToDetailsView(animalDetail);
                              },
                            ),
                            CustomSpacer(),
                          ],
                        );
                      }),
                ),
                CustomSpacer(flex: 3),
              ],
            ),
          );
        });
  }
}
