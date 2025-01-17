pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mohitkumar1313/python-repo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                # Install dependencies globally with --break-system-packages flag
                pip3 install --user --break-system-packages -r python_web_application/requirements.txt
                '''
            }
        }

        stage('Run Tests') {
    steps {
        script {
            // Add the location where pytest is installed to PATH
            sh 'export PATH=$PATH:/var/lib/jenkins/.local/bin'
            
            // Now run pytest
            sh 'export PATH=$PATH:/var/lib/jenkins/.local/bin'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with a tag
                    sh '''
                    docker build -t khushbu1216/pythonapp:latest -f Dockerfile .
                    '''
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker push khushbu1216/pythonapp:latest
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean up the workspace
        }
        success {
            echo 'Pipeline completed successfully! Image pushed to Docker Hub.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
