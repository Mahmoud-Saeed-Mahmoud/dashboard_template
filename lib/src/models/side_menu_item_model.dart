import 'package:flutter/material.dart';

class SideMenuItemModel {
  final dynamic id;

  final String title;

  final Widget? leadingIcon;

  final Widget? trailingIcon;

  final VoidCallback? onTap;

  final List<SideMenuItemModel> children;

  final bool isExpanded;

  final bool isSelected;

  SideMenuItemModel({
    required this.id,
    required this.title,
    this.children = const [],
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.isExpanded = false,
    this.isSelected = false,
  });

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SideMenuItemModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  SideMenuItemModel copyWith({
    String? title,
    Widget? leadingIcon,
    Widget? trailingIcon,
    VoidCallback? onTap,
    Widget? content,
    List<SideMenuItemModel>? children,
    bool? isExpanded,
    bool? isSelected,
  }) {
    return SideMenuItemModel(
      id: id,
      title: title ?? this.title,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      onTap: onTap ?? this.onTap,
      children: children ?? this.children,
      isExpanded: isExpanded ?? this.isExpanded,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  String toString() {
    return 'SideMenuItemModel{id: $id, title: $title, leadingIcon: $leadingIcon, trailingIcon: $trailingIcon, onTap: $onTap, children: $children, isExpanded: $isExpanded, isSelected: $isSelected}';
  }
}
