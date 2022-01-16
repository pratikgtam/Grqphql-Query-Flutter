import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_learn1/models/query_model.dart';

const graphqQlQuery = '''
query{
  activeLenders{
    name
    btl
  reference
    resi
    type
  }
}''';

void main() {
  final httpLink = HttpLink("Write your graphql link here");

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()), link: httpLink));

  runApp(GraphQLProvider(client: client, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Query(
        options: QueryOptions(document: gql(graphqQlQuery)),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<ActiveLender> list =
              QueryModel.fromMap(result.data ?? {}).activeLenders;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(list[index].name),
                subtitle: Text(list[index].reference),
                trailing: Text(list[index].type),
              );
            },
          );
        },
      ),
    );
  }
}
