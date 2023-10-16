part of 'job_bloc.dart';

@immutable
abstract class JobState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class JobInitial extends JobState {

}

class BiddedJobLoadingState extends JobState{}
class BiddedJobSuccessfulState extends JobState{
 final BidJobResponse bidJobResponse;
  BiddedJobSuccessfulState(this.bidJobResponse);
}
class BiddedJobFailedState extends JobState{
   final String message;
  BiddedJobFailedState(this.message);
}
