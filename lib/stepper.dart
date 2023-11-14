import 'package:flutter/material.dart';
import 'package:flutter_stepper/pages/first_page.dart';
import 'package:flutter_stepper/pages/second_page.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List pages = [
    const FirstPage(),
    const SecondPage(),
    const FirstPage(),
    const SecondPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'CUSTOM STEPPER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //let's add some padding press alt enter
          const SizedBox(
            height: 10,
          ),
          StepperComponent(
            currentIndex: _currentIndex,
            onTap: () {},
          ),

          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 450,
            child: PageView.builder(
                //only scroll with bubbles
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (page) {
                  setState(() {
                    _currentIndex = page;
                  });
                },
                itemBuilder: (context, index) {
                  return pages[_currentIndex];
                }),
          ),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentIndex += 1;
                  });
                },
                child: const Text('Next')),
          )
        ],
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  //currentIndex is index that is gonna change on Tap
  final int currentIndex;
  //onTap CallBack
  final VoidCallback onTap;

  const StepperComponent({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //this is the bubble
              SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor:
                      currentIndex >= 0 ? Colors.blue : Colors.white,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color:
                            currentIndex >= 0 ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              //this the ligne
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor:
                      currentIndex >= 1 ? Colors.blue : Colors.white,
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color:
                            currentIndex >= 1 ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              //this the ligne
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor:
                      currentIndex >= 2 ? Colors.blue : Colors.white,
                  child: Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color:
                            currentIndex >= 2 ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              //this the ligne
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor:
                      currentIndex >= 3 ? Colors.blue : Colors.white,
                  child: Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                        color:
                            currentIndex >= 3 ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
