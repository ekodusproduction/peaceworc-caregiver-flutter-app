import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../bloc/job/job_bloc.dart';
import '../../../components/card/job_card_item.dart';
import '../../../model/job/bid_job_response.dart';
class CompletedJobs extends StatefulWidget {
  const CompletedJobs({super.key});

  @override
  State<CompletedJobs> createState() => _CompletedJobsState();
}

class _CompletedJobsState extends State<CompletedJobs> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<JobBloc>(context).add(FetchCompletedJobs());
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        if( state is CompletedJobLoadingState){
          return Skeletonizer(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return JobCardItem(index: index);
                },
              )
          );
        }
        if(state is CompletedJobSuccessfulState){
          if(state.bidJobResponse.data!.isEmpty){
            return Center(
              child: Lottie.asset(
                'lib/assets/not_found.json',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            );
          }
          return _listItem(false, state.bidJobResponse);
        } if(state is CompletedJobFailedState){
          return Center(
            child: Text(state.message),
          );
        }
        return Center(
          child: Lottie.asset(
            'lib/assets/internal_error.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
        );

      },
    );
  }


  Widget _listItem(loadingState, BidJobResponse bidJobResponse){
    return Skeletonizer(
      enabled: loadingState,
      child: ListView.builder(
        itemCount: bidJobResponse.data?.length,
        itemBuilder: (context, index) {
          return JobCardItem(index: index);
        },
      ),
    );
  }
}
