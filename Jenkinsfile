pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "your-dockerhub-username/serviceforstudy01"
        DOCKER_TAG = "latest"
        DOCKER_CREDS = credentials('90536d43-1554-464e-8532-c7f93443e5c3')
    }
    stages {
        stage('Checkout Application') {
            steps {
                git url: 'https://github.com/foxolave/ServiceForStudy01.git', branch: 'main'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'mvn --batch-mode test'
            }
        }
        stage('Build Artifact') {
            steps {
                sh 'mvn --batch-mode clean package'
                archiveArtifacts 'target/*.jar'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.DOCKER_IMAGE}:${env.DOCKER_TAG}")
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('', env.DOCKER_CREDS) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy and Test') {
            steps {
                sh 'docker stop service-container || true'
                sh 'docker rm service-container || true'
                sh "docker run -d --name service-container -p 8080:8080 ${env.DOCKER_IMAGE}:${env.DOCKER_TAG}"
                sleep(time: 10, unit: 'SECONDS') // Wait for app startup
                sh 'curl -s -X GET http://localhost:8080/status'
            }
            post {
                always {
                    sh 'docker stop service-container || true'
                    sh 'docker rm service-container || true'
                }
            }
        }
    }
}
