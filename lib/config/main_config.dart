import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:petcare/models/provider_config.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainConfig extends StatelessWidget {
  final Widget child;
  MainConfig({this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderConfig.providers,
      child: RefreshConfiguration(
        headerTriggerDistance: 100,
        springDescription:
            SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        enableScrollWhenRefreshCompleted: true,
        enableLoadingWhenFailed: true,
        hideFooterWhenNotFull: false,
        enableBallisticLoad: true,
        headerBuilder: () => ClassicHeader(
          height: 50,
          refreshStyle: RefreshStyle.UnFollow,
          refreshingText: 'Refreshing...',
          releaseText: 'Release to refresh immediately',
          completeText: 'Loading completed',
          idleText: 'Pull down to refresh',
          failedText: 'Loading failed',
          releaseIcon: Icon(Icons.arrow_downward, color: Colors.grey),
        ),
        footerBuilder: () => ClassicFooter(
          height: 50,
          loadingText: 'Loading...',
          canLoadingText: 'Release to load immediately',
          noDataText: 'No more data',
          idleText: 'Pull up to start loading',
          failedText: 'Loading failed',
          loadingIcon: CupertinoActivityIndicator(),
          canLoadingIcon: Icon(Icons.arrow_upward, color: Colors.grey),
        ),
        child: child,
      ),
    );
  }
}
