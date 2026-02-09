import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RTL Story View Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RtlStoryExample(),
    );
  }
}

class RtlStoryExample extends StatefulWidget {
  @override
  _RtlStoryExampleState createState() => _RtlStoryExampleState();
}

class _RtlStoryExampleState extends State<RtlStoryExample> {
  final StoryController controller = StoryController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RTL Story Example - مثال RTL"),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: StoryView(
          storyItems: [
            StoryItem.text(
              title: "مرحباً بك!\n\nهذا مثال على دعم اللغة العربية",
              backgroundColor: Colors.blue,
              textStyle: TextStyle(
                fontSize: 30,
              ),
            ),
            StoryItem.pageImage(
              url: "https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2",
              caption: Text(
                "شريط التقدم يعمل من اليمين لليسار! 🎉",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  backgroundColor: Colors.black54,
                ),
              ),
              controller: controller,
            ),
            StoryItem.text(
              title: "التنقل يعمل بشكل صحيح في RTL",
              backgroundColor: Colors.green,
            ),
          ],
          controller: controller,
          repeat: true,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
