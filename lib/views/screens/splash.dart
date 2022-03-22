import 'package:flutter/material.dart';
import 'package:moni/views/screens/mycluster/cluster_page.dart';
import '../../views/styles/colors.dart';
import '../../core/models/cluster.dart';
import '../../core/services/fetch_cluster.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  );

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late ClusterModel clusterModel;

  Future<void> initialize() async {
    clusterModel = await fetchCluster();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return ClusterPage(clusterModel: clusterModel);
    }));
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
            scale: _animation,
            child: Center(
              child: SizedBox(
                height: 109,
                width: 200,
                child: Image.asset("assets/images/moni_logo_name.png"),
              ),
            )),
      ),
    );
  }

  Future<void> networkErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: AlertDialog(
                title: Column(
                  children: const [
                    Center(
                        child: Icon(Icons.wifi_off,
                            size: 56, color: MoniAppColors.primaryBrandBase)),
                    Text('No internet connection',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20))
                  ],
                ),
                actions: <Widget>[
                  const Text(
                      'Please check your internet connection and try again',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: MoniAppColors.primaryBrandBase),
                          child: const Text('Try Again',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pop(context);
                          }))
                ]));
      },
    );
  }
}
