// ignore_for_file: file_names

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'loan_widgets.dart';

class Cutomer extends StatefulWidget {
  const Cutomer({super.key});

  @override
  State<Cutomer> createState() => _CutomerState();
}

class _CutomerState extends State<Cutomer> {
  int _rating = 9;

  void _selectRating(int score) {
    setState(() => _rating = score);
  }

  void _submit() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Thanks for rating $_rating'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        decoration: TextDecoration.none,
        color: Color(0xFF1B1B1F),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      child: ColoredBox(
        color: const Color(0xFFF4F2F7),
        child: _MobileFrame(
          child: _CustomerScroll(
            rating: _rating,
            onSelect: _selectRating,
            onSubmit: _submit,
          ),
        ),
      ),
    );
  }
}

class _MobileFrame extends StatelessWidget {
  const _MobileFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth < 430 ? constraints.maxWidth : 430.0;
        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: width,
            height: constraints.maxHeight,
            child: child,
          ),
        );
      },
    );
  }
}

class _CustomerScroll extends StatelessWidget {
  const _CustomerScroll({
    required this.rating,
    required this.onSelect,
    required this.onSubmit,
  });

  final int rating;
  final ValueChanged<int> onSelect;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _SuccessHeader(),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 28),
                child: Transform.translate(
                  offset: const Offset(0, -34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _ApplicationCard(number: '648715188'),
                      const SizedBox(height: 14),
                      const _SummaryCard(),
                      const SizedBox(height: 14),
                      const _RepresentativeCard(),
                      const SizedBox(height: 16),
                      const _SanctionLetter(name: 'Mr. Aditya Sharma'),
                      const SizedBox(height: 16),
                      const _DownloadLetterButton(),
                      const SizedBox(height: 22),
                      const _OffersSection(),
                      const SizedBox(height: 16),
                      _FeedbackCard(
                        rating: rating,
                        onSelect: onSelect,
                        onSubmit: onSubmit,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

class _SuccessHeader extends StatelessWidget {
  const _SuccessHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0C1848),
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Hurray!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(
                width: 74,
                height: 74,
                child: CustomPaint(painter: SealCheckPainter()),
              ),
            ],
          ),
          const Text(
            'Your loan application is\nsubmitted successfully!',
            style: TextStyle(
              color: Color(0xFFF2F3F8),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.35,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _HeaderButton(
                  label: 'Share',
                  onTap: () => _toast(context, 'Share'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _HeaderButton(
                  label: 'Download',
                  onTap: () => _toast(context, 'Download'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1A2B66),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

class _ApplicationCard extends StatelessWidget {
  const _ApplicationCard({required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        children: [
          const ApplicationBadge(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Loan Application Number',
                  style: TextStyle(
                    color: kLabel,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  number,
                  style: const TextStyle(
                    color: kInk,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: number));
                if (!context.mounted) return;
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('Application number copied'),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                    ),
                  );
              },
              child: const Icon(
                Icons.copy_rounded,
                color: Color(0xFF3B6CFF),
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard();

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Home Loan Summary',
            style: TextStyle(
              color: kInk,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 18),
          const _SummaryLine(
            label: 'Loan Account Number',
            value: '1104659688',
          ),
          const SizedBox(height: 16),
          const _SummaryLine(
            label: 'Sanctioned Loan Amount',
            value: '₹90,00,000.00',
          ),
          const SizedBox(height: 16),
          const _SummaryLine(
            label: 'ROI & Tenure',
            value: '8.05% p.a. for 30 Years',
          ),
          const SizedBox(height: 16),
          const _SummaryLine(label: 'Monthly EMI', value: '₹67,919'),
          const SizedBox(height: 18),
          const Text(
            "We'll send you a confirmation message on both registered mobile number & email ID.",
            style: TextStyle(
              color: kBody,
              fontSize: 13,
              height: 1.4,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  const _SummaryLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: kLabel,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: kInk,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            height: 1.2,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

class _RepresentativeCard extends StatelessWidget {
  const _RepresentativeCard();

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bank Representative Details',
            style: TextStyle(
              color: kInk,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Contact the below person for any queries.',
            style: TextStyle(
              color: kBody,
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFE6E2EC)),
          const SizedBox(height: 14),
          _ContactRow(
            icon: Icons.person_outline_rounded,
            label: 'Name: ',
            value: 'Sharad Rao',
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFE6E2EC)),
          const SizedBox(height: 12),
          _ContactRow(
            icon: Icons.phone_android_rounded,
            label: 'Mobile: ',
            value: '9834938400',
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF8A8A96), size: 26),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            color: kInk,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: kInk,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

class _SanctionLetter extends StatelessWidget {
  const _SanctionLetter({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4E0EA)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xFF0B2A6B),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Row(
              children: [
                _BankMark(),
                Spacer(),
                Text(
                  'Home Loan Sanction Letter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 10, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Namaskar,',
                        style: TextStyle(fontSize: 12, color: kInk),
                      ),
                      Text(
                        '$name,',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: kInk,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Congratulations!',
                        style: TextStyle(
                          color: Color(0xFF1D4ED8),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text(
                        'Your home loan application is\napproved!',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.25,
                          color: Color(0xFF3A3A44),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F5FB),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFFE6E2EC)),
                        ),
                        child: const Text(
                          'CO-APPLICANT DETAILS\nMrs. Seema Garg\nMr. Kartik Garg\nMr. Rahul Garg',
                          style: TextStyle(
                            fontSize: 9,
                            height: 1.25,
                            color: Color(0xFF5C5C68),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Column(
                  children: [
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: CustomPaint(painter: QrPainter()),
                    ),
                    SizedBox(height: 6),
                    SizedBox(
                      width: 118,
                      height: 88,
                      child: CustomPaint(painter: HouseScenePainter()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BankMark extends StatelessWidget {
  const _BankMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFE11D2E),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Text(
        'HDFC BANK',
        style: TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _DownloadLetterButton extends StatelessWidget {
  const _DownloadLetterButton();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Download E-Sanction Letter'),
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 2),
              ),
            );
        },
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFF1D4ED8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.file_download_outlined, color: Colors.white, size: 22),
              SizedBox(width: 8),
              Text(
                'Download E-Sanction Letter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OffersSection extends StatelessWidget {
  const _OffersSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exclusive offers on your Home Loan!',
          style: TextStyle(
            color: kInk,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(height: 14),
        _OfferRow(
          icon: Icons.currency_rupee_rounded,
          tint: Color(0xFFE7EEFF),
          color: Color(0xFF3B6CFF),
          text: TextSpan(
            children: [
              TextSpan(text: 'Zero balance account,\n'),
              TextSpan(
                text: 'lifetime free platinum card!',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
        _OfferRow(
          icon: Icons.credit_card_rounded,
          tint: Color(0xFFFFF1E6),
          color: Color(0xFFE07A2F),
          text: TextSpan(
            children: [
              TextSpan(text: 'Credit card with '),
              TextSpan(
                text: 'zero',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: '\nannual fees for 3 years!'),
            ],
          ),
        ),
        SizedBox(height: 14),
        _OfferRow(
          icon: Icons.tv_rounded,
          tint: Color(0xFFF3E8FF),
          color: Color(0xFF8B5CF6),
          text: TextSpan(
            children: [
              TextSpan(text: 'Consumer loan with '),
              TextSpan(
                text: 'easy EMI',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: '\nfor electronics and furnishing!'),
            ],
          ),
        ),
        SizedBox(height: 14),
        _OfferRow(
          icon: Icons.verified_user_rounded,
          tint: Color(0xFFE8F8EF),
          color: Color(0xFF16A34A),
          text: TextSpan(
            text: 'Insurance covering\nproperty & life!',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _OfferRow extends StatelessWidget {
  const _OfferRow({
    required this.icon,
    required this.tint,
    required this.color,
    required this.text,
  });

  final IconData icon;
  final Color tint;
  final Color color;
  final TextSpan text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text.rich(
            text,
            style: const TextStyle(
              color: kInk,
              fontSize: 14.5,
              height: 1.35,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}

Color _ratingColor(int score) {
  if (score <= 3) return const Color(0xFFE11D2E);
  if (score <= 6) return const Color(0xFFF97316);
  if (score <= 8) return const Color(0xFFEAB308);
  return const Color(0xFF22C55E);
}

class _FeedbackCard extends StatelessWidget {
  const _FeedbackCard({
    required this.rating,
    required this.onSelect,
    required this.onSubmit,
  });

  final int rating;
  final ValueChanged<int> onSelect;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'How likely are you to recommend\nthis online service to others?',
            style: TextStyle(
              color: kInk,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              height: 1.35,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: List.generate(11, (score) {
              final selected = score == rating;
              final band = _ratingColor(rating);
              final onBand = rating >= 7 && rating <= 8
                  ? kInk
                  : Colors.white;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.5),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => onSelect(score),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 320),
                        curve: Curves.easeInOut,
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected ? band : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: selected ? band : const Color(0xFFD9D6E0),
                          ),
                        ),
                        child: Text(
                          '$score',
                          style: TextStyle(
                            color: selected ? onBand : kInk,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeInOut,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: _ratingColor(rating),
            ),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Not likely', style: TextStyle(color: kBody, fontSize: 12)),
              Text('May be', style: TextStyle(color: kBody, fontSize: 12)),
              Text('Very likely', style: TextStyle(color: kBody, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: onSubmit,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF1D4ED8),
              side: const BorderSide(color: Color(0xFFBFDBFE), width: 1.4),
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SealCheckPainter extends CustomPainter {
  const SealCheckPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outer = size.width / 2;
    const bumps = 14;
    final path = Path();
    for (var i = 0; i <= bumps * 2; i++) {
      final angle = -math.pi / 2 + i * math.pi / bumps;
      final radius = i.isEven ? outer : outer * 0.84;
      final point = center + Offset(math.cos(angle), math.sin(angle)) * radius;
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xFF22C55E));
    canvas.drawCircle(
      center,
      outer * 0.62,
      Paint()..color = const Color(0xFF16A34A),
    );

    final check = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(
      Path()
        ..moveTo(size.width * 0.30, size.height * 0.52)
        ..lineTo(size.width * 0.44, size.height * 0.66)
        ..lineTo(size.width * 0.72, size.height * 0.36),
      check,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class QrPainter extends CustomPainter {
  const QrPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(2)),
      Paint()..color = Colors.white,
    );
    final cell = size.width / 7;
    final ink = Paint()..color = const Color(0xFF111111);
    const pattern = [
      '1110111',
      '1000101',
      '1011101',
      '1000001',
      '1110111',
      '0001000',
      '1111011',
    ];
    for (var y = 0; y < 7; y++) {
      for (var x = 0; x < 7; x++) {
        if (pattern[y][x] == '1') {
          canvas.drawRect(
            Rect.fromLTWH(x * cell, y * cell, cell - 0.4, cell - 0.4),
            ink,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HouseScenePainter extends CustomPainter {
  const HouseScenePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final sky = Paint()..color = const Color(0xFFE8F3FF);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(8)),
      sky,
    );
    canvas.drawCircle(
      Offset(size.width * 0.82, size.height * 0.22),
      8,
      Paint()..color = const Color(0xFFFFD15A),
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.08,
        size.height * 0.72,
        size.width * 0.84,
        size.height * 0.2,
      ),
      Paint()..color = const Color(0xFFB7E4A8),
    );
    final house = Paint()..color = const Color(0xFF3B82F6);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.28,
        size.height * 0.42,
        size.width * 0.44,
        size.height * 0.36,
      ),
      house,
    );
    final roof = Path()
      ..moveTo(size.width * 0.22, size.height * 0.44)
      ..lineTo(size.width * 0.50, size.height * 0.18)
      ..lineTo(size.width * 0.78, size.height * 0.44)
      ..close();
    canvas.drawPath(roof, Paint()..color = const Color(0xFF1D4ED8));
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.44,
        size.height * 0.58,
        size.width * 0.12,
        size.height * 0.2,
      ),
      Paint()..color = const Color(0xFFF6E7C1),
    );
    final window = Paint()..color = const Color(0xFFEFF6FF);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.34,
        size.height * 0.50,
        size.width * 0.08,
        size.height * 0.1,
      ),
      window,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.58,
        size.height * 0.50,
        size.width * 0.08,
        size.height * 0.1,
      ),
      window,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
