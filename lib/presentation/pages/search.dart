import "package:barsanti_app/presentation/theme/barsanti_icons.dart";
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/presentation/theme/styles.dart";
import "package:flutter/material.dart";

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: BarsantiStyles.scaffoldYPadding,
            horizontal: BarsantiStyles.scaffoldXPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: BarsantiColors.searchBar,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    hintText: "Cerca qualcosa...",
                    hintStyle: const TextStyle(
                      color: BarsantiColors.placeholderText,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        BarsantiIcons.search,
                        size: 32,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Column(),
            ],
          ),
        ),
      ),
    ));
  }
}
