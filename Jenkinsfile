pipeline {
    agent any
    environment {
        API_KEY = 'a1d9fb9bada2e98faa7f8164dc17f9128633da7b'
    }
    stages{
        stage('Execute cucumber tests and publish reports') {
            steps {
                sh 'bundle install'
                echo "api key is ${API_KEY}"
                sh "cucumber API_KEY"
            }
        }
    }
}
