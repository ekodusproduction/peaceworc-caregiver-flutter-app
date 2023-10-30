import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../bloc/job/job_bloc.dart';
import '../../../components/card/job_card_item.dart';
import '../../../model/job/bid_job_response.dart';
class AwardedJob extends StatefulWidget {
  const AwardedJob({super.key});

  @override
  State<AwardedJob> createState() => _AwardedJobState();
}

class _AwardedJobState extends State<AwardedJob> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<JobBloc>(context).add(FetchAwardedJobs());
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        if( state is AwardedJobLoadingState){
          return Skeletonizer(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return JobCardItem(index: index);
                },
              )
          );
        }
        if(state is AwardedJobSuccessfulState){
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
        }
        if(state is AwardedJobFailedState){
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
