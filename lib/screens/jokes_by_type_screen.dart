import 'package:flutter/material.dart';
import 'package:mobis_lab2/widgets/gradient_scaffold.dart';
import '../models/joke.dart';
import '../services/api_services.dart';

class JokesByTypeScreen extends StatelessWidget {
  final String type;

  const JokesByTypeScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: Text("$type Jokes"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return Card(
                  color: Colors.white.withOpacity(0.8),
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(joke.setup),
                    subtitle: Text(joke.punchline),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No jokes available"));
          }
        },
      ),
    );
  }
}
