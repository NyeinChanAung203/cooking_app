import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  static const routeName = '/meal-detail';
  final String id;
  final String title;
  final String imgURL;
  final int duration;

  const MealItem({
    required this.id,
    required this.title,
    required this.imgURL,
    required this.duration,
    super.key,
  });

  void navigateMealDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => navigateMealDetail(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.2),
                offset: Offset(1, 1),
                blurRadius: 15,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 150,
                child: Hero(
                  tag: imgURL,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imgURL,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              // SizedBox(height: 15),
              Text(
                '$title',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ro',
                ),
              ),

              Text(
                '$duration min',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
