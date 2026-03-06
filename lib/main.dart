import 'package:flutter/material.dart';

void main() {
  runApp(const DesertGallery());
}

class DesertGallery extends StatelessWidget {
  const DesertGallery({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFFFF6EC);
    const primary = Color(0xFF8A4B2A);
    const secondary = Color(0xFFD6864A);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery Application',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          primary: primary,
          secondary: secondary,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF4D2A18),
          elevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: primary.withValues(alpha: 0.15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: primary.withValues(alpha: 0.15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: primary, width: 1.5),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const titleColor = Color(0xFF4D2A18);
    const subtitleColor = Color(0xFF8A4B2A);

    return Scaffold(
      appBar: AppBar(title: const Text('Desert Gallery')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.system_update_tv_outlined,
                  size: 68,
                  color: Color(0xFFD6864A),
                ),
                const SizedBox(height: 18),
                Text(
                  'Welcome',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Discover our stunning desert collection',
                  style: TextStyle(fontSize: 17, color: subtitleColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name here',
                    labelText: 'Your Name',
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              GalleryScreen(userName: _nameController.text),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your name'),
                          backgroundColor: Color(0xFF8A4B2A),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Start Exploring',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryScreen extends StatefulWidget {
  final String userName;

  const GalleryScreen({super.key, required this.userName});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int currentIndex = 0;

  final List<GalleryItem> galleryItems = [
    GalleryItem(
      image: 'assets/images/dessert1.png',
      description: 'Golden dunes under a soft sunset glow',
    ),
    GalleryItem(
      image: 'assets/images/dessert2.png',
      description: 'A vast sandy horizon with calm ambiance',
    ),
    GalleryItem(
      image: 'assets/images/dessert3.png',
      description: 'Desert landscape with warm earthy colors',
    ),
  ];

  void _nextImage() {
    if (currentIndex < galleryItems.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const titleColor = Color(0xFF4D2A18);
    const subtitleColor = Color(0xFF8A4B2A);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi ${widget.userName}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Desert Picks for ${widget.userName}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withValues(alpha: 0.12),
                      blurRadius: 18,
                      spreadRadius: 1,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    galleryItems[currentIndex].image,
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  galleryItems[currentIndex].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: subtitleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              Text(
                'Image ${currentIndex + 1} of ${galleryItems.length}',
                style: const TextStyle(fontSize: 16, color: subtitleColor),
              ),
              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: currentIndex > 0 ? _previousImage : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: const Color(0xFFEADFD6),
                    ),
                  ),
                  const SizedBox(width: 24),

                  ElevatedButton.icon(
                    onPressed: currentIndex < galleryItems.length - 1
                        ? _nextImage
                        : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Next'),
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: const Color(0xFFEADFD6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryItem {
  final String image;
  final String description;

  GalleryItem({required this.image, required this.description});
}
