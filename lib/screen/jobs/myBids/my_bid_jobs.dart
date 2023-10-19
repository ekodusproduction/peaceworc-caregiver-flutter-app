import 'package:flutter/material.dart';
import 'package:peace_worc/model/job/bid_job_response.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/bloc/job/job_bloc.dart';
import 'package:peace_worc/components/card/job_card_item.dart';
import 'package:lottie/lottie.dart';

class MyBidJobs extends StatefulWidget {
  const MyBidJobs({super.key});

  @override
  State<MyBidJobs> createState() => _MyBidJobsState();
  
}

class _MyBidJobsState extends State<MyBidJobs> {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<JobBloc>(context).add(FetchBiddedJobs());
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        if( state is BiddedJobLoadingState){
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return JobCardItem(index: index);
              },
            )
          );
        }
        if(state is BiddedJobSuccessfulState){
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
       // padding: EdgeInsets.all(5.0),
        //padding: EdgeInsets.only(bottom: 10),
        itemCount: bidJobResponse.data?.length,
        itemBuilder: (context, index) {
          return JobCardItem(index: index);
        },
      ),
    );
  }
}
