import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'taskListDetail.dart';
import 'sportsScreen.dart';
import 'articleWidget.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("MyFitness 21",),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: _buildTitleRow(),
              ),
              SizedBox(height: 30,),
              _buildTaskList(),
              SizedBox(height: 30,),
              _buildExercises(),
              SizedBox(height: 30,),
              _buildArticles(),
              SizedBox(height: 30,),
              Divider(),
              _buildPrivacy()
          
            ],
          ),
        ),

      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: const NetworkImage('https://avatars.githubusercontent.com/u/115778206?v=4'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Good Afternoon,",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,

              ),
            ),
            Text(
              "Abhay",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
          ),
        ),
        const SizedBox(width: 5),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),
                child: const Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _buildTaskList(){
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => const TaskDetailsScreen()),
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              CircularPercentIndicator(
                radius: 35.0,
                lineWidth: 10.0,
                animation: true,
                percent: 0.7, // Example progress value
                center: const Text(
                  "70%",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blue,
              ),
              SizedBox(width: 15,),
               const Text(
                'Hey there! click here to\ncheck your progress.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(width: 25,),
              // Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),

      ),
    );

  }


  Widget _buildExercises(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose your exercise for today",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20
          ),
        ),
        SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 10),
              _buildSquareButton('GYM', Icons.fitness_center_outlined, () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const SportsScreen() )

                );
              }),
              const SizedBox(width: 10),
              _buildSquareButton('Yoga', Icons.sports_gymnastics_outlined, () {

              }),
              const SizedBox(width: 10),
              _buildSquareButton('Swimming', Icons.pool_outlined, () {
                // Handle Sport 3 tap
              }),
              const SizedBox(width: 10),
              _buildSquareButton('Basketball', Icons.sports_basketball_outlined, () {
                // Handle Sport 3 tap
              }),
              const SizedBox(width: 10),
            ],

          ),
        )

      ],
    );

  }

  Widget _buildSquareButton(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildArticles(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest Articles",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        SizedBox(width: 10), // Adjust as needed for spacing
        ArticleWidget(
          title: 'The Clean Eating Diet Plan Guide',
          imageUrl: 'https://cdn.muscleandstrength.com/sites/default/files/clean-eating-guide-feature.jpg',
          tag: 'By Brad Dieter',
          date: 'January 1st, 2024',
          description: 'When we discuss diet plans we can typically put them along a spectrum where food quantity is on one end and food quality is on the other.Diets like If It Fits Your Macros (IIFYM) fall as far to the food quantity side as possible while clean eating falls as far to the food quality side as possible.Additionally, in direct opposition to diets like IIFYM it imposes guidelines of what types of foods to eat and does not regulate calories of macros to any meaningful degreeThe main principles of clean eating are centered around focusing on the quality of the foods you consume and ensuring they are “clean”The principles can be summarized in one tenant: Choose whole, natural foods and seek to eliminate processed foods..',
          tags: ['Nutrition', 'Health', 'Fitness'],
        ),

      ],
    );
  }


  Widget _buildPrivacy(){
    return Column(

      children: [
        Text("Take control of your health today! Agree to our "),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Terms of Service",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }



}

