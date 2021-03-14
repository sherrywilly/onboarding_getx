import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:onboarding_getx/controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller.pageController,
            onPageChanged: _controller.selectedPageIndex,
            itemCount: _controller.onboardingPages.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(_controller.onboardingPages[index].imageAsset),
                    SizedBox(height: 32),
                    Text(
                      _controller.onboardingPages[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _controller.onboardingPages[index].description,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(() {
                        return Container(
                          margin: EdgeInsets.all(4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _controller.selectedPageIndex == index
                                ? Colors.red
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      })),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: _controller.forwardAction,
              child: Obx(() {
                return Text(_controller.isLastPage ? 'Start' : 'Next');
              }),
            ),
          ),
        ],
      ),
    );
  }
}
