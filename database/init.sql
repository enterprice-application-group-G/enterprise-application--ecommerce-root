-- PostgreSQL initialization script for postgres-service.
--
-- Docker runs this file only when the postgres-service volume is created for
-- the first time. Keep this file for future database schemas, table creation,
-- indexes, or seed data.
--
-- No extra databases or tables are created here yet. The Spring Boot services
-- currently create their tables through Hibernate/JPA on startup.

