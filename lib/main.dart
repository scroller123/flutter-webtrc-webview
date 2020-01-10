import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


//v3
//Future main() async {
//  runApp(new MyApp());
//}
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => new _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//
//  InAppWebViewController webView;
//  String url = "";
//  double progress = 0;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('InAppWebView Example'),
//        ),
//        body: Container(
//            child: Column(children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(20.0),
//                child: Text(
//                    "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
//              ),
//              Container(
//                  padding: EdgeInsets.all(10.0),
//                  child: progress < 1.0
//                      ? LinearProgressIndicator(value: progress)
//                      : Container()),
//              Expanded(
//                child: Container(
//                  margin: const EdgeInsets.all(10.0),
//                  decoration:
//                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
//                  child: InAppWebView(
//                    initialUrl: "https://flutter.dev/",
//                    initialHeaders: {},
//                    initialOptions: InAppWebViewWidgetOptions(
//                        crossPlatform: InAppWebViewOptions(
//                          debuggingEnabled: true,
//                        )
//                    ),
//                    onWebViewCreated: (InAppWebViewController controller) {
//                      webView = controller;
//                    },
//                    onLoadStart: (InAppWebViewController controller, String url) {
//                      setState(() {
//                        this.url = url;
//                      });
//                    },
//                    onLoadStop: (InAppWebViewController controller, String url) async {
//                      setState(() {
//                        this.url = url;
//                      });
//                    },
//                    onProgressChanged: (InAppWebViewController controller, int progress) {
//                      setState(() {
//                        this.progress = progress / 100;
//                      });
//                    },
//                  ),
//                ),
//              ),
//              ButtonBar(
//                alignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  RaisedButton(
//                    child: Icon(Icons.arrow_back),
//                    onPressed: () {
//                      if (webView != null) {
//                        webView.goBack();
//                      }
//                    },
//                  ),
//                  RaisedButton(
//                    child: Icon(Icons.arrow_forward),
//                    onPressed: () {
//                      if (webView != null) {
//                        webView.goForward();
//                      }
//                    },
//                  ),
//                  RaisedButton(
//                    child: Icon(Icons.refresh),
//                    onPressed: () {
//                      if (webView != null) {
//                        webView.reload();
//                      }
//                    },
//                  ),
//                ],
//              ),
//            ])),
//      ),
//    );
//  }
//}

//v2
void main() => runApp(new MyApp());
//void main()  {
////  WidgetsFlutterBinding.ensureInitialized();
//
////  PermissionHandler().requestPermissions([PermissionGroup.camera, PermissionGroup.microphone]);
//  runApp(new MyApp());
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InAppWebViewPage()
    );
  }
}

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  InAppWebViewController webView;

  StatelessWidget containe = Container(
      width: 200,
      height: 200,
      child: Column(children: <Widget>[
        Expanded(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 200,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(600)),
                color: Color(0xffffffff)),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(600)),
              child: InAppWebView(
                  initialUrl: "https://appr.tc/r/158489246",
//                      initialUrl: "https://proxy.art54.ru:8080",
                  initialHeaders: {},
                  initialOptions: InAppWebViewWidgetOptions(
                    crossPlatform: InAppWebViewOptions(
                      mediaPlaybackRequiresUserGesture: false,
                      debuggingEnabled: true,
                      javaScriptEnabled: true,
                      javaScriptCanOpenWindowsAutomatically: true,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
//                    webView = controller;

                  },
                  onLoadStart: (InAppWebViewController controller, String url) {

                  },
                  onLoadStop: (InAppWebViewController controller, String url) {

                  },
                  androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                    print(origin);
                    print(resources);
                    return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                  }
              ),
            ),

          ),
        ),
      ]));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("InAppWebView")
        ),
        body: Draggable(
          child: containe,
          feedback: containe,
          childWhenDragging:  containe,
        ),

    );
  }
}

//v1
////Future main() async {
////  await PermissionHandler().requestPermissions([PermissionGroup.camera, PermissionGroup.microphone]);
////  runApp(new MyApp());
////}
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: FirstScreen(),
//    );
//  }
//}
//
//class FirstScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('WebView Sample'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Launch WebView'),
//          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => SecondScreen()),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class SecondScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return WebviewScaffold(
////      url: "https://proxy.art54.ru:8080",
////      url: "https://appr.tc/r/158489234",
//      url: "https://webrtc.github.io/test-pages/src/audio-and-video/",
//      appBar: new AppBar(
//        title: new Text("Widget WebView"),
//      ),
//      ignoreSSLErrors: true,
//      withJavascript: true,
//      appCacheEnabled: true,
//      allowFileURLs: true,
//      primary: true,
//      geolocationEnabled: true,
//      withLocalStorage: true,
//      supportMultipleWindows: true,
//      mediaPlaybackRequiresUserGesture: false,
//      debuggingEnabled: true,
//      useWideViewPort: true,
//      enableAppScheme: true,
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
