import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetails extends Equatable {
  const CustomerDetails({
    required this.applicationNumber,
    required this.accountNumber,
    required this.sanctionedAmount,
    required this.roiTenure,
    required this.emi,
    required this.representativeName,
    required this.representativeMobile,
    required this.applicantName,
  });

  final String applicationNumber;
  final String accountNumber;
  final String sanctionedAmount;
  final String roiTenure;
  final String emi;
  final String representativeName;
  final String representativeMobile;
  final String applicantName;

  @override
  List<Object?> get props => [
    applicationNumber,
    accountNumber,
    sanctionedAmount,
    roiTenure,
    emi,
    representativeName,
    representativeMobile,
    applicantName,
  ];
}

class CustomerState extends Equatable {
  const CustomerState({
    required this.details,
    required this.rating,
    required this.submissionCount,
  });

  final CustomerDetails details;
  final int rating;
  final int submissionCount;

  CustomerState copyWith({int? rating, int? submissionCount}) {
    return CustomerState(
      details: details,
      rating: rating ?? this.rating,
      submissionCount: submissionCount ?? this.submissionCount,
    );
  }

  @override
  List<Object?> get props => [details, rating, submissionCount];
}

sealed class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

class SelectRating extends CustomerEvent {
  const SelectRating(this.score);

  final int score;

  @override
  List<Object?> get props => [score];
}

class SubmitFeedback extends CustomerEvent {
  const SubmitFeedback();
}

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc()
    : super(
        const CustomerState(
          details: CustomerDetails(
            applicationNumber: '648715188',
            accountNumber: '1104659688',
            sanctionedAmount: '₹90,00,000.00',
            roiTenure: '8.05% p.a. for 30 Years',
            emi: '₹67,919',
            representativeName: 'Sharad Rao',
            representativeMobile: '9834938400',
            applicantName: 'Mr. Aditya Sharma',
          ),
          rating: 9,
          submissionCount: 0,
        ),
      ) {
    on<SelectRating>(_onSelectRating);
    on<SubmitFeedback>(_onSubmitFeedback);
  }

  void _onSelectRating(SelectRating event, Emitter<CustomerState> emit) {
    emit(state.copyWith(rating: event.score));
  }

  void _onSubmitFeedback(SubmitFeedback event, Emitter<CustomerState> emit) {
    emit(state.copyWith(submissionCount: state.submissionCount + 1));
  }
}
