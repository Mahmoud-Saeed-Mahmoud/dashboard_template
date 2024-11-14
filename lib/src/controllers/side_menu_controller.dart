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
        id: "dashboard",
        leadingIcon: const Icon(Icons.home),
        title: "Dashboard",
        onTap: () {
          setSelectedItem(id: sideMenuItems[0].id);
          updateContentWidget(contentWidget: const Text("Dashboard"));
        },
      ),
      SideMenuItemModel(
        id: "settings",
        leadingIcon: const Icon(Icons.settings),
        title: "Settings",
        onTap: () {
          setSelectedItem(id: sideMenuItems[1].id);
          updateContentWidget(contentWidget: const Text("Settings"));
        },
      ),
      SideMenuItemModel(
        id: "subitems",
        leadingIcon: const Icon(Icons.more_horiz),
        title: "SubItems",
        children: [
          SideMenuItemModel(
            id: "subitem1",
            leadingIcon: const Icon(Icons.numbers),
            title: "SubItem 1",
            onTap: () {
              setSelectedItem(id: sideMenuItems[2].children[0].id);
              updateContentWidget(contentWidget: const Text("SubItem 1"));
            },
          ),
          SideMenuItemModel(
            id: "subitem2",
            leadingIcon: const Icon(Icons.numbers),
            title: "SubItem 2",
            onTap: () {
              setSelectedItem(id: sideMenuItems[2].children[1].id);
              updateContentWidget(contentWidget: const Text("SubItem 2"));
            },
          ),
        ],
        onTap: () {
          setSelectedItem(id: sideMenuItems[2].id);
          expandList(index: 2);
        },
      ),
      SideMenuItemModel(
        id: "logout",
        leadingIcon: const Icon(Icons.logout),
        title: "Logout",
        onTap: () {
          setSelectedItem(id: sideMenuItems[3].id);
          updateContentWidget(contentWidget: const Text("Logout"));
        },
      ),
    ];
  }

  void buildTrailingIcon() {
    for (var i = 0; i < sideMenuItems.length; i++) {
      if (sideMenuItems[i].children.isNotEmpty) {
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
    for (var element in sideMenuItems) {
      element = element.copyWith(isExpanded: false);
    }
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

  void setSelectedItem({required dynamic id}) {
    bool found = false;
    for (var element in sideMenuItems) {
      if (element.id == id) {
        sideMenuItems[sideMenuItems.indexOf(element)] =
            sideMenuItems[sideMenuItems.indexOf(element)]
                .copyWith(isSelected: true);
        found = true;
        break;
      }
    }
    if (found) {
      for (var element in sideMenuItems) {
        if (element.id == id) continue;
        sideMenuItems[sideMenuItems.indexOf(element)] =
            sideMenuItems[sideMenuItems.indexOf(element)]
                .copyWith(isSelected: false);
        sideMenuItems[sideMenuItems.indexOf(element)] =
            sideMenuItems[sideMenuItems.indexOf(element)].copyWith(
          children: sideMenuItems[sideMenuItems.indexOf(element)]
              .children
              .map((e) => e = e.copyWith(isSelected: false))
              .toList(),
        );
      }
    } else if (!found) {
      for (var element in sideMenuItems) {
        sideMenuItems[sideMenuItems.indexOf(element)] =
            sideMenuItems[sideMenuItems.indexOf(element)]
                .copyWith(isSelected: false);
        sideMenuItems[sideMenuItems.indexOf(element)] =
            sideMenuItems[sideMenuItems.indexOf(element)].copyWith(
          children: sideMenuItems[sideMenuItems.indexOf(element)]
              .children
              .map((e) => e = e.copyWith(isSelected: false))
              .toList(),
        );
        if (element.children.isNotEmpty) {
          for (var child in element.children) {
            if (child.id == id) {
              sideMenuItems[sideMenuItems.indexOf(element)] =
                  sideMenuItems[sideMenuItems.indexOf(element)].copyWith(
                isSelected: true,
              );
              sideMenuItems[sideMenuItems.indexOf(element)].children[
                      sideMenuItems[sideMenuItems.indexOf(element)]
                          .children
                          .indexOf(child)] =
                  sideMenuItems[sideMenuItems.indexOf(element)]
                      .children[sideMenuItems[sideMenuItems.indexOf(element)]
                          .children
                          .indexOf(child)]
                      .copyWith(isSelected: true);
            } else {
              sideMenuItems[sideMenuItems.indexOf(element)].children[
                      sideMenuItems[sideMenuItems.indexOf(element)]
                          .children
                          .indexOf(child)] =
                  sideMenuItems[sideMenuItems.indexOf(element)]
                      .children[sideMenuItems[sideMenuItems.indexOf(element)]
                          .children
                          .indexOf(child)]
                      .copyWith(isSelected: false);
            }
          }
        }
      }
    }
    update();
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
