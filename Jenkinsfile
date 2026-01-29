pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/agachot/dentaflow-devops-front.git', branch: 'develop'
            }
        }
        stage('Debug files') {
            steps {
                sh 'ls -la'
                sh 'find . -name package.json'
            }
        }

        stage('Build Angular') {
            steps {
                sh '''
                  docker run --rm \
                    -v "$PWD":/app \
                    -w /app/dentaflow-front \
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

 