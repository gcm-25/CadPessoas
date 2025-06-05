FROM maven:3.9-eclipse-temurin-21 AS builder

COPY pom.xml src .
RUN mvn -B package

FROM payara/server-web:6.2024.1-jdk21 AS runner
COPY --from=builder target/Cadastro-Pessoas.war $DEPLOY_DIR 
