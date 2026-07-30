import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:reciepe_app/main.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = MockHttpOverrides();
  });

  testWidgets('App renders successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RecipeApp());
    await tester.pumpAndSettle();

    // Verify that Seafood category title is displayed.
    expect(find.text('Seafood'), findsWidgets);
  });
}

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _MockHttpClient();
  }
}

class _MockHttpClient implements HttpClient {
  @override
  bool autoUncompress = true;
  @override
  Duration? connectionTimeout;
  @override
  Duration idleTimeout = const Duration(seconds: 15);
  @override
  String? userAgent;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    return _MockHttpClientRequest(url);
  }

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) async {
    return _MockHttpClientRequest(url);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MockHttpClientRequest implements HttpClientRequest {
  final Uri url;
  _MockHttpClientRequest(this.url);

  @override
  HttpHeaders get headers => _MockHttpHeaders();

  @override
  Future<HttpClientResponse> close() async {
    if (url.path.contains('categories.php')) {
      final jsonStr = jsonEncode({
        "categories": [
          {"idCategory": "1", "strCategory": "Seafood", "strCategoryThumb": "", "strCategoryDescription": ""}
        ]
      });
      return _MockHttpClientResponse(utf8.encode(jsonStr));
    } else if (url.path.contains('filter.php')) {
      final jsonStr = jsonEncode({
        "meals": [
          {"idMeal": "1", "strMeal": "Fish Dish", "strMealThumb": ""}
        ]
      });
      return _MockHttpClientResponse(utf8.encode(jsonStr));
    }
    // Transparent 1x1 GIF for image requests
    final transparentGif = base64Decode('R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7');
    return _MockHttpClientResponse(transparentGif);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MockHttpHeaders implements HttpHeaders {
  @override
  void add(String name, Object value, {bool preserveHeaderCase = false}) {}

  @override
  void set(String name, Object value, {bool preserveHeaderCase = false}) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MockHttpClientResponse implements HttpClientResponse {
  final List<int> _data;

  _MockHttpClientResponse(this._data);

  @override
  int get statusCode => 200;

  @override
  int get contentLength => _data.length;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  HttpHeaders get headers => _MockHttpHeaders();

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.fromIterable([_data]).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
