# HTTP requests

This project is using the [HTTP](https://pub.dev/packages/http) package for implementing HTTP requests.

## Implementation

The [Base HTTP Service](https://gitlab.netrom.live/netrom/flutter/rnd/-/blob/main/Boilerplate/lib/core/services/base_http_service.dart) is the service used for managing HTTP requests. All other HttpServices can extend this service in order to call get, post, put and delete methods. This service uses the methods provided by [HTTP](https://pub.dev/packages/http) package in order to make requests. An example of implementing the basic get method can be found here:

```dart
import 'package:http/http.dart' as http;

class BaseHttpService {
    Future<Response> get(String path, [String? token]) async {
        var response = await http.get(Uri.parse(path), headers: _getHeaders(token))
            .timeout(_timeout);

        return response;
    }

    [...]

    Map<String, String> _getHeaders(String? token) {
        if (token != null) {
            return {
                'content-type': 'application/json',
                'accept': 'application/json',
                'Authorization': 'Bearer $token',
            };
        }
        return {'content-type': 'application/json', 'accept': 'application/json'};
    }
}
```

An example of extending this service in order to use the get method can be found in [Orders service](https://gitlab.netrom.live/netrom/flutter/rnd/-/blob/main/Boilerplate/lib/core/services/orders_service.dart):

```dart
import 'base_http_service.dart';

class OrdersService extends BaseHttpService {

    static const ordersRoute = 'orders';

    Future<List<OrderModel>> fetchOrders() async {
        try {
            final res = await get(
                buildUri(
                Constants.apiBaseUrl,
                ordersRoute,
                ),
                token,
            );

            if (res.statusCode == HttpStatus.ok) {
                [...]
            }
        } on BaseException {
            [...]
            
        } catch (e, stacktrace) {
            [...]
        }
    }
}
```

## Alternatives

An alternative for using the HTTP package is [dio](https://pub.dev/packages/dio) which supports global configuration, interceptors, request cancellation, file uploading/downloading, timeout, custom adapters, etc.
