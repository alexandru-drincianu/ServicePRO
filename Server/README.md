
# ServicePRO .NET Web API

## Description

This repository contains a .NET Web API, which serves as a backend for web applications. The API is built using the .NET framework, providing a robust and scalable solution for handling HTTP requests and delivering data in formats such as JSON.

## Requirements

This application needs the following tools installed before running it:

- .net6.0 / .net7.0

## How to get started?

1. `git clone` this repo.
2. have a SQL server locally and set the connection strings in the `appsettings.json` correctly (in Api and `ServiceProDbContext` - `optionsBuilder.UseSqlServer`)
3. open a powershell in `ServicePro.DataAccess` and execute dotnet ef database update to apply migrations to your database
4. clean-up the example code
5. start the api

### Presentation tier

This layer contains application-independent business logic. This is the part of the business logic which would be the same even if we weren’t building a software. It is a formulation of the core business rules.
The organization of this project follows Domain-Driven design patterns, although this is a matter of preference and can be handled any way you see fit. This includes:
- Aggregates, entities, value objects, custom domain exceptions, and interfaces for domain services.
- Interfaces for domain-driven design concepts
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

## Tools included

Aside from the code and the architecture, there are a few things that might be of your interest if you deal with this application, as follows:

- SQL server with Entity framework - code first
- Automapper
- Swagger
- Validator
- IronOCR
