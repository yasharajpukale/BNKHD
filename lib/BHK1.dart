// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'loan_widgets.dart';

class BHK1 extends StatefulWidget {
  const BHK1({super.key});

  @override
  State<BHK1> createState() => _BHK1State();
}

class _BHK1State extends State<BHK1> {
  final String _applicationNumber = '648715188';
  final String _amount = '₹90,00,000';
  final String _amountInWords = 'Rupees Ninety Lakh';
  final String _roi = '8.05% p.a.';
  final String _tenure = 'for 30 Years';
  final String _emi = '₹67,919';

  @override
  Widget build(BuildContext context) {
    return LoanPageFrame(
      child: LoanBodyRow(
        children: [
          SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoanNumberBlock(applicationNumber: _applicationNumber),
                const SizedBox(height: 16),
                const Divider(height: 1, thickness: 1, color: Color(0xFFE6E2EC)),
                const SizedBox(height: 16),
                const Text(
                  "Application is sent for manual assessment. We've sent a message on customer's registered mobile number & email ID.",
                  style: TextStyle(
                    color: kBody,
                    fontSize: 13.5,
                    height: 1.45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MetricBlock(
                        label: 'Home Loan Amount',
                        value: _amount,
                        caption: _amountInWords,
                      ),
                    ),
                    Expanded(
                      child: MetricBlock(
                        label: 'ROI & Tenure',
                        value: _roi,
                        caption: _tenure,
                      ),
                    ),
                    Expanded(
                      child: MetricBlock(
                        label: 'Monthly EMI',
                        value: _emi,
                        caption: '',
                      ),
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
