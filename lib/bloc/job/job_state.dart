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

class AwardedJobLoadingState extends JobState{}
class AwardedJobSuccessfulState extends JobState{
  final BidJobResponse bidJobResponse;
  AwardedJobSuccessfulState(this.bidJobResponse);
}
class AwardedJobFailedState extends JobState{
  final String message;
  AwardedJobFailedState(this.message);
}


class CompletedJobLoadingState extends JobState{}
class CompletedJobSuccessfulState extends JobState{
  final BidJobResponse bidJobResponse;
  CompletedJobSuccessfulState(this.bidJobResponse);
}
class CompletedJobFailedState extends JobState{
  final String message;
  CompletedJobFailedState(this.message);
}

class QuickCallLoadingState extends JobState{

}
class QuickCallSuccessState extends JobState{
  final BidJobResponse bidJobResponse;
  QuickCallSuccessState(this.bidJobResponse);
}
class QuickCallFailureState extends JobState{
  final String message;
  QuickCallFailureState(this.message);
}

class QuickCallDetailLoadingState extends JobState{

}
class QuickCallDetailSuccessState extends JobState{
  final QuickCallDetailResponse bidJobResponse;
  QuickCallDetailSuccessState(this.bidJobResponse);
}
class QuickCallDetailFailureState extends JobState{
  final String message;
  QuickCallDetailFailureState(this.message);

}