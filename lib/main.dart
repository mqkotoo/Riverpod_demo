import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/provider.dart';

void main() {
  // ここで全体を囲む
  runApp(ProviderScope(child: const MyApp()));
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
      home: MyHomePage(),
    );
  }
}

// ConsumerWidgetを使う
class MyHomePage extends ConsumerWidget{

  @override
  // WidgetRef ref　でrefを使えるようにする
  Widget build(BuildContext context,WidgetRef ref) {

    // ref.watchを使ってプロバイダーを指定する
    var countProvider = ref.watch(CounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('riverpod demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              countProvider.count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
                onPressed: countProvider.resetCount,
                child: Text("リセット"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: countProvider.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
