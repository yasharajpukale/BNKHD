// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loan_bloc.dart';
import 'loan_widgets.dart';

class BHK2 extends StatelessWidget {
  const BHK2({super.key});

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AmountBadge(),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Home Loan Amount',
                                style: TextStyle(
                                  color: kLabel,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                loan.amount,
                                style: const TextStyle(
                                  color: kInk,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  height: 1.05,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                loan.amountInWords,
                                style: const TextStyle(
                                  color: kLabel,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "We'll send you a confirmation message on both registered mobile number & email ID.",
                      style: TextStyle(
                        color: kBody,
                        fontSize: 13.5,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: MetricBlock(
                            label: 'ROI & Tenure',
                            value: loan.roi,
                            caption: loan.tenure,
                          ),
                        ),
                        Expanded(
                          flex: 6,
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
              const SizedBox(height: 14),
              SurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoanNumberBlock(applicationNumber: loan.applicationNumber),
                    const SizedBox(height: 18),
                    const Text(
                      'Please provide it when you visit the branch.',
                      style: TextStyle(
                        color: kBody,
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const SanctionBanner(),
            ],
          ),
        );
      },
    );
  }
}
