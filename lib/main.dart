import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BHK1.dart';
import 'BHK2.dart';
import 'customer_bloc.dart';
import 'cutomer.dart';
import 'loan_bloc.dart';

void main() {
  debugPaintBaselinesEnabled = false;
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
        textTheme: Typography.material2021().black.apply(
          decoration: TextDecoration.none,
        ),
        primaryTextTheme: Typography.material2021().white.apply(
          decoration: TextDecoration.none,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoanBloc()),
          BlocProvider(create: (_) => CustomerBloc()),
        ],
        child: const HomeLoanScreens(),
      ),
    );
  }
}

class HomeLoanScreens extends StatelessWidget {
  const HomeLoanScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanBloc, LoanState>(
      builder: (context, state) {
        final bloc = context.read<LoanBloc>();
        return LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 720;
            final screens = IndexedStack(
              index: switch (state.screen) {
                ActiveLoanScreen.bhk1 => 0,
                ActiveLoanScreen.bhk2 => 1,
                ActiveLoanScreen.customer => 2,
              },
              children: const [BHK1(), BHK2(), Cutomer()],
            );
            final chips = Row(
              mainAxisAlignment: wide
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                _ScreenChip(
                  label: 'BHK1',
                  selected: state.screen == ActiveLoanScreen.bhk1,
                  onTap: () => bloc.add(const ShowBhk1()),
                ),
                const SizedBox(width: 8),
                _ScreenChip(
                  label: 'BHK2',
                  selected: state.screen == ActiveLoanScreen.bhk2,
                  onTap: () => bloc.add(const ShowBhk2()),
                ),
                const SizedBox(width: 8),
                _ScreenChip(
                  label: 'Customer',
                  selected: state.screen == ActiveLoanScreen.customer,
                  onTap: () => bloc.add(const ShowCustomer()),
                ),
              ],
            );
            if (!wide) {
              return Column(
                children: [
                  Expanded(child: screens),
                  ColoredBox(
                    color: const Color(0xFF0C1848),
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
                Positioned(top: 16, left: 16, child: chips),
              ],
            );
          },
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
              color: selected
                  ? const Color(0xFF8EA2FF)
                  : const Color(0xFF2C2B55),
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
