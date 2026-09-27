import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kHeaderBg = Color(0xFF0C0B2B);
const Color kHeaderButton = Color(0xFF1A2558);
const Color kPageBg = Color(0xFFF3F1F6);
const Color kCardBg = Color(0xFFFCFBFD);
const Color kCardBorder = Color(0xFFE7E3EE);
const Color kLabel = Color(0xFF8E8E98);
const Color kBody = Color(0xFF6F6F7A);
const Color kInk = Color(0xFF1B1B1F);
const Color kPurple = Color(0xFF6C4BFF);
const Color kPurpleSoft = Color(0xFFEDE7FF);
const Color kGreen = Color(0xFF22C55E);
const Color kSanctionBg = Color(0xFFF7F0D2);
const Color kSanctionBorder = Color(0xFFE8D7A4);
const Color kSanctionTitle = Color(0xFF8A6420);
const Color kSanctionSub = Color(0xFFA48955);

class LoanSubmittedHeader extends StatelessWidget {
  const LoanSubmittedHeader({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kHeaderBg,
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 92),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Home Loan Application Submitted!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.4,
                    height: 1.1,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    color: kGreen,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Customer will be contact by our team for further process',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFE4E4EE),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 22),
          LayoutBuilder(
            builder: (context, constraints) {
              final sideBySide = constraints.maxWidth >= 430;
              final buttonWidth = sideBySide ? 196.0 : null;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: HeaderActionButton(
                      label: 'Share',
                      width: buttonWidth,
                      onTap: () => _toast(context, 'Share'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: HeaderActionButton(
                      label: 'Download',
                      width: buttonWidth,
                      onTap: () => _toast(context, 'Download'),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class HeaderActionButton extends StatelessWidget {
  const HeaderActionButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width = 196,
  });

  final String label;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kHeaderButton,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class LoanPageFrame extends StatelessWidget {
  const LoanPageFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoanSubmittedHeader(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 22, 28),
                    child: Transform.translate(
                      offset: const Offset(0, -58),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoanBodyRow extends StatelessWidget {
  const LoanBodyRow({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const side = PromoColumn();
        if (constraints.maxWidth < 900) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...children,
              const SizedBox(height: 16),
              side,
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
            const SizedBox(width: 18),
            const SizedBox(width: 228, child: side),
          ],
        );
      },
    );
  }
}

class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(22, 20, 22, 22),
    this.color = kCardBg,
    this.borderColor = kCardBorder,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A1A1030),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class LoanNumberBlock extends StatelessWidget {
  const LoanNumberBlock({super.key, required this.applicationNumber});

  final String applicationNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ApplicationBadge(),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Loan Application Number',
                style: TextStyle(
                  color: kLabel,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    applicationNumber,
                    style: const TextStyle(
                      color: kInk,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(
                          ClipboardData(text: applicationNumber),
                        );
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
                        size: 18,
                        color: Color(0xFF9AA0B4),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ApplicationBadge extends StatelessWidget {
  const ApplicationBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: const BoxDecoration(
        color: kPurpleSoft,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CustomPaint(painter: DocumentBadgePainter()),
        ),
      ),
    );
  }
}

class AmountBadge extends StatelessWidget {
  const AmountBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 88,
      height: 76,
      child: CustomPaint(painter: PersonalLoanArtPainter()),
    );
  }
}

class MetricBlock extends StatelessWidget {
  const MetricBlock({
    super.key,
    required this.label,
    required this.value,
    required this.caption,
  });

  final String label;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            softWrap: false,
            style: const TextStyle(
              color: kLabel,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            softWrap: false,
            style: const TextStyle(
              color: kInk,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            caption,
            softWrap: false,
            style: const TextStyle(
              color: kLabel,
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class PromoColumn extends StatelessWidget {
  const PromoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SurfaceCard(
          padding: EdgeInsets.fromLTRB(14, 16, 14, 18),
          child: Column(
            children: [
              SizedBox(
                height: 118,
                width: 168,
                child: CustomPaint(painter: PersonalLoanArtPainter()),
              ),
              SizedBox(height: 6),
              Text(
                'Get Personal Loan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kInk,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'For any unwanted\nemergencies',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kInk,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14),
        SurfaceCard(
          padding: EdgeInsets.fromLTRB(14, 18, 14, 18),
          child: Column(
            children: [
              SizedBox(
                height: 112,
                width: 168,
                child: CustomPaint(painter: InsuranceArtPainter()),
              ),
              SizedBox(height: 8),
              Text(
                'Buy a new',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kInk,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'NRI Insurance Plan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kInk,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SanctionBanner extends StatelessWidget {
  const SanctionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const SurfaceCard(
      color: kSanctionBg,
      borderColor: kSanctionBorder,
      padding: EdgeInsets.fromLTRB(22, 16, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sanction Letter Generated',
                  style: TextStyle(
                    color: kSanctionTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Sanction letter is sent to customer via email and whatsapp',
                  style: TextStyle(
                    color: kSanctionSub,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          _RoundAction(child: Icon(Icons.mail_outline_rounded, size: 18, color: Color(0xFF8D8D98))),
          SizedBox(width: 10),
          _RoundAction(
            fill: Color(0xFF25D366),
            child: SizedBox(
              width: 18,
              height: 18,
              child: CustomPaint(painter: WhatsAppGlyphPainter()),
            ),
          ),
          SizedBox(width: 12),
          SanctionPreview(),
        ],
      ),
    );
  }
}

class _RoundAction extends StatelessWidget {
  const _RoundAction({required this.child, this.fill = const Color(0xFFF7F4EA)});

  final Widget child;
  final Color fill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: fill,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE4D7B0)),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class SanctionPreview extends StatelessWidget {
  const SanctionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE7E0CC)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const CustomPaint(painter: SanctionCardPainter()),
    );
  }
}

class DocumentBadgePainter extends CustomPainter {
  const DocumentBadgePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final doc = Path()
      ..moveTo(w * 0.18, h * 0.08)
      ..lineTo(w * 0.62, h * 0.08)
      ..lineTo(w * 0.84, h * 0.30)
      ..lineTo(w * 0.84, h * 0.92)
      ..lineTo(w * 0.18, h * 0.92)
      ..close();
    canvas.drawPath(doc, Paint()..color = kPurple);

    final fold = Path()
      ..moveTo(w * 0.62, h * 0.08)
      ..lineTo(w * 0.62, h * 0.30)
      ..lineTo(w * 0.84, h * 0.30)
      ..close();
    canvas.drawPath(fold, Paint()..color = const Color(0xFFC4B4FF));

    final line = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(w * 0.32, h * 0.48), Offset(w * 0.68, h * 0.48), line);
    canvas.drawLine(Offset(w * 0.32, h * 0.62), Offset(w * 0.60, h * 0.62), line);
    canvas.drawLine(Offset(w * 0.32, h * 0.76), Offset(w * 0.66, h * 0.76), line);

    canvas.drawCircle(
      Offset(w * 0.78, h * 0.78),
      w * 0.16,
      Paint()..color = const Color(0xFFFFC857),
    );
    final rupee = TextPainter(
      text: const TextSpan(
        text: '₹',
        style: TextStyle(
          color: Color(0xFF5A3AD6),
          fontSize: 8,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    rupee.paint(
      canvas,
      Offset(w * 0.78 - rupee.width / 2, h * 0.78 - rupee.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PersonalLoanArtPainter extends CustomPainter {
  const PersonalLoanArtPainter();

  @override
  void paint(Canvas canvas, Size size) {
    drawMoneyBag(canvas, size, withHand: true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void drawMoneyBag(Canvas canvas, Size size, {required bool withHand}) {
  canvas.save();
  const design = Size(168, 118);
  final scale = (size.width / design.width) < (size.height / design.height)
      ? size.width / design.width
      : size.height / design.height;
  canvas.translate(
    (size.width - design.width * scale) / 2,
    (size.height - design.height * scale) / 2,
  );
  canvas.scale(scale);

  const sleeve = Color(0xFF4C74FF);
  const skin = Color(0xFFF6C6A6);
  const skinDeep = Color(0xFFE8B08C);
  const bagColor = Color(0xFF7A5CFF);
  const bagNeck = Color(0xFF6246E8);
  const coin = Color(0xFFFFD15A);
  const coinEdge = Color(0xFFE6A51C);

  if (withHand) {
    canvas.drawCircle(const Offset(128, 18), 11, Paint()..color = coin);
    canvas.drawCircle(
      const Offset(128, 18),
      11,
      Paint()
        ..color = coinEdge
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6,
    );
    canvas.drawCircle(const Offset(144, 32), 7.5, Paint()..color = const Color(0xFFFFC53A));

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(6, 72, 52, 26),
        const Radius.circular(13),
      ),
      Paint()..color = sleeve,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(46, 70, 16, 30),
        const Radius.circular(8),
      ),
      Paint()..color = skinDeep,
    );
    canvas.drawOval(
      const Rect.fromLTWH(52, 64, 58, 36),
      Paint()..color = skin,
    );
    canvas.drawOval(
      const Rect.fromLTWH(46, 78, 18, 14),
      Paint()..color = skinDeep,
    );
  }

  const cx = 104.0;
  const top = 14.0;
  final bag = Path()
    ..moveTo(cx, top + 10)
    ..cubicTo(cx - 12, top + 2, cx - 26, top + 14, cx - 20, top + 28)
    ..cubicTo(cx - 38, top + 34, cx - 36, top + 72, cx, top + 76)
    ..cubicTo(cx + 36, top + 72, cx + 38, top + 34, cx + 20, top + 28)
    ..cubicTo(cx + 26, top + 14, cx + 12, top + 2, cx, top + 10)
    ..close();
  canvas.drawPath(bag, Paint()..color = bagColor);
  canvas.drawOval(
    Rect.fromCenter(center: Offset(cx, top + 14), width: 28, height: 12),
    Paint()..color = bagNeck,
  );
  canvas.drawOval(
    Rect.fromCenter(center: Offset(cx - 8, top + 42), width: 14, height: 22),
    Paint()..color = const Color(0x33FFFFFF),
  );

  final percent = TextPainter(
    text: const TextSpan(
      text: '%',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w800,
        height: 1,
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();
  percent.paint(canvas, Offset(cx - percent.width / 2, top + 30));
  canvas.restore();
}

class InsuranceArtPainter extends CustomPainter {
  const InsuranceArtPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    const design = Size(168, 112);
    final scale = (size.width / design.width) < (size.height / design.height)
        ? size.width / design.width
        : size.height / design.height;
    canvas.translate(
      (size.width - design.width * scale) / 2,
      (size.height - design.height * scale) / 2,
    );
    canvas.scale(scale);

    const sleeve = Color(0xFF4C74FF);
    const skin = Color(0xFFF6C6A6);
    const heartColor = Color(0xFF8B6BFF);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(4, 58, 40, 24),
        const Radius.circular(12),
      ),
      Paint()..color = sleeve,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(124, 58, 40, 24),
        const Radius.circular(12),
      ),
      Paint()..color = sleeve,
    );
    canvas.drawOval(
      const Rect.fromLTWH(28, 62, 42, 26),
      Paint()..color = skin,
    );
    canvas.drawOval(
      const Rect.fromLTWH(98, 62, 42, 26),
      Paint()..color = skin,
    );

    const cx = 84.0;
    const cy = 46.0;
    const s = 34.0;
    final heart = Path()
      ..moveTo(cx, cy + s * 0.82)
      ..cubicTo(cx - s * 1.15, cy + s * 0.2, cx - s * 0.95, cy - s * 0.72, cx - s * 0.42, cy - s * 0.58)
      ..cubicTo(cx - s * 0.12, cy - s * 0.48, cx, cy - s * 0.18, cx, cy - s * 0.02)
      ..cubicTo(cx, cy - s * 0.18, cx + s * 0.12, cy - s * 0.48, cx + s * 0.42, cy - s * 0.58)
      ..cubicTo(cx + s * 0.95, cy - s * 0.72, cx + s * 1.15, cy + s * 0.2, cx, cy + s * 0.82)
      ..close();
    canvas.drawPath(heart, Paint()..color = heartColor);
    canvas.save();
    canvas.clipPath(heart);

    final pulse = Path()
      ..moveTo(cx - 22, cy + 2)
      ..lineTo(cx - 12, cy + 2)
      ..lineTo(cx - 6, cy - 12)
      ..lineTo(cx + 2, cy + 14)
      ..lineTo(cx + 8, cy + 2)
      ..lineTo(cx + 22, cy + 2);
    canvas.drawPath(
      pulse,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WhatsAppGlyphPainter extends CustomPainter {
  const WhatsAppGlyphPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeJoin = StrokeJoin.round;
    final bubble = Path()
      ..addOval(Rect.fromLTWH(1, 1, size.width - 2, size.height - 4))
      ..moveTo(size.width * 0.28, size.height * 0.78)
      ..lineTo(size.width * 0.22, size.height * 0.96)
      ..lineTo(size.width * 0.46, size.height * 0.78);
    canvas.drawPath(bubble, paint);
    final phone = Path()
      ..moveTo(size.width * 0.38, size.height * 0.32)
      ..cubicTo(
        size.width * 0.62,
        size.height * 0.28,
        size.width * 0.70,
        size.height * 0.48,
        size.width * 0.58,
        size.height * 0.62,
      );
    canvas.drawPath(phone, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SanctionCardPainter extends CustomPainter {
  const SanctionCardPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final title = TextPainter(
      text: const TextSpan(
        text: 'Congratulations!',
        style: TextStyle(
          color: Color(0xFF2F6BFF),
          fontSize: 7.5,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width - 8);
    title.paint(canvas, const Offset(6, 6));

    final house = Paint()..color = const Color(0xFF5B8DEF);
    final roof = Path()
      ..moveTo(size.width * 0.18, size.height * 0.62)
      ..lineTo(size.width * 0.40, size.height * 0.42)
      ..lineTo(size.width * 0.62, size.height * 0.62)
      ..close();
    canvas.drawPath(roof, house);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.24, size.height * 0.60, size.width * 0.32, size.height * 0.26),
      Paint()..color = const Color(0xFFDCE8FF),
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.36, size.height * 0.72, size.width * 0.08, size.height * 0.14),
      Paint()..color = const Color(0xFF8D6A3A),
    );
    canvas.drawCircle(
      Offset(size.width * 0.72, size.height * 0.70),
      7,
      Paint()..color = const Color(0xFF7ED07A),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.78, size.height * 0.28, 14, 14),
        const Radius.circular(2),
      ),
      Paint()..color = const Color(0xFF222222),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.80, size.height * 0.31, 10, 10),
        const Radius.circular(1),
      ),
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
