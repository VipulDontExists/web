import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Facts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RandomFactScreen(),
    );
  }
}

class RandomFactScreen extends StatelessWidget {
  final Map<String, List<String>> facts = {
    'Science': [
      'Water is composed of two hydrogen atoms and one oxygen atom.',
      'The speed of light is 299,792,458 meters per second.',
      'Humans share about 60% of their DNA with bananas.',
      'The Earth’s core is as hot as the surface of the sun.',
      'The Eiffel Tower can be 15 cm taller during the summer.',
      'The human brain contains about 86 billion neurons.',
      'A day on Venus is longer than a year on Venus.',
      'Honey never spoils; archaeologists have found pots of honey in ancient tombs.',
      'Octopuses have three hearts.',
      'A bolt of lightning can reach temperatures of 30,000 Kelvin.'
    ],
    'Space': [
      'There are more stars in the universe than grains of sand on Earth.',
      'Neutron stars are so dense that a teaspoon of their material would weigh as much as all of humanity.',
      'The largest volcano in the solar system is on Mars, and it’s called Olympus Mons.',
      'A year on Mercury is just 88 Earth days.',
      'There is a planet made of diamond called 55 Cancri e.',
      'The Sun makes up 99.86% of the mass of our Solar System.',
      'Saturn’s moon Titan has lakes made of methane.',
      'One teaspoon of a black hole’s material weighs as much as a mountain.',
      'The Milky Way galaxy has about 200 billion stars.',
      'The largest known star, UY Scuti, is over 1700 times the size of the Sun.'
    ],
    'Computer Technology': [
      'The first computer virus was created in 1983.',
      'The first computer mouse was made of wood.',
      'The first website was launched in 1991.',
      'A single Google search uses the same amount of energy as boiling a kettle of water.',
      'The first email was sent by Ray Tomlinson in 1971.',
      'The word “robot” comes from the Czech word “robota,” meaning forced labor.',
      'A modern smartphone has more processing power than the Apollo 11 lunar module.',
      'The first computer bug was a moth stuck in a computer.',
      'Bluetooth is named after a Viking king, Harald Bluetooth.',
      'The first computer programmer was Ada Lovelace.'
    ],
    'Earth': [
      'Earth is the only planet known to support life.',
      'The Earth is 4.5 billion years old.',
      'Earth’s oceans contain 97% of the planet’s water.',
      'Mount Everest is the tallest mountain on Earth at 8,848 meters.',
      'The Great Barrier Reef is the largest living structure on Earth.',
      'There are about 8 million species of plants and animals on Earth.',
      'The Earth’s rotation is slowing down by about 17 milliseconds per hundred years.',
      'Earth’s magnetic field protects us from harmful solar radiation.',
      'The longest river in the world is the Nile River.',
      'The Earth’s atmosphere is composed of 78% nitrogen, 21% oxygen.'
    ],
    'Environment': [
      'The Amazon rainforest produces 20% of the world’s oxygen.',
      'More than 1 million plastic bottles are bought every minute.',
      'Climate change is melting glaciers and raising sea levels.',
      'Trees absorb carbon dioxide and release oxygen.',
      'The Arctic is warming twice as fast as the global average.',
      'A single tree can absorb about 48 pounds of carbon dioxide a year.',
      'Air pollution is responsible for millions of deaths annually.',
      'The ocean covers 71% of the Earth’s surface.',
      'Coral reefs support about 25% of all marine species.',
      'Earth Day is celebrated every year on April 22nd.'
    ],
    'History': [
      'The Great Wall of China is over 13,000 miles long.',
      'Cleopatra lived closer to the invention of the iPhone than to the construction of the pyramids.',
      'The first modern Olympic Games were held in 1896 in Athens.',
      'The Titanic sank on its maiden voyage in 1912.',
      'The first manned moon landing occurred in 1969.',
      'The Eiffel Tower was initially intended as a temporary structure.',
      'The first computer was invented in 1837 by Charles Babbage.',
      'In 1965, the first human spaceflight was conducted by Yuri Gagarin.',
      'The Berlin Wall fell in 1989.',
      'Christopher Columbus discovered America in 1492.'
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Random Facts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade500, Colors.purple.shade700],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Title
                Text(
                  'Choose a Topic:',
                  style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // Topic Buttons - Display as Grid
                Expanded(
                  child: GridView.builder(
                    itemCount: facts.keys.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (context, index) {
                      String topic = facts.keys.elementAt(index);
                      return ElevatedButton(
                        onPressed: () {
                          // Navigate to Fact Page with the selected topic
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FactPage(topic: topic, facts: facts),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Colors.orange.shade500,
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          topic,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FactPage extends StatefulWidget {
  final String topic;
  final Map<String, List<String>> facts;

  FactPage({required this.topic, required this.facts});

  @override
  _FactPageState createState() => _FactPageState();
}

class _FactPageState extends State<FactPage> {
  late String _currentFact;
  late int _factIndex;

  @override
  void initState() {
    super.initState();
    final topicFacts = widget.facts[widget.topic];
    if (topicFacts != null && topicFacts.isNotEmpty) {
      _factIndex = Random().nextInt(topicFacts.length);
      _currentFact = topicFacts[_factIndex];
    } else {
      _currentFact = 'No facts available.';
      _factIndex = 0;
    }
  }

  void _getNextFact() {
    final topicFacts = widget.facts[widget.topic];
    if (topicFacts != null && topicFacts.isNotEmpty) {
      setState(() {
        _factIndex = (_factIndex + 1) % topicFacts.length;
        _currentFact = topicFacts[_factIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.topic} Facts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade500, Colors.purple.shade700],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                // Fact Display Area
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Topic: ${widget.topic}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _currentFact,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        // Next Fact Button
                        Center(
                          child: ElevatedButton(
                            onPressed: _getNextFact,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text(
                              'Next Fact',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
