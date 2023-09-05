import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  // late - 나중에 이 값이 선언이 되어 있을거다. ?룰 쓴다면 null 처리를 계속 해주어야 함. --> 사용하기 전 무조건 선언해야 함
  // late - the value is to be initialized later
  // if here like 'TabController?', then have to remind always null value
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    // vsync에는 SingleTickerProviderStateMixin 선언 후, 이 클래스(this)를 집어 넣어주면 됨
    // 'vsync' - 1. declare 'with SingleTickerProviderStateMixin' 2. put value 'this'
    controller = TabController(length: 4, vsync: this);

    // 컨트롤러 작동할 때 마다 실행해라
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '음식 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (int index) {
          // setState(() {
          //   this.index = index;
          // });

          // index로 움직여라
          controller.animateTo(index);
        },
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '프로필',
          ),
        ],
      ),
      child: TabBarView(
        // tabbarview에서는 swipe 스크롤 안됨
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const RestaurantScreen(),
          Center(child: Container(child: const Text('음식'))),
          Center(child: Container(child: const Text('주문'))),
          Center(child: Container(child: const Text('프로필'))),
        ],
      ),
      // child: const Center(
      //   child: Text('Root Tab'),
      // ),
    );
  }
}
