import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/side_menu_controller.dart';

class AdminDashboardScreen extends GetView<SideMenuController> {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SideMenuController>(
        builder: (_) {
          return Row(
            children: [
              AnimatedContainer(
                padding: const EdgeInsets.only(bottom: 20),
                width: controller.isMenuOpen ? 300 : 60,
                duration: const Duration(milliseconds: 300),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      color: Colors.blue[900],
                      child: Column(
                        children: [
                          // Logo or Admin Header
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: AnimatedScale(
                              scale: controller.isMenuOpen ? 1 : 0.5,
                              duration: const Duration(milliseconds: 300),
                              child: const Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 50,
                              ),
                            ),
                          ).paddingSymmetric(horizontal: 5),
                          const SizedBox(height: 10),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            child: controller.isMenuOpen
                                ? const Text(
                                    'Admin Dashboard',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          );
                        },
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        itemCount: controller.sideMenuItems.length,
                        itemBuilder: (context, index) {
                          return AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            child: InkWell(
                              onTap: controller.sideMenuItems[index].onTap,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      controller.sideMenuItems[index]
                                              .leadingIcon ??
                                          const SizedBox.shrink(),
                                      AnimatedSize(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: controller.isMenuOpen
                                            ? const SizedBox(width: 10)
                                            : const SizedBox.shrink(),
                                      ),
                                      AnimatedSize(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: controller.isMenuOpen
                                            ? Text(
                                                controller
                                                    .sideMenuItems[index].title,
                                                style: TextStyle(
                                                  color: controller
                                                          .sideMenuItems[index]
                                                          .isSelected
                                                      ? Colors.blue
                                                      : Colors.black,
                                                  fontSize: 16,
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      const Spacer(),
                                      AnimatedSize(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: controller.isMenuOpen
                                            ? controller.sideMenuItems[index]
                                                    .trailingIcon ??
                                                const SizedBox.shrink()
                                            : const SizedBox.shrink(),
                                      ),
                                    ],
                                  ),
                                  if (controller
                                      .sideMenuItems[index].isExpanded)
                                    ...controller.sideMenuItems[index].children
                                        .map(
                                      (child) => InkWell(
                                        onTap: child.onTap,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                  left: 5,
                                                ),
                                              ),
                                              child.leadingIcon ??
                                                  const SizedBox.shrink(),
                                              AnimatedSize(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                child: controller.isMenuOpen
                                                    ? const SizedBox(width: 10)
                                                    : const SizedBox.shrink(),
                                              ),
                                              AnimatedSize(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                child: controller.isMenuOpen
                                                    ? Text(
                                                        child.title,
                                                        style: TextStyle(
                                                          color: child
                                                                  .isSelected
                                                              ? Colors.blue
                                                              : Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ),
                                              const Spacer(),
                                              AnimatedSize(
                                                duration: const Duration(
                                                  milliseconds: 300,
                                                ),
                                                child: controller.isMenuOpen
                                                    ? child.trailingIcon ??
                                                        const SizedBox.shrink()
                                                    : const SizedBox.shrink(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Arrow Button to toggle the menu
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: controller.isMenuOpen
                          ? AlignmentDirectional.centerEnd
                          : AlignmentDirectional.center,
                      child: IconButton(
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return RotationTransition(
                              turns: animation,
                              child: child,
                            );
                          },
                          child: Icon(
                            key: ValueKey<bool>(controller.isMenuOpen),
                            controller.isMenuOpen
                                ? Icons.arrow_back
                                : Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: controller.toggleMenu,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: controller.currentContentWidget,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
