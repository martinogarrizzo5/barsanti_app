import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart' hide SearchBar;

class BarsantiSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? searchFocusNode;
  final void Function(String) onSearch;

  const BarsantiSearchBar({
    super.key,
    required this.onSearch,
    this.searchFocusNode,
    this.controller,
  });

  @override
  State<BarsantiSearchBar> createState() => _BarsantiSearchBarState();
}

class _BarsantiSearchBarState extends State<BarsantiSearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        controller: _searchController,
        focusNode: widget.searchFocusNode,
        onSubmitted: widget.onSearch,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: AppColors.searchBar,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          hintText: "Cerca qualcosa...",
          hintStyle: const TextStyle(
            color: AppColors.placeholderText,
          ),
          suffixIcon: InkWell(
            onTap: () => widget.onSearch(_searchController.text),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                AppIcons.search,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
