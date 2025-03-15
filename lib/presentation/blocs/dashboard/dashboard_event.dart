part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class LoadDashboardEvent extends DashboardEvent {
  const LoadDashboardEvent();
}

class RefreshDashboardEvent extends DashboardEvent {
  const RefreshDashboardEvent();
}

class SelectDateEvent extends DashboardEvent {
  final DateTime date;

  const SelectDateEvent(this.date);

  @override
  List<Object?> get props => [date];
}
