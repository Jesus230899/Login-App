library home_view;

import 'package:login_app/views/login/login_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
  static const routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        onModelReady: (viewModel) {
          viewModel.onInit(context);
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(mobile: _HomeMobile(viewModel));
        });
  }
}
