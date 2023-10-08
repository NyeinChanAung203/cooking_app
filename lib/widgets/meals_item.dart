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
        onTap: () => navigateMealDetail(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 185, 185, 185),
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
              
              Container(
                height: 150,
                
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgURL),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              // SizedBox(height: 15),
              Text(
                '$title',
                textAlign: TextAlign.center,
                maxLines: 2,
              overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
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
