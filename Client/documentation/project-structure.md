# Project structure

## Structure

### core

Includes all the common models/utils/constants/services for app features.

### features

The project is feature-based structured. Each folder represents a feature in the project and should
contain the following structure:

* data
* domain
* presentation
  * pages
  * widgets
* provider

### routing

Stuff related to app navigation and route setup. Guards and observers are also kept here.

## Naming conventions

This folder structure should be found under each app feature folder:

* data/[model_name]_model.dart
* domain/[service_name]_service.dart
* presentation/pages/[page_name]_page.dart
* presentation/widgets/[widget_name]_widget.dart
* provider/[provider_name]_provider.dart
