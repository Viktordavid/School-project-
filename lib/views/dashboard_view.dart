import 'package:flutter/material.dart';
import 'package:school_project/models/dashboard_item.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';
import 'package:school_project/models/models.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<DashboardItem> _items = DashboardItem.dashboardItems;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      resetSelectedStatus();
      context
          .read<SearchViewModel>()
          .initAnimalDetails(AnimalDetail.animalDetails);
    });
  }

  void resetSelectedStatus() {
    _items.forEach((item) {
      item.selected = false;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      onWillPop: () {
        context.read<DashboardViewModel>().exitApp();
      },
      appBar: AppBar(
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      builder: (context, size) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              for (var item in _items)
                DashboardCard(
                  icon: item.icon,
                  title: item.title,
                  selected: item.selected!,
                  onTap: () {
                    _items.forEach((e) {
                      if (e.title == item.title) {
                        item.selected = true;
                      } else {
                        e.selected = false;
                      }
                    });
                    setState(() {});
                    context.read<DashboardViewModel>().navigateTo(item.route);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
