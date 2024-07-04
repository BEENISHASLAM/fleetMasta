import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PaginationDemo extends StatefulWidget {
  @override
  _PaginationDemoState createState() => _PaginationDemoState();
}

class _PaginationDemoState extends State<PaginationDemo> {
  int currentPage = 1;
  final int totalPages = 4;

  void _nextPage() {
    setState(() {
      if (currentPage < totalPages) {
        currentPage++;
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (currentPage > 1) {
        currentPage--;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentPage = page;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: currentPage == page ? Colors.pink : Colors.grey,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            '$page',
            style: TextStyle(
              color: currentPage == page ? Colors.pink : Colors.grey,
              fontSize: 10
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
    Row(
        children: [
           InkWell(
             onTap: _nextPage,
               child: SvgPicture.asset('assets/icons/icon-front.svg',width: 5,),),
          SizedBox(width: 6,),
          _buildPageIndicator(1),
          _buildPageIndicator(2),
          _buildPageIndicator(3),
          _buildPageIndicator(4),
          SizedBox(width: 6,),
          InkWell(
              onTap: _previousPage,
              child: SvgPicture.asset('assets/icons/icon-back.svg',width: 5,)),
        ],

    );
  }
}
