import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sky_booker/presentation/resources/color_manager.dart';
import 'package:sky_booker/presentation/resources/text_style.dart';

import '../../resources/string_manger.dart';
import '../../resources/value_manger.dart';
import 'main_search.dart';

class Place {
  final String name;
  final String country;

  Place({required this.name, required this.country});

  Map<String, String> toJson() => {
        'name': name,
        'country': country,
      };

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      country: json['country'],
    );
  }
}

class RecentPlacesService {
  static const int maxRecentPlaces = 3;

  Future<List<Place>> getRecentPlaces() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recentPlacesJson = prefs.getStringList('recent_places') ?? [];

    return recentPlacesJson.map((placeJson) {
      try {
        final Map<String, dynamic> jsonMap = json.decode(placeJson);
        return Place.fromJson(jsonMap);
      } catch (e) {
        print("Error decoding JSON: $e");
        return Place(name: 'Unknown', country: 'Unknown');
      }
    }).toList();
  }

  Future<void> addPlace(Place place) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recentPlacesJson = prefs.getStringList('recent_places') ?? [];

    // Remove existing place if present
    recentPlacesJson.removeWhere((jsonStr) {
      try {
        final placeMap = json.decode(jsonStr);
        return Place.fromJson(placeMap).name == place.name;
      } catch (e) {
        print("Error decoding JSON for removal: $e");
        return false;
      }
    });

    // Add new place
    recentPlacesJson.insert(0, json.encode(place.toJson()));

    // Ensure the list doesn't exceed the max limit
    if (recentPlacesJson.length > maxRecentPlaces) {
      recentPlacesJson = recentPlacesJson.sublist(0, maxRecentPlaces);
    }

    await prefs.setStringList('recent_places', recentPlacesJson);
  }
}

class FullScreenDialog extends StatefulWidget {
  final String headerText;
  final String searchText;
  final Function(String) onPlaceSelected; // Callback function

  FullScreenDialog({
    Key? key,
    required this.headerText,
    required this.searchText,
    required this.onPlaceSelected,
  }) : super(key: key);

  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<String> _searchResults = [];
  List<Place> _recentPlaces = [];
  final List<Map<String, String>> _suggestedPlaces = [
    {
      'place': 'Jeddah King Abdulaziz Airport',
      'code': 'JED',
      'country': 'Saudi Arabia'
    },
    {
      'place': 'London Heathrow Airport',
      'code': 'LHR',
      'country': 'United Kingdom'
    },
    {
      'place': 'Paris Charles de Gaulle Airport',
      'code': 'CDG',
      'country': 'France'
    },
    {'place': 'Tokyo Haneda Airport', 'code': 'HND', 'country': 'Japan'},
    {'place': 'New York JFK Airport', 'code': 'JFK', 'country': 'USA'},
    {
      'place': 'Dubai International Airport',
      'code': 'DXB',
      'country': 'United Arab Emirates'
    },
    {
      'place': 'Singapore Changi Airport',
      'code': 'SIN',
      'country': 'Singapore'
    },
    {
      'place': 'Hong Kong International Airport',
      'code': 'HKG',
      'country': 'Hong Kong'
    },
    {
      'place': 'Sydney Kingsford Smith Airport',
      'code': 'SYD',
      'country': 'Australia'
    },
    {'place': 'Istanbul Airport', 'code': 'IST', 'country': 'Turkey'},
  ];
  late Future<void> _recentPlacesFuture;

