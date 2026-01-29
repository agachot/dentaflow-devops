pipeline {
    agent {
        docker { image 'node:20-alpine' }
    }
 
    stages {
        stage('Checkout') {
            steps {
                // Récupère la branche develop
                git url: 'https://github.com/agachot/dentaflow-devops-front.git', branch: 'develop'
            }
        }
 
        stage('Build Angular') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
 
        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'dist/**', fingerprint: true
            }
        }
    }
}