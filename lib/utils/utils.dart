
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/job/job_bloc.dart';
mixin UtilsHelper{
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  void fetchQuickCallJobs(context) {
    BlocProvider.of<JobBloc>(context).add(FetchQuickCallJobEvent());
  }
}