import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:izzzleep/screens/alarm_overview.dart';
import 'package:izzzleep/screens/daily_screen.dart';
import 'package:izzzleep/screens/set_alarm_screen.dart';
import 'package:izzzleep/widgets/drawer/drawer_collapse.dart';
import 'package:izzzleep/widgets/drawer/drawer_item.dart';
import 'package:izzzleep/widgets/drawer/drawer_user.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  final Widget svgIcon = Image.asset(
    'assets/icons/logo.png',
    height: 45,
  );

  late AnimationController _controller;
  late Animation<double> _animation;
  late double height;
  late double width;
  double backgroundOpacity = 0;
  bool isCollapsed = true;
  bool isCollapsedAfterSec = true;

  void initializeAnimation() {
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 500,
      ),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    );
    startAnimation();
  }

  void startAnimation() {
    _controller.forward();
    _animation.addListener(() {
      setState(() {
        backgroundOpacity = 0.7 * _animation.value;
      });
    });
  }

  void stopAnimation() {
    _controller.stop();
  }

  void reverseAnimation() {
    _controller.reverse();
    showDrawer();
  }

  void onCollapseTap() {
    if (isCollapsed) {
      Future.delayed(const Duration(
        milliseconds: 70,
      )).then((value) {
        setState(() {
          isCollapsedAfterSec = !isCollapsedAfterSec;
        });
      });
    } else if (!isCollapsed) {
      setState(() {
        isCollapsedAfterSec = !isCollapsedAfterSec;
      });
    }
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late int screen = 0;

  void showDrawer() {
    setState(() {
      _showDrawer = !_showDrawer;
      startAnimation();
    });
  }

  bool _showDrawer = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    List<Widget> screens = [
      const SetAlarm(),
      const DailySummary(),
      const AlarmOverView()
    ];
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xfff0f0f0),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: NeumorphicFloatingActionButton(
                onPressed: showDrawer,
                style: const NeumorphicStyle(color: Color(0xfff0f0f0)),
                child: const Icon(
                  Icons.menu_rounded,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: const BottomAppBar(
            shape: CircularNotchedRectangle(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          body: IndexedStack(
            index: screen,
            children: screens,
          ),
        ),
        if (_showDrawer)
          Scaffold(
            backgroundColor: Colors.grey.withOpacity(
              backgroundOpacity,
            ),
            body: Row(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (ctx, child) {
                    return AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 70,
                      ),
                      width: (isCollapsed)
                          ? width * .2 * _animation.value
                          : width * .5 * _animation.value,
                      margin: EdgeInsets.only(
                        left: width * .06 * _animation.value,
                        top: height * .05,
                        bottom: height * .05,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xfff0f0f0),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: (_animation.value > 0.7)
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                DrawerUser(
                                  afterCollapse: svgIcon,
                                  beforeCollapse: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      svgIcon,
                                      const Text(
                                        "iZzzleep",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  isCollapsed: isCollapsed,
                                ),
                                // Erstes Item
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      print("pressed alarm");
                                      screen = 0;
                                    });
                                  },
                                  child: DrawerItem(
                                    icon: const Icon(
                                      Icons.access_alarms,
                                      color: Colors.black45,
                                      size: 35,
                                    ),
                                    label: const Text(
                                      'Set Alarm',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    isCollapsed: isCollapsedAfterSec,
                                  ),
                                ),
                                // Zweites Otem
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      print("pressed alarm");
                                      screen = 1;
                                    });
                                  },
                                  child: DrawerItem(
                                    icon: const Icon(
                                      Icons.analytics_outlined,
                                      color: Colors.black45,
                                      size: 35,
                                    ),
                                    label: const Text(
                                      'Daily Summary',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    isCollapsed: isCollapsedAfterSec,
                                  ),
                                ),
                                // Drittes Item
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      print("pressed alarm");
                                      screen = 2;
                                    });
                                  },
                                  child: DrawerItem(
                                    icon: const Icon(
                                      Icons.bookmarks,
                                      color: Colors.black45,
                                      size: 35,
                                    ),
                                    label: const Text(
                                      'Item 3',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    isCollapsed: isCollapsedAfterSec,
                                  ),
                                ),
                                //Viertes Item
                                DrawerItem(
                                  icon: const Icon(
                                    Icons.bookmarks,
                                    color: Colors.black45,
                                    size: 35,
                                  ),
                                  label: const Text(
                                    'Item 4',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  isCollapsed: isCollapsedAfterSec,
                                ),
                                // Fünftes Item
                                DrawerItem(
                                  icon: const Icon(
                                    Icons.bookmarks,
                                    color: Colors.black45,
                                    size: 35,
                                  ),
                                  label: const Text(
                                    'Item 5',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  isCollapsed: isCollapsedAfterSec,
                                ),
                                // Sechstes Item
                                DrawerItem(
                                  icon: const Icon(
                                    Icons.bookmarks,
                                    color: Colors.black45,
                                    size: 35,
                                  ),
                                  label: const Text(
                                    'Item 6',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  isCollapsed: isCollapsedAfterSec,
                                ),
                                // Siebentes Item
                                DrawerItem(
                                  icon: const Icon(
                                    Icons.bookmarks,
                                    color: Colors.black45,
                                    size: 35,
                                  ),
                                  label: const Text(
                                    'Item 7',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                  isCollapsed: isCollapsedAfterSec,
                                ),
                                const Spacer(),
                                // * Bottom Toggle Button
                                if (_controller.value >= 1)
                                  DrawerCollapse(
                                    isCollapsed: isCollapsed,
                                    onTap: onCollapseTap,
                                  ),
                              ],
                            )
                          : const SizedBox(),
                    );
                  },
                ),

                // * The left area on the side which will used
                // * to close the drawer when tapped

                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      if (!isCollapsed) {
                        onCollapseTap();
                      }
                      ;
                      reverseAnimation();
                      showDrawer;
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
