import 'package:flutter/material.dart';
import 'package:flutter_app/models/match.dart';
import 'package:flutter_app/services/match_service.dart';
import 'package:flutter_app/widgets/match_card.dart';

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  List<Match> matches = [];

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  fetchMatches() async {
    List<Match> fetchedMatches = await MatchService.getMatches();
    setState(() {
      matches = fetchedMatches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return MatchCard(match: matches[index]);
        },
      ),
    );
  }
}