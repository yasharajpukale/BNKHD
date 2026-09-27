// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loan_bloc.dart';
import 'loan_widgets.dart';

class BHK1 extends StatelessWidget {
  const BHK1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanBloc, LoanState>(
      builder: (context, state) {
        final loan = state.loan;
        return LoanPageFrame(
          child: LoanBodyRow(
            children: [
              SurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoanNumberBlock(applicationNumber: loan.applicationNumber),
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
                            value: loan.amount,
                            caption: loan.amountInWords,
                          ),
                        ),
                        Expanded(
                          child: MetricBlock(
                            label: 'ROI & Tenure',
                            value: loan.roi,
                            caption: loan.tenure,
                          ),
                        ),
                        Expanded(
                          child: MetricBlock(
                            label: 'Monthly EMI',
                            value: loan.emi,
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
      },
    );
  }
}
