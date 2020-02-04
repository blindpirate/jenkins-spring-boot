pipeline {
    agent {
        docker { image "circleci/openjdk:8u212-jdk-stretch" }
    }
    stages {
        stage('Test') {
            steps {
                sh 'mvn package'
            }
        }
    }
}