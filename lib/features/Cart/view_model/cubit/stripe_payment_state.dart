part of 'stripe_payment_cubit.dart';

@immutable
abstract class StripePaymentState {}

final class StripePaymentInitial extends StripePaymentState {}
final class StripePaymentLoading extends StripePaymentState {}
final class StripePaymentSuccess extends StripePaymentState {}
final class StripePaymentError extends StripePaymentState {
  final String message;
  StripePaymentError( {required this.message});
}