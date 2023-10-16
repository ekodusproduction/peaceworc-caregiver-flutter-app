import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/job/bid_job_response.dart';

import '../../repository/job/bid_job_repository.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final BidJobRepo bidJobRepo = new BidJobRepo();
  JobBloc() : super(JobInitial()) {
    on<FetchBiddedJobs>(fetchBiddedJobs);
  }

  Future<FutureOr<void>> fetchBiddedJobs(FetchBiddedJobs event, Emitter<JobState> emit) async {
    emit(BiddedJobLoadingState());
    final response = await bidJobRepo.fetchBidJobs();
    if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
      emit(BiddedJobFailedState(response.message!));
    }
    if(response.httpStatusCode == 200){
      print("entered in success state");

        emit(BiddedJobSuccessfulState(response));



    }
  }
}
