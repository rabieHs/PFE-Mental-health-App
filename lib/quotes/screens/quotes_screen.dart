import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/quotes/models/quotes_model.dart';
import 'package:mental_health_app/quotes/services/quotes_services.dart';

class QuotesScreen extends StatefulWidget {
  final List<Quotes> quotList;
  final int index;
  const QuotesScreen({super.key, required this.quotList, required this.index});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<Widget> quotes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuotesScreens();
    setState(() {});
  }

  getQuotesScreens() {
    QuotesServices quotesServices = QuotesServices();
    quotes = quotesServices.getquotesScreens(widget.quotList, context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: widget.index);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            children: quotes,
          ),
          Positioned(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Iconsax.arrow_left_2,
                size: 30,
                color: Colors.white,
              ),
            ),
            left: 15,
            top: 60,
          ),
        ],
      ),
    );
  }
}
