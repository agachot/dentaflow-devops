pipeline {
    agent any

    environment {
        NODE_VERSION = '20'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/agachot/dentaflow-devops-front.git', branch: 'develop'
            }
        }

        stage('Install Node.js') {
            steps {
                script {
                    // Installer Node.js dans le conteneur Jenkins
                    sh 'curl -fsSL https://deb.nodesource.com/setup_20.x | bash -'
                    sh 'apt-get install -y nodejs'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Angular') {
            steps {
                sh 'npm run build --prod'
            }
        }

        stage('Deploy to Nginx') {
            steps {
                sh 'cp -r dist/dentaflow-front/* /var/jenkins_workspace/dist/dentaflow-front/'
            }
        }
    }
}
