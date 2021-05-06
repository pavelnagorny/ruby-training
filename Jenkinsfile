pipeline {
    agent any
    environment {
        API_KEY = 'a1d9fb9bada2e98faa7f8164dc17f9128633da7b' // can't avoid this declaration without Credentials and Credentials Binding Jenkins plugins
    }
    stages{
        stage('Execute cucumber tests and publish reports') {
            steps {
                sh 'bundle install'
                sh "cucumber"
            }
        }
    }
}
