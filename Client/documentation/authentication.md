# Authentication

Backend API authentication calls are made using JWT Token. The token is generated on the backend and
sent as a response to a successful login. For enhanced security, the App saves this token in the
locally encrypted shared preferences and uses it with each backend API call.
Using [jwt_decoder pub](https://pub.dev/packages/jwt_decoder) the app is able to decode and validate
JWT web tokens.

The authentication and session persistence is possible due to the following services:

1. Base HTTP Service (base_http_service.dart)

This is the service used for managing HTTP requests. All future HttpServices can extend this service
in order to call get, post, put, and delete methods.

2. Login service (login_service.dart)

This service is responsible for making the login/logout requests to the API.

3. User Settings service (user_settings_service.dart)

This service helps to maintain the logged-in status of the user.
