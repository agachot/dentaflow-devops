pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/agachot/dentaflow-devops-front.git', branch: 'develop'
            }
        }

        stage('Build Angular') {
            steps {
                sh '''
                  docker run --rm \
                    -v "$PWD":/app \
                    -w /app \
                    node:20-alpine \
                    sh -c "npm install && npm run build"
                '''
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'dist/**', fingerprint: true
            }
        }
    }
}

 