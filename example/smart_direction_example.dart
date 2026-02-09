import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(SmartDirectionApp());

class SmartDirectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Direction Detection Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SmartDirectionExample(),
    );
  }
}

class SmartDirectionExample extends StatefulWidget {
  @override
  _SmartDirectionExampleState createState() => _SmartDirectionExampleState();
}

class _SmartDirectionExampleState extends State<SmartDirectionExample> {
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
        title: Text("Smart Auto-Detection - الكشف التلقائي الذكي"),
      ),
      body: StoryView(
        storyItems: [
          // Arabic story - will auto-detect RTL
          StoryItem.text(
            title: "مرحباً! 👋\n\nهذه القصة تستخدم الكشف التلقائي\n\nتم اكتشاف اتجاه النص تلقائياً!",
            backgroundColor: Colors.blue,
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // English story - will auto-detect LTR
          StoryItem.text(
            title: "Hello! 👋\n\nThis story uses auto-detection\n\nText direction detected automatically!",
            backgroundColor: Colors.green,
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Hebrew story - will auto-detect RTL
          StoryItem.text(
            title: "שלום! 👋\n\nזה הסיפור משתמש בגילוי אוטומטי\n\nכיוון הטקסט התגלה אוטומטית!",
            backgroundColor: Colors.purple,
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Spanish story - will auto-detect LTR
          StoryItem.text(
            title: "¡Hola! 👋\n\nEsta historia usa detección automática\n\n¡Dirección del texto detectada automáticamente!",
            backgroundColor: Colors.orange,
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Persian/Farsi story - will auto-detect RTL
          StoryItem.text(
            title: "سلام! 👋\n\nاین داستان از تشخیص خودکار استفاده می‌کند\n\nجهت متن به صورت خودکار تشخیص داده شد!",
            backgroundColor: Colors.teal,
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // French story - will auto-detect LTR
          StoryItem.text(
            title: "Bonjour! 👋\n\nCette histoire utilise la détection automatique\n\nDirection du texte détectée automatiquement!",
            backgroundColor: Colors.indigo,
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Mixed content example - starts with Arabic (RTL)
          StoryItem.text(
            title: "العربية والإنجليزية معاً\n\nArabic and English together\n\n🌍 Multilingual Support",
            backgroundColor: Colors.deepPurple,
            textStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Final message
          StoryItem.text(
            title: "✨ No textDirection parameter needed!\n\n✨ لا حاجة لمعامل textDirection!\n\nAuto-detection works seamlessly 🎉",
            backgroundColor: Colors.pink,
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        controller: controller,
        repeat: true,
        // Notice: NO textDirection parameter specified!
        // The widget will auto-detect from the story content
      ),
    );
  }
}
