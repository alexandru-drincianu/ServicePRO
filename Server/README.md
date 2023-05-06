
# NetRom .NET Web API Boilerplate

## Description

This project can be used as a starter for a new .NET Web API solution. It is a **Web Api boilerplate**.
It is intended to be used as a starting point in future projects or as guidance if you want a starting point layer architecture for your backend solution.

## Requirements

This boilerplate application needs the following tools installed before running it:

- .net6.0 / .net7.0

## How to get started?

1. `git clone` this repo.
2. have a SQL server locally and set the connection strings in the `appsettings.json` correctly (in Api and `BoilerplatesDbContext` - `optionsBuilder.UseSqlServer`)
3. open a powershell in `NetRom.Boilerplates.DataAccess` and execute dotnet ef database update to apply migrations to your database
4. clean-up the example code
5. start codding.

## What's inside this boilerplate?

In terms of code, the architecture of the project is based on the 3 Layered Architecture:

### Presentation tier

This layer contains application-independent business logic. This is the part of the business logic which would be the same even if we weren’t building a software. It is a formulation of the core business rules.
The organization of this project follows Domain-Driven design patterns, although this is a matter of preference and can be handled any way you see fit. This includes:
- Aggregates, entities, value objects, custom domain exceptions, and interfaces for domain services.
- Interfaces for domain-driven design concepts (i.e. IAggregateRoot, IDomainEvent, IEntity).
- Base implementations of aggregate root and domain event. Also contains specific domain events pertaining to the business processes.

### Application tier

This layer contains application-specific business logic. This contains the “what” the system should do. This includes:
- Interfaces for infrastructure components such as repositories, unit-of-work and event sourcing.
- Commands and Queries models and handlers
- Interfaces and DTOs for cross-cutting concerns (i.e. service bus)
- Authorization operations, requirements and handlers implementations
- Interfaces and concrete implementations of application-specific business logic services.
- Mapping profiles between domain entities and CQRS models

### Data tier

This layer contains details, concrete implementations for repositories, unit-of-work, event store, service bus implementations etc. This contains the “how” the system should do what is supposed to do. The decoupling between the application layer and the infrastructure layer is what allows solution structures like this one to change and/or add specific implementations as the project requirements change.
In overview, this layer contains:
- Generic and specific repositories implementations
- EF DbContexts, data models and migrations
- Event sourcing persistence and services implementations
- Implementations for cross-cutting concerns (i.e, application configuration service, localization service etc.)
- Data entity auditing implementation

More of the clean architecture:
- [3 Layered Architecture](https://www.ecanarys.com/Blogs/ArticleID/76/3-Layered-Architecture)
- [The three tiers in detail](https://www.ibm.com/topics/three-tier-architecture)

## What's not included in this boilerplate?

There are a few things that are not part of this boilerplate. See below a list of things this **boilerplate** does **not** contain:

- Identity server (complex authentication)

## Tools included

Aside from the code and the architecture, there are a few things that might be of your interest if you deal with this boilerplate, as follows:

- SQL server with Entity framework - code first
- Automapper
- Swagger
- Framework logging

## Automatic deployment

The deployment pipeline is defined to build and deploy a .NET Core Web API project to a specified folder. The script is intended to be run as part of an automated pipeline in the GitLab CI/CD system.

### Variables

The script defines a single variable `DEPLOY_FOLDER`, which is used to specify the folder where the API should be deployed.

### Functions

The script defines two functions:

#### `buildApi`

This function is responsible for building the .NET Core Web API project. It performs the following steps:

1. Shuts down the build server.
2. Restores the project dependencies.
3. Builds the project with the Release configuration.
4. Publishes the project with the Release configuration.

#### `deployApi`

This function is responsible for deploying the built API to the specified folder. It performs the following steps:

1. Creates an "app\_offline.htm" file in the deployment folder. This file will be used to take the API offline during deployment.
2. Deletes all files in the deployment folder except for "web.config", "app\_offline.htm", and "appsettings.json".
3. Copies all files from the API's "bin/Release/net7.0" folder to the deployment folder.
4. Deletes the "app\_offline.htm" file to bring the API back online.

### nro\_api\_boilerplate\_schedule

This section defines a GitLab CI/CD pipeline job named "nro\_api\_boilerplate\_schedule". It is set to run in the "Automatic builds" environment and is tagged with "netcore". The job has the following configuration:

- `ErrorActionPreference: stop`: This configuration ensures that any errors encountered during the job will cause the pipeline to fail and stop.
- `script`: This section defines the script commands to be executed during the job. The script first runs the two functions defined earlier (`*ps-functions` and `buildApi`) and then calls the `deployApi` function, passing in the `DEPLOY_FOLDER` variable as an argument.
- `only`: This section specifies the conditions under which the job will run. In this case, the job will only run if the pipeline is triggered by a merge request into the `template/clean` branch or if it is triggered by a schedule. This ensures that the job only runs when changes are made to the relevant codebase.