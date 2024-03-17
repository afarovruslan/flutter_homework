import 'package:flutter/material.dart';
import 'dart:io';

import 'package:news/network/models.dart';
import 'view.dart';
import 'package:news/network/network.dart';

class NewsScroll extends StatefulWidget {
  const NewsScroll({super.key});

  @override
  State<NewsScroll> createState() => _NewsScrollState();
}

class _NewsScrollState extends State<NewsScroll> {
  static const int _kDefaultNewsCount = 40;
  static const int _kFreeArticleCount = 300;

  late ScrollController _controller;
  bool _hasNextLoad = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  bool _isError = false;
  final List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    _parseMore();
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextLoad && !_isFirstLoadRunning && !_isLoadMoreRunning && _controller.position.extentAfter < _kFreeArticleCount) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _parseMore();
      setState(() {
        _isLoadMoreRunning = false;
      });
    } else {
      setState(() {
        _hasNextLoad = false;
      });
    }
  }

  Future<void> _parseMore() async {
    final newArticles = await getModels(count: _kDefaultNewsCount);
    if (newArticles == null) {
      setState(() {
        _isError = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      exit(1);
    }
    setState(() {
      _articles.addAll(newArticles.articles!);
    });
  }

  @override
  Widget build(context) {
    if (_isError) {
      return Container(
        padding: const EdgeInsets.only(top: 30, bottom: 40),
        color: Colors.amber,
        child: const Center(
          child: Text('Ошибка'),
        ),
      );
    }
    return _isFirstLoadRunning ? const Center(child: CircularProgressIndicator())
        : Column(
      children: [
        Expanded(child:
            ListView.builder(
              controller: _controller,
              itemCount: _articles.length,
              itemBuilder: (_, index) => Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 10),
                child: Text(_articles[index].title)
                ),
              ),
            ),
        if (_isLoadMoreRunning)
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 40),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (!_hasNextLoad)
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 40),
            color: Colors.amber,
            child: const Center(
              child: Text('Плати больше деняк!'),
            ),
          ),
      ],
    );
  }
}