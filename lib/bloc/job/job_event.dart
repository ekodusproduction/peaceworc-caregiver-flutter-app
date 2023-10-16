part of 'job_bloc.dart';

@immutable
abstract class JobEvent extends Equatable {}

class FetchBiddedJobs extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchAwardedJobs extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class FetchCompletedJobs extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchBiddedJobsSuccessfulEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchAwardedJobsSuccessfulEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchCompletedJobsSuccessfulEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class FetchBiddedJobsFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchAwardedJobsFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class FetchCompletedJobsFailureEvent extends JobEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
