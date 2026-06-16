pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shamlapm/server-monitor-dashboard.git'
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x server.sh'
                sh 'sudo ./server.sh'
            }
        }
    }

    post {
        success {
            mail to: 'shamlapm18@gmail.com',
                 subject: 'Jenkins Build Success',
                 body: 'The latest deployment was successful.'

            echo 'Deployment Successful'
        }

        failure {
            mail to: 'shamlapm18@gmail.com',
                 subject: 'Jenkins Build Failed',
                 body: 'The latest deployment failed.'

            echo 'Deployment Failed'
        }

        always {
            echo 'Pipeline Finished'
        }
    }
}
