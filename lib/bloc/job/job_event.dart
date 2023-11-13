part of 'job_bloc.dart';

@immutable
abstract class JobEvent extends Equatable {}

// Bided Job Event
class FetchBiddedJobs extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchBiddedJobsSuccessfulEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchBiddedJobsFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

// Awarded Job Event
class FetchAwardedJobs extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class FetchAwardedJobsSuccessfulEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchAwardedJobsFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


// Completed Job Event
class FetchCompletedJobs extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class FetchCompletedJobsSuccessfulEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FetchCompletedJobsFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FetchQuickCallJobEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FetchQuickCallJobSuccessfulEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FetchQuickCallJobFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FetchQuickCallDetailPageEvent extends JobEvent{
  final int? id;
  FetchQuickCallDetailPageEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class FetchQuickCallDetailSuccessEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class FetchQuickCallDetailFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
