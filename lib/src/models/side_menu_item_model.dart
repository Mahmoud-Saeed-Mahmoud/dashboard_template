import 'package:flutter/material.dart';

class SideMenuItemModel {
  final String title;

  final Widget? leadingIcon;

  final Widget? trailingIcon;

  final VoidCallback? onTap;

  final List<SideMenuItemModel>? children;

  final bool isExpanded;

  SideMenuItemModel({
    required this.title,
    this.children,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.isExpanded = false,
  });

  SideMenuItemModel copyWith({
    String? title,
    Widget? leadingIcon,
    Widget? trailingIcon,
    VoidCallback? onTap,
    Widget? content,
    List<SideMenuItemModel>? children,
    bool? isExpanded,
  }) {
    return SideMenuItemModel(
      title: title ?? this.title,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      onTap: onTap ?? this.onTap,
      children: children ?? this.children,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