  final RecentPlacesService _recentPlacesService = RecentPlacesService();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _recentPlacesFuture = _loadRecentPlaces();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isNotEmpty) {
      _performSearch(_searchController.text);
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;

      setState(() {
        _searchResults = [
          'Airport 1',
          'Airport 2',
          'Airport 3'
        ]; // Example results
      });
    } catch (e) {
      // Handle search error
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadRecentPlaces() async {
    final places = await _recentPlacesService.getRecentPlaces();
    if (mounted) {
      setState(() {
        _recentPlaces = places;
      });
    }
  }

  Future<void> _addRecentPlace(Place place) async {
    await _recentPlacesService.addPlace(place);
    _loadRecentPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * .04),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(AppPadding.p20),
        decoration: const BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppSize.s10),
            topLeft: Radius.circular(AppSize.s10),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: ColorManager.black,
                    size: AppSize.s30,
                  ),
                ),
                const SizedBox(width: AppSize.s15),
                Text(
                  widget.headerText,
                  style: AppTextStyles.dialogHeaderTextStyle(context),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s15),
            Divider(
              color: ColorManager.grey.withOpacity(.5),
              height: AppSize.s1,
              thickness: AppSize.s1,
            ),
            const SizedBox(height: AppSize.s10),
            MainSearchTextField(
              hint: AppStrings.searchHint.tr(),
              controller: _searchController,
              cursorColor: ColorManager.secondary,
              surfixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: const Icon(Icons.highlight_remove,
                          size: AppSize.s25, color: ColorManager.darkGrey),
                    )
                  : null,
            ),
            const SizedBox(height: AppSize.s10),
            Expanded(
              child:
                  _isLoading ? _buildShimmerLoading() : _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: ColorManager.grey.withOpacity(0.2),
      highlightColor: ColorManager.grey.withOpacity(0.1),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.s8, horizontal: AppSize.s16),
          child: Row(
            children: [
              Container(
                width: AppSize.s60,
                height: AppSize.s60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              const SizedBox(width: AppSize.s16),
              // Shimmer effect for title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s20,
                      color: Colors.white,
                    ),
                    const SizedBox(height: AppSize.s8),
                    Container(
                      width: double.infinity,
                      height: AppSize.s14,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchController.text.isEmpty) {
      return _buildRecentAndSuggestedPlaces();
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Text('No results found',
            style: AppTextStyles.hintTextFieldTextStyle(context)),
      );
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_searchResults[index],
            style: AppTextStyles.textFieldTextStyle(context)),
        onTap: () {
          _addRecentPlace(
              Place(name: _searchResults[index], country: 'Unknown'));
          widget.onPlaceSelected(_searchResults[index]);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildRecentAndSuggestedPlaces() {
    bool hasRecentPlaces = _recentPlaces.isNotEmpty;

    return ListView(
      children: [
        if (hasRecentPlaces) ...[
          Text(
            AppStrings.recentPlaces.tr(),
            style: AppTextStyles.generalTitleTextStyle(context),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _recentPlaces.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(
                Icons.saved_search_outlined,
                size: AppSize.s34,
              ),
              title: Text(
                _recentPlaces[index].name,
                style: AppTextStyles.generalTitleTextStyle(context),
              ),
              subtitle: Text(
                _recentPlaces[index].country,
                style: AppTextStyles.generalSubTitleTextStyle(context),
              ),
              onTap: () {
                widget.onPlaceSelected(_recentPlaces[index].name);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: AppSize.s10),
        ],
        if (_suggestedPlaces.isNotEmpty) ...[
          Text(
            AppStrings.suggestedPlaces.tr(),
            style: AppTextStyles.generalTitleTextStyle(context),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // Prevent scrolling inside the ListView
            itemCount: _suggestedPlaces.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(
                Icons.flight,
                size: AppSize.s24,
              ),
              title: Text(
                _suggestedPlaces[index]['place']!,
                style: AppTextStyles.generalTitleTextStyle(context),
              ),
              subtitle: Text(
                _suggestedPlaces[index]['country']!,
                style: AppTextStyles.generalSubTitleTextStyle(context),
              ),
              onTap: () {
                _addRecentPlace(
                  Place(
                    name: _suggestedPlaces[index]['place']!,
                    country: _suggestedPlaces[index]['country']!,
                  ),
                );
                widget.onPlaceSelected(_suggestedPlaces[index]['place']!);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ],
    );
  }
}
