# CSCI 44092 E-Commerce Root Project

This is the integration/root project for the microservice-based e-commerce backend.

The three Spring Boot services should live in their own GitHub repositories:

- `product-service`
- `order-service`
- `notification-service`

This root project connects them with Docker Compose and contains shared project assets:

- `docker-compose.yml`: runs the system using Docker Hub service images.
- `docker-compose.local.yml`: optional override for building local service checkouts.
- `database/init.sql`: PostgreSQL startup SQL hook.
- `postman/`: Postman API test collection.
- `jmeter/`: JMeter performance test plan.
- `docs/`: report outline and submission checklist.

## Root Project Structure

```text
.
|-- database/
|   `-- init.sql
|-- docs/
|-- jmeter/
|-- postman/
|-- services/                 # Local service clones only, ignored by this repo
|   |-- product-service/
|   |-- order-service/
|   `-- notification-service/
|-- .env.example
|-- docker-compose.yml
`-- docker-compose.local.yml
```

## Final Submission Mode: Docker Hub Images

Use this when each service has already been built and pushed to Docker Hub.

1. Copy `.env.example` to `.env`.
2. Replace the image names:

```text
PRODUCT_SERVICE_IMAGE=your-dockerhub-username/product-service:latest
ORDER_SERVICE_IMAGE=your-dockerhub-username/order-service:latest
NOTIFICATION_SERVICE_IMAGE=your-dockerhub-username/notification-service:latest
```

3. Run:

```powershell
docker compose up
```

Docker will pull the service images and start:

- `postgres-service`
- `rabbitmq`
- `product-service`
- `order-service`
- `notification-service`

## Local Development Mode: Build From Service Folders

Use this when the service repos are cloned into `services/`.

Expected local folders:

```text
services/product-service
services/order-service
services/notification-service
```

Run:

```powershell
docker compose -f docker-compose.yml -f docker-compose.local.yml up --build
```

This builds the three services locally and still uses the same shared PostgreSQL and RabbitMQ containers.

## Useful URLs

- Product API: http://localhost:8081
- Product Swagger: http://localhost:8081/swagger-ui.html
- Order API: http://localhost:8082
- Order Swagger: http://localhost:8082/swagger-ui.html
- RabbitMQ Management: http://localhost:15672
  - Username: `guest`
  - Password: `guest`

## API Flow

1. Create product: `POST http://localhost:8081/products`
2. Get product: `GET http://localhost:8081/products/{id}`
3. Create order: `POST http://localhost:8082/orders`
4. Order Service calls Product Service.
5. Order Service stores the order in PostgreSQL.
6. Order Service publishes an event to RabbitMQ.
7. Notification Service consumes the event and logs a mock notification.
