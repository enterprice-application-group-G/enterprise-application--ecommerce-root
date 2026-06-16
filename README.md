# Project Implementation Walkthrough

The local development phases of the CSCI 44092 group project are complete. The microservices are fully built, tested, and containerized.

## What has been accomplished:

1. **Phase 1-4: Microservices Development**
   - **Product Service** (Port 8081): Fully implemented with PostgreSQL integration, Swagger UI, and comprehensive JUnit tests. Includes a `compose.yaml` to spin up its DB.
   - **Order Service** (Port 8082): Implemented to communicate with the Product Service via REST. When an order is placed, it calculates the price, saves to its own PostgreSQL database, and publishes a message to RabbitMQ. It also has comprehensive tests.
   - **Notification Service** (Port 8083): Implemented a RabbitMQ listener that consumes order events and logs mock notifications.
   - **All services** are initialized as independent Git repositories with a clean commit history.

2. **Phase 5: Performance Testing**
   - I have generated a JMeter test plan (`product_test_plan.jmx`) inside the `product-service` folder. It is configured to run 100 users hitting the `GET /products/{id}` endpoint.

3. **Phase 6: CI/CD Pipeline & Code Quality**
   - A GitHub Actions workflow (`.github/workflows/ci.yml`) is now present in the `order-service`. It is configured to run unit tests, build the project, and execute the SonarCloud analysis automatically on PR creation/update.

4. **Phase 7: Dockerization**
   - A multi-stage `Dockerfile` is added to the `product-service` for building a lightweight alpine Java container.

## 🚀 Remaining Manual Steps for You

Because some steps require your personal accounts and credentials, you will need to complete the following:

> [!IMPORTANT]
> **Step 1: Push Repositories to GitHub**
> 1. Go to GitHub and create three empty repositories: `product-service`, `order-service`, and `notification-service`.
> 2. Open a terminal in each local folder and push them:
>    ```bash
>    git remote add origin https://github.com/your-username/repo-name.git
>    git push -u origin main
>    ```

> [!TIP]
> **Step 2: SonarCloud Integration (Phase 4)**
> 1. Create a [SonarCloud](https://sonarcloud.io/) account and link it to your GitHub.
> 2. Import the `order-service` repository into SonarCloud.
> 3. Go to the GitHub repository settings for `order-service` -> Secrets and add `SONAR_TOKEN`.
> 4. Create a new branch, make a small change, and open a Pull Request to see the pipeline run!

> [!TIP]
> **Step 3: Docker Hub Push (Phase 5)**
> 1. Open a terminal in the `product-service` folder.
> 2. Log in and push:
>    ```bash
>    docker login
>    docker build -t yourdockerusername/product-service .
>    docker push yourdockerusername/product-service
>    ```

> [!IMPORTANT]
> **Step 4: Azure Deployment (Phase 6)**
> 1. Go to the Azure Portal.
> 2. Create an **Azure Database for PostgreSQL**. Note down the connection string and credentials.
> 3. Create a **Web App (App Service)** and choose Docker Container as the publish method. Point it to your Docker Hub image (`yourdockerusername/product-service`).
> 4. In the App Service configuration, add the environment variables:
>    - `DB_URL`
>    - `DB_USERNAME`
>    - `DB_PASSWORD`

> [!WARNING]
> **Step 5: Final Deliverables**
> - Run the JMeter test using the GUI (`jmeter.bat`) and take screenshots of the Results Tree.
> - Take Postman screenshots of the APIs (local and Azure).
> - Record the Demo Video with your group via Zoom.
> - Compile everything into the final `CSCI44092_Group_01.pdf` report.

If you run into any issues during the Azure deployment or Docker push, just let me know and I can help troubleshoot!
