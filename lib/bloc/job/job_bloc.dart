import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/job/bid_job_response.dart';
import 'package:peace_worc/model/job/quick_call_detail_response.dart';
import 'package:peace_worc/repository/job/job_repository.dart';


part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepo jobRepo = new JobRepo();
  JobBloc() : super(JobInitial()) {
    on<FetchBiddedJobs>(fetchBiddedJobs);
    on<FetchAwardedJobs>(fetchAwardedJobs);
    on<FetchCompletedJobs>(fetchCompletedJobs);
    on<FetchQuickCallJobEvent> (fetchQuickCallJobs);
    on<FetchQuickCallDetailPageEvent>(fetchQuickCallDetailPageEvent);
  }

  Future<FutureOr<void>> fetchBiddedJobs(FetchBiddedJobs event, Emitter<JobState> emit) async {
   try{
     emit(BiddedJobLoadingState());
     final response = await jobRepo.fetchBidJobs();
     if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
       emit(BiddedJobFailedState(response.message!));
     }
     if(response.httpStatusCode == 200){
       emit(BiddedJobSuccessfulState(response));
     }
   }catch (e){
     print("Fetch Bid Job Exception"+e.toString());
   }
  }

  Future<FutureOr<void>> fetchAwardedJobs(FetchAwardedJobs event, Emitter<JobState> emit) async {
    try{
      emit(AwardedJobLoadingState());
      final response = await jobRepo.fetchUpComingJobs();
      if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
        emit(AwardedJobFailedState(response.message!));
      }
      if(response.httpStatusCode == 200){
        emit(AwardedJobSuccessfulState(response));
      }
    }catch(e){
      print("Fetch Upcoming Job Exception"+e.toString());
    }
  }

  Future<FutureOr<void>> fetchCompletedJobs(FetchCompletedJobs event, Emitter<JobState> emit) async {
    try{
      emit(CompletedJobLoadingState());
      final response = await jobRepo.fetchCompletedJobs();
      if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
        emit(CompletedJobFailedState(response.message!));
      }
      if(response.httpStatusCode == 200){
        emit(CompletedJobSuccessfulState(response));
      }
    }catch(e){
      print("Fetch Upcoming Job Exception"+e.toString());
    }
  }

  FutureOr<void> fetchQuickCallJobs(FetchQuickCallJobEvent event, Emitter<JobState> emit) async {
    try{
      emit(QuickCallLoadingState());
      final response = await jobRepo.fetchQuickCallJobs();
      if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
        emit(QuickCallFailureState(response.message!));
      }
      if(response.httpStatusCode == 200){
        print("succccccccccc");
       // print("emitResponse"+response.data[0].careItems[0].);
        emit(QuickCallSuccessState(response));
      }
    }catch(e){
      print("Fetch Quick call Job Exceptionsssss"+e.toString());
    }
  }

  FutureOr<void> fetchQuickCallDetailPageEvent(FetchQuickCallDetailPageEvent event, Emitter<JobState> emit) async {

    try{
      emit(QuickCallDetailLoadingState());
      final response = await jobRepo.fetchQuickCallSingleDetail(event.id!);
      if(response.httpStatusCode == 400 || response.httpStatusCode == 401){
        emit(QuickCallDetailFailureState(response.message!));
      }
      if(response.httpStatusCode == 200){
        // print("emitResponse"+response.data[0].careItems[0].);
        emit(QuickCallDetailSuccessState(response));
      }
    }catch(e){
      print("Fetch Quick call Job Detial page Exception"+e.toString());
    }
  }
}
