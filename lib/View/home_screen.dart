import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Provider/train_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TrainProvider? trainProviderT;
  TrainProvider? trainProviderF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<TrainProvider>(context, listen: false).getTrain();
  }

  @override
  Widget build(BuildContext context) {
    // trainProviderT = Provider.of<TrainProvider>(context, listen: true);
    // trainProviderF = Provider.of<TrainProvider>(context, listen: false);
    trainProviderT = context.watch<TrainProvider>();
    trainProviderF = context.read<TrainProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search Train",
            style: GoogleFonts.lato(),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: trainProviderF!.getTrain(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List? l1 = snapshot.data;

              return ListView.builder(
                itemCount: l1!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${l1[index].name}"),
                    subtitle: Text("${l1[index].data.days.sun}"),
                    leading: Text("${l1[index].trainNum}"),
                    trailing: Text("${l1[index].data.classes[2]}"),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
