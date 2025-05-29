  import 'package:flutter/material.dart';

  void main() => runApp(TempConverterApp());

  class TempConverterApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Temperature Converter',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
            primary: Colors.indigo,
            secondary: Colors.indigoAccent,
          ),
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: TempConverterHomePage(),
        debugShowCheckedModeBanner: false,
      );
    }
  }

  class TempConverterHomePage extends StatefulWidget {
    @override
    _TempConverterHomePageState createState() => _TempConverterHomePageState();
  }

  class _TempConverterHomePageState extends State<TempConverterHomePage> {
    final TextEditingController _controller = TextEditingController();
    String _result = '';
    String _conversionType = 'FtoC';
    List<bool> _selectedToggle = [true, false];
    List<String> _history = [];

    void _convertTemperature() {
      double? input = double.tryParse(_controller.text);
      if (input == null) {
        setState(() {
          _result = 'Invalid input!';
        });
        return;
      }

      double converted;
      String historyEntry;

      if (_conversionType == 'FtoC') {
        converted = (input - 32) * 5 / 9;
        _result = '${converted.toStringAsFixed(2)} °C';
        historyEntry = 'F to C: ${input.toStringAsFixed(1)} → ${converted.toStringAsFixed(2)}';
      } else {
        converted = input * 9 / 5 + 32;
        _result = '${converted.toStringAsFixed(2)} °F';
        historyEntry = 'C to F: ${input.toStringAsFixed(1)} → ${converted.toStringAsFixed(2)}';
      }

      setState(() {
        _history.insert(0, historyEntry);
      });
    }

    @override
    Widget build(BuildContext context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;

      return Scaffold(
        appBar: AppBar(
          title: Text('Temperature Converter'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.thermostat_outlined,
                  size: 64, color: Theme.of(context).colorScheme.primary),
              SizedBox(height: 16),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter temperature',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).colorScheme.primary,
                  isSelected: _selectedToggle,
                  onPressed: (index) {
                    setState(() {
                      for (int i = 0; i < _selectedToggle.length; i++) {
                        _selectedToggle[i] = i == index;
                      }
                      _conversionType = _selectedToggle[0] ? "FtoC" : "CtoF";
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("F → C"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("C → F"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.swap_horiz),
                  label: Text('Convert'),
                  onPressed: _convertTemperature,
                  style: ElevatedButton.styleFrom(
                    // Use a bright accent color for dark mode to stand out
                    backgroundColor: isDark ? Colors.amber : null,
                    foregroundColor: isDark ? Colors.black : null,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 16),
              if (_result.isNotEmpty)
                Center(
                  child: Text(
                    'Result: $_result',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 24),
              Text('History', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 8),
              if (_history.isEmpty)
                Text('No history yet.')
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _history.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: Icon(Icons.history,
                            color: Theme.of(context).colorScheme.primary),
                        title: Text(_history[index]),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      );
    }
  }
