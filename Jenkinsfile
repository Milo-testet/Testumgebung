pipeline {
    agent any

    environment {
        IMAGE_NAME = "ghcr.io/Milo-testet/my-app"
        REGISTRY_CREDENTIALS = 'github-container-registry'  // in Jenkins hinterlegt
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Milo-testet/Testumgebung.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:latest ."
            }
        }

        stage('Login to GHCR') {
            steps {
                withCredentials([string(credentialsId: REGISTRY_CREDENTIALS, variable: 'GITHUB_TOKEN')]) {
                    sh "echo $GITHUB_TOKEN | docker login ghcr.io -u Milo-testet --password-stdin"
                }
            }
        }

        stage('Push to GitHub Container Registry') {
            steps {
                sh "docker push $IMAGE_NAME:latest"
            }
        }
    }
}
