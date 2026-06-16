# CSCI44092 Group Project Report Outline

## Group Information

- Group Number:
- Student IDs and Full Names:

## Project Overview

Describe the microservice-based e-commerce backend system and the responsibilities of each service.

## Architecture

Include a diagram showing:

- Product Service
- Order Service
- Notification Service
- PostgreSQL databases
- RabbitMQ exchange and queue

## Implementation Steps

### Product Service

- Entity, repository, service, controller
- Swagger documentation
- Exception handling
- PostgreSQL configuration using environment variables

### Order Service

- Product Service REST integration
- Total price calculation
- Order persistence
- RabbitMQ event publishing
- Exception handling

### Notification Service

- RabbitMQ listener
- Mock notification logging

## Unit Testing

Summarize the JUnit tests for controllers, services, and business logic.

## Postman Testing

Add screenshots for:

- Create product
- Get product by ID
- Delete product
- Create order
- RabbitMQ message / notification logs

## JMeter Performance Testing

Add screenshots for:

- Test plan targeting `GET /products/{id}`
- Thread users, ramp-up time, loop count
- View Results Tree output

## GitHub Actions CI/CD

Add screenshots for:

- Order Service workflow YAML
- Successful PR pipeline execution
- Build and test results

## SonarCloud Integration

- SonarCloud project URL:
- Screenshots of quality report and dashboard

## Docker and Docker Hub

- Product Service Docker image URL:
- Screenshots of image build, push, and Docker Hub page

## Azure Deployment

Add screenshots for:

- Azure PostgreSQL setup
- Azure App Service setup
- Product Service running on Azure
- Postman calls against deployed API

## Demo Video

- Google Drive link:
- Briefly list which group member explains each section.

## Learnings

Describe what the group learned from microservices, messaging, CI/CD, static analysis, Docker, performance testing, and Azure deployment.

