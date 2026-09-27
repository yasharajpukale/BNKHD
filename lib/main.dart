import 'package:flutter/material.dart';

import 'BHK1.dart';
import 'BHK2.dart';
import 'cutomer.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Loan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF3F1F6),
      ),
      home: const HomeLoanScreens(),
    );
  }
}

class HomeLoanScreens extends StatefulWidget {
  const HomeLoanScreens({super.key});

  @override
  State<HomeLoanScreens> createState() => _HomeLoanScreensState();
}

class _HomeLoanScreensState extends State<HomeLoanScreens> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = IndexedStack(
      index: _index,
      children: const [
        BHK1(),
        BHK2(),
        Cutomer(),
      ],
    );
    final chips = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ScreenChip(
          label: 'BHK1',
          selected: _index == 0,
          onTap: () => setState(() => _index = 0),
        ),
        const SizedBox(width: 8),
        _ScreenChip(
          label: 'BHK2',
          selected: _index == 1,
          onTap: () => setState(() => _index = 1),
        ),
        const SizedBox(width: 8),
        _ScreenChip(
          label: 'Customer',
          selected: _index == 2,
          onTap: () => setState(() => _index = 2),
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 720) {
          return Column(
            children: [
              Expanded(child: screens),
              ColoredBox(
                color: const Color(0xFF0C0B2B),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: chips,
                  ),
                ),
              ),
            ],
          );
        }
        return Stack(
          fit: StackFit.expand,
          children: [
            screens,
            Positioned(top: 12, right: 16, child: chips),
          ],
        );
      },
    );
  }
}

class _ScreenChip extends StatelessWidget {
  const _ScreenChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF2A3A86) : const Color(0xFF15143A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected ? const Color(0xFF8EA2FF) : const Color(0xFF2C2B55),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFFB7B7D0),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
