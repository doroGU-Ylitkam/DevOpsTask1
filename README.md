# DevOpsTask1
# CI/CD Pipeline for ServiceForStudy01

## Requirements
- Jenkins with plugins:
  - Docker Pipeline
  - Git
  - Credentials Binding
  - Pipeline Utility Steps
- Tools on Jenkins agent:
  - Docker
  - JDK 11+
  - Maven

## Setup
1. **Добавьте учетные данные DockerHub в Jenkins:**
   - ID: `dockerhub-creds`
   - Username: ваш DockerHub логин
   - Password: ваш DockerHub пароль/токен

2. **Создайте Pipeline Job:**
   - Укажите SCM репозитория с этим Jenkinsfile
   - Ветка: `main`

3. **Настройте переменные:**
   - В Jenkinsfile замените `your-dockerhub-username` на ваш DockerHub логин

## Pipeline Stages
1. Checkout Application - клонирует исходный код
2. Run Tests - запуск unit-тестов
3. Build Artifact - сборка JAR-артефакта
4. Build Docker Image - создание Docker-образа
5. Push to DockerHub - публикация образа в DockerHub
6. Deploy and Test - запуск контейнера и проверка работы
