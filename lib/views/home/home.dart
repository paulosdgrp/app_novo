import 'package:app/views/home/widgets/home_footer.dart';
import 'package:app/views/home/widgets/home_groups_list.dart';
import 'package:app/views/home/widgets/home_search_bar.dart';
import 'package:app/views/home/widgets/home_welcome.dart';
import 'package:app/views/home/widgets/new_group_dialog.dart';
import 'package:app/views/home/widgets/user_header.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'models/device_group.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<DeviceGroup> _groups = [];
  late String _searchText = '';

  _createGroup(String name, String location) {
    setState(() {
      _groups.add(DeviceGroup(
        name: name,
        location: location,
      ));
    });
  }

  _filterGrop() {
    setState(() {
      _groups
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    });
  }

  _search(String text) {
    setState(() {
      _searchText = text;
    });

    _filterGrop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.BackgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            children: [
              const UserHeader(),
              const SizedBox(height: 36),
              HomeSearchBar(onChanged: (String text) {
                _search(text);
              }),
              _groups.isEmpty ? const Spacer() : const SizedBox(height: 24),
              _groups.isEmpty
                  ? const HomeWelcome()
                  : HomeGroupsList(groups: _groups),
              const Spacer(),
              HomeFooter(
                createDevice: () {},
                createGroup: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return NewGroupDialog(_createGroup);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
