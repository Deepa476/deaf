import 'package:deaf/Animals.dart';
import 'package:deaf/Fruits.dart';
import 'package:deaf/ProfilePage.dart';
import 'package:deaf/Shape.dart';
import 'package:deaf/Vegetable.dart';
import 'package:deaf/WordModuleCard.dart';
import 'package:deaf/ProgressTracking.dart';
import 'package:deaf/choose_action.dart';
import 'package:flutter/material.dart';
import 'AlphabetsPage.dart';

// Navigation routes enum
enum AppRoutes { home, courses, assignment, settings, profile }

// Module data class
class ModuleData {
  final String name;
  final String gujaratiTranslation;
  final Widget page;

  ModuleData({required this.name, required this.gujaratiTranslation, required this.page});
}

class LearningModulesPage extends StatefulWidget {
  const LearningModulesPage({super.key});

  @override
  State<LearningModulesPage> createState() => _LearningModulesPageState();
}

class _LearningModulesPageState extends State<LearningModulesPage> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static final List<ModuleData> _allModules = [
    ModuleData(name: 'Alphabets', gujaratiTranslation: 'અક્ષરમાળા', page: const AlphabetsPage()),
    ModuleData(name: 'Words', gujaratiTranslation: 'શબ્દો', page: DailyWordsPage()),
    ModuleData(name: 'Numbers', gujaratiTranslation: 'અંક', page: const SizedBox()),
    ModuleData(name: 'Animals', gujaratiTranslation: 'પ્રાણીઓ', page: AnimalApp()),
    ModuleData(name: 'Colors', gujaratiTranslation: 'રંગો', page: const SizedBox()),
    ModuleData(name: 'Shapes', gujaratiTranslation: 'આકારો', page: ShapeAppPage()),
    ModuleData(name: 'Fruits', gujaratiTranslation: 'ફળો', page: FruitsPage()),
    ModuleData(name: 'Vegetables', gujaratiTranslation: 'શાકભાજી', page: VegetableList()),
    ModuleData(name: 'Body Parts', gujaratiTranslation: 'શરીરના ભાગો', page: const SizedBox()),
    ModuleData(name: 'Family', gujaratiTranslation: 'પરિવાર', page: const SizedBox()),
    ModuleData(name: 'Daily Activities', gujaratiTranslation: 'દૈનિક પ્રવૃત્તિઓ', page: const SizedBox()),
    ModuleData(name: 'Emotions', gujaratiTranslation: 'ભાવનાઓ', page: const SizedBox()),
    ModuleData(name: 'Weather', gujaratiTranslation: 'હવામાન', page: const SizedBox()),
    ModuleData(name: 'Transportation', gujaratiTranslation: 'વાહનવ્યવસ્થા', page: const SizedBox()),
    ModuleData(name: 'Occupations', gujaratiTranslation: 'વ્યાવસાય', page: const SizedBox()),
    ModuleData(name: 'Food and Drinks', gujaratiTranslation: 'ખોરાક અને પીણાં', page: const SizedBox()),
    ModuleData(name: 'Household Items', gujaratiTranslation: 'ઘરના સામાન', page: const SizedBox()),
    ModuleData(name: 'Nature', gujaratiTranslation: 'કુદરત', page: const SizedBox()),
    ModuleData(name: 'Hobbies', gujaratiTranslation: 'શોખ', page: const SizedBox()),
    ModuleData(name: 'Festivals', gujaratiTranslation: 'તહેવારો', page: const SizedBox()),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToRoute(int index) {
    setState(() => _selectedIndex = index);
    final routes = {
      AppRoutes.home: const ChooseActionPage(),
      AppRoutes.courses: const LearningModulesPage(),
      AppRoutes.assignment: const ProgressTracking(),
      AppRoutes.settings: const ProfilePage(),
      AppRoutes.profile: const ProfilePage(),
    };
    Navigator.push(context, MaterialPageRoute(builder: (context) => routes[AppRoutes.values[index]]!));
  }

  List<ModuleData> _getFilteredModules() {
    return _allModules.where((module) {
      final moduleName = module.name.toLowerCase();
      final gujaratiName = module.gujaratiTranslation.toLowerCase();
      final query = _searchQuery.toLowerCase();
      return moduleName.contains(query) || gujaratiName.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredModules = _getFilteredModules();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Uses Colors.blue from theme
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(onBackPressed: () => Navigator.pop(context)),
            SearchBar(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
            SectionHeader(title: 'Learning Modules'),
            ModulesList(
              modules: filteredModules,
              onModuleTap: (module) => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => module.page),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateToRoute,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;

  const CustomAppBar({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Matches LoginScreen shadow
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: theme.primaryColor, size: 28),
            onPressed: onBackPressed,
          ),
          Expanded(
            child: Text(
              'Signyy',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.primaryColor, // Uses Colors.blue
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48), // Balance the layout with back button
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBar({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Matches LoginScreen
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, // Matches LoginScreen shadow
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search modules...',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: theme.primaryColor, // Uses Colors.blue instead of lightBlueAccent
      child: Text(
        title,
        style: theme.textTheme.headlineLarge, // White, bold, 32pt from theme
      ),
    );
  }
}

class ModulesList extends StatelessWidget {
  final List<ModuleData> modules;
  final Function(ModuleData) onModuleTap;

  const ModulesList({super.key, required this.modules, required this.onModuleTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final module = modules[index];
          return AnimatedModuleCard(
            moduleName: module.name,
            gujaratiTranslation: module.gujaratiTranslation,
            onTap: () => onModuleTap(module),
            index: index,
          );
        },
      ),
    );
  }
}

class AnimatedModuleCard extends StatelessWidget {
  final String moduleName;
  final String gujaratiTranslation;
  final VoidCallback onTap;
  final int index;

  const AnimatedModuleCard({
    super.key,
    required this.moduleName,
    required this.gujaratiTranslation,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Matches LoginScreen
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, // Matches LoginScreen shadow
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32), // Matches LoginScreen inner padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                moduleName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor, // Uses Colors.blue
                ),
              ),
              const SizedBox(height: 8),
              Text(
                gujaratiTranslation,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  static const _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Courses'),
    BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Assignment'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Matches LoginScreen shadow
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _navItems,
        currentIndex: currentIndex,
        selectedItemColor: theme.primaryColor, // Uses Colors.blue
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: onTap,
      ),
    );
  }
}