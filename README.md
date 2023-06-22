# ServicePRO

This is a mobile application developed for auto service centers to facilitate better management of vehicles in need of services. The application utilizes .NET for creating the API and Flutter for the client-side development.

## Technologies Used

- Backend/API: C# .NET
- Frontend/Client: Flutter
- Database: SQL Server

## Application Summary

The **Service Auto** mobile app is designed to streamline vehicle management for auto service centers. The core functionality revolves around scanning vehicle license plates and adding them to the database. The application allows the addition of various services such as oil change, brake replacement, and more, with the option to generate invoices at the end.

The app incorporates three different roles:

1. **Admin**:
   - Full access to the application.
   - Ability to create mechanic accounts.

2. **Mechanic**:
   - When a vehicle arrives at the service center, the mechanic scans the license plate number.
   - If the number is not found in the database, the mechanic can add the vehicle to the application.
   - If the number is found in the database, the mechanic is redirected to the vehicle's details screen.
   - The mechanic can add services for the vehicle.
   - Each vehicle can have three states: Arrived, In progress, and Ready.
   - After completing the provided services, the mechanic can generate an invoice for the client.

3. **Client**:
   - The client account is created by the mechanic (access details are sent via email or SMS) when the client brings a vehicle to the service center.
   - The client can view their vehicle's details, current state, and service history.
   - The client can make invoice payments through the application.

This mobile app aims to enhance the overall efficiency and organization of auto service centers by digitizing the vehicle management process and providing a seamless experience for both mechanics and clients.
