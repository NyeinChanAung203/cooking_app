
import 'package:cooking_app/model/dummy_data.dart';
import 'package:cooking_app/model/meal.dart';


import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  static const routeName = '/search';
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final textController = TextEditingController();

  List<Meal> _searchMealList = [];

  
  //* If you use TextEditingController 
  //** dont forget to dispose it
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
 Container(
   margin: const EdgeInsets.symmetric(vertical: 16),
   
   height: 60,
   child: TextField(
    onTapOutside: (event) {
      FocusManager.instance.primaryFocus?.unfocus();
    },
     controller: textController,
     decoration: InputDecoration(
isDense: true,
       border:OutlineInputBorder(
         borderRadius: BorderRadius.circular(50),
       ),
       hintText: 'Search your recipe',
       prefixIcon: Icon(Icons.search),
       suffixIcon: 
      GestureDetector(child: Icon(Icons.clear,size: 24,) ,onTap:  (){
        textController.clear();
       })
        
     ),
     onChanged: (value) {
      setState(() {
        /// If you want to clear all search items 
        /// when the text in the input is cleared, use the following code:
        /*
        if(textController.text.isEmpty){
          _searchMealList.clear();
        }else{
          _searchMealList =  MealsList.where((element) => element.title.toLowerCase().contains(value)).toList();
        }
        */
        _searchMealList =  MealsList.where((element) => element.title.toLowerCase().contains(value)).toList();
        bool isGluton = filters['gluton']!;
        bool isLuctose = filters['luctose']!;
        bool isVegan = filters['vegan']!;
        _searchMealList = _searchMealList.where((element) => element.isGluton == isGluton && element.isLuctose == isLuctose && element.isVegan == isVegan).toList();
      });
       
     },
   ),
 ),
             Expanded(
               child: GridView.builder(
                  
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 9/11,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    ),
                  itemCount: _searchMealList.length,
                  itemBuilder: (context, index) {
                  final meal = _searchMealList[index];
                  return InkWell(
                    onTap: (){
                    
  
    Navigator.of(context).pushNamed(
      '/meal-detail',arguments: meal.id
    );
  
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: NetworkImage(meal.imgURL),
                        fit: BoxFit.cover),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.00005,0.345,0.7],
                                colors: [
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.2),
                                Colors.transparent,
                              ],)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(meal.title,textAlign: TextAlign.center,style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),),
                          ),
                        ],
                      ),),
                  );
                  
                } ,
                
                ),
             )
          ],)
              
           
        ),
      ),
    );
  }
}
