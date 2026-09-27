import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ActiveLoanScreen { bhk1, bhk2, customer }

class LoanDetails extends Equatable {
  const LoanDetails({
    required this.applicationNumber,
    required this.amount,
    required this.amountInWords,
    required this.roi,
    required this.tenure,
    required this.emi,
  });

  final String applicationNumber;
  final String amount;
  final String amountInWords;
  final String roi;
  final String tenure;
  final String emi;

  @override
  List<Object?> get props => [
    applicationNumber,
    amount,
    amountInWords,
    roi,
    tenure,
    emi,
  ];
}

class LoanState extends Equatable {
  const LoanState({required this.screen, required this.loan});

  final ActiveLoanScreen screen;
  final LoanDetails loan;

  LoanState copyWith({ActiveLoanScreen? screen}) {
    return LoanState(screen: screen ?? this.screen, loan: loan);
  }

  @override
  List<Object?> get props => [screen, loan];
}

sealed class LoanEvent extends Equatable {
  const LoanEvent();

  @override
  List<Object?> get props => [];
}

class ShowBhk1 extends LoanEvent {
  const ShowBhk1();
}

class ShowBhk2 extends LoanEvent {
  const ShowBhk2();
}

class ShowCustomer extends LoanEvent {
  const ShowCustomer();
}

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  LoanBloc()
    : super(
        const LoanState(
          screen: ActiveLoanScreen.bhk1,
          loan: LoanDetails(
            applicationNumber: '648715188',
            amount: '₹90,00,000',
            amountInWords: 'Rupees Ninety Lakh',
            roi: '8.05% p.a.',
            tenure: 'for 30 Years',
            emi: '₹67,919',
          ),
        ),
      ) {
    on<ShowBhk1>(_onShowBhk1);
    on<ShowBhk2>(_onShowBhk2);
    on<ShowCustomer>(_onShowCustomer);
  }

  void _onShowBhk1(ShowBhk1 event, Emitter<LoanState> emit) {
    emit(state.copyWith(screen: ActiveLoanScreen.bhk1));
  }

  void _onShowBhk2(ShowBhk2 event, Emitter<LoanState> emit) {
    emit(state.copyWith(screen: ActiveLoanScreen.bhk2));
  }

  void _onShowCustomer(ShowCustomer event, Emitter<LoanState> emit) {
    emit(state.copyWith(screen: ActiveLoanScreen.customer));
  }
}
