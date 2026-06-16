# Submission Checklist

## Repositories

- Create one GitHub repository for `product-service`.
- Create one GitHub repository for `order-service`.
- Create one GitHub repository for `notification-service`.
- Create one GitHub repository for this root project, for example `ecommerce-root` or `ecommerce-platform`.
- Make sure all five group members commit to at least one repository.

## Local Verification

From each service folder, run:

```powershell
mvn test
mvn package
```

Start infrastructure only:

```powershell
docker compose up -d postgres-service rabbitmq
```

Run all services and test the flow:

```powershell
cd services/product-service
mvn spring-boot:run
```

```powershell
cd services/order-service
mvn spring-boot:run
```

```powershell
cd services/notification-service
mvn spring-boot:run
```

## Postman Screenshots

- Create product
- Get product by ID
- Delete product
- Create order
- Notification Service log after order creation
- RabbitMQ management page showing queue activity

## JMeter Screenshots

- Test plan for `GET /products/{id}`
- Thread group settings
- View Results Tree after execution

## CI/CD and SonarCloud

In the Order Service GitHub repository:

- Add repository secret `SONAR_TOKEN`.
- Add repository variable `SONAR_PROJECT_KEY`.
- Add repository variable `SONAR_ORGANIZATION`.
- Open a pull request and capture the successful GitHub Actions run.
- Capture the SonarCloud dashboard.

## Docker Hub

From `services/product-service`:

```powershell
docker build -t <dockerhub-username>/product-service:latest .
docker push <dockerhub-username>/product-service:latest
```

Capture:

- Local image build
- Successful push
- Public Docker Hub repository page

Update this root project's `.env` file with the pushed Docker Hub image names, then run:

```powershell
docker compose up
```

## Azure

- Create Azure Database for PostgreSQL.
- Deploy Product Service to Azure App Service using the Docker Hub image.
- Configure App Service environment variables:
  - `DB_URL`
  - `DB_USERNAME`
  - `DB_PASSWORD`
  - `PORT`
- Test deployed API with Postman and capture the results.

## Final Report

- Use `docs/report-outline.md`.
- Export the report as `CSCI44092_Group_XX.pdf`.
- Add public links for GitHub, Docker Hub, SonarCloud, Azure API, and Google Drive demo video.
