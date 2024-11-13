import 'dart:developer';

import 'package:dashboard_template/src/models/side_menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  bool isMenuOpen = true;

  Widget? currentContentWidget;

  late final List<SideMenuItemModel> sideMenuItems;
  List<SideMenuItemModel> buildSideMenuItems() {
    return [
      SideMenuItemModel(
        leadingIcon: const Icon(Icons.home),
        title: "Dashboard",
        onTap: () {
          updateContentWidget(contentWidget: const Text("Dashboard"));
          log("Dashboard");
        },
      ),
      SideMenuItemModel(
        leadingIcon: const Icon(Icons.settings),
        title: "Settings",
        onTap: () {
          updateContentWidget(contentWidget: const Text("Settings"));
          log("Settings");
        },
      ),
      SideMenuItemModel(
        leadingIcon: const Icon(Icons.more_horiz),
        title: "SubItems",
        children: [
          SideMenuItemModel(
            leadingIcon: const Icon(Icons.numbers),
            title: "SubItem 1",
            onTap: () {
              updateContentWidget(contentWidget: const Text("SubItem 1"));
              log("SubItem");
            },
          ),
        ],
        onTap: () {
          expandList(index: 2);
          log("SubItems");
        },
      ),
      SideMenuItemModel(
        leadingIcon: const Icon(Icons.logout),
        title: "Logout",
        onTap: () {
          updateContentWidget(contentWidget: const Text("Logout"));
          log("Logout");
        },
      ),
    ];
  }

  void buildTrailingIcon() {
    for (var i = 0; i < sideMenuItems.length; i++) {
      if (sideMenuItems[i].children != null) {
        sideMenuItems[i].isExpanded == true
            ? sideMenuItems[i] = sideMenuItems[i].copyWith(
                trailingIcon: const Icon(Icons.keyboard_arrow_up),
              )
            : sideMenuItems[i] = sideMenuItems[i].copyWith(
                trailingIcon: const Icon(Icons.keyboard_arrow_down),
              );
      }
    }
  }

  void expandList({required int index}) {
    sideMenuItems[index] = sideMenuItems[index]
        .copyWith(isExpanded: !sideMenuItems[index].isExpanded);
    buildTrailingIcon();
    update();
  }

  @override
  void onInit() {
    sideMenuItems = buildSideMenuItems();
    buildTrailingIcon();
    super.onInit();
  }

  void toggleMenu() {
    isMenuOpen = !isMenuOpen;
    update();
  }

  void updateContentWidget({required Widget contentWidget}) {
    currentContentWidget = contentWidget;
    update();
  }
}
