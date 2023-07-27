import 'package:authentication/Profile/KYC/Mechanic%20KYC/machanic_page1.dart';
import 'package:authentication/Profile/KYC/Mechanic%20KYC/machanic_page2.dart';
import 'package:authentication/Profile/KYC/Mechanic%20KYC/machanic_page3.dart';
import 'package:authentication/Profile/KYC/Mechanic%20KYC/machanic_page4.dart';
import 'package:flutter/material.dart';

class MechanicKYCPath extends StatefulWidget {
  @override
  _MechanicKYCPathState createState() => _MechanicKYCPathState();
}

class _MechanicKYCPathState extends State<MechanicKYCPath>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _progressValue = 0.25; // Set the initial progress value

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      _progressValue = (_tabController.index + 1) / _tabController.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Upload KYC-Mechanic  ',
          style: TextStyle(fontSize: 30),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(),
                tabs: const [
                  Tab(
                    child: Text(
                      'Personal Details',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'ID Proof',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Workshop',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Bank Details',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 4,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.green[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                    value: _progressValue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: MachanicPage1(onNextPage: () {
            _tabController.animateTo(_tabController.index + 1);
          }),),
          Center(child: MachanicPage2(onNextPage: () {
            _tabController.animateTo(_tabController.index + 1);
          }),),
          Center(child: MachanicPage3(onNextPage: () {
            _tabController.animateTo(_tabController.index + 1);
          }),),
          Center(child: MachanicPage4()),
        ],
      ),
    );
  }
}
