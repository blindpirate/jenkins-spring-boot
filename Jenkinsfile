          input(
                        message: 'Are you sure?',
                        ok: 'OK',
                        parameters: [choice(choices: "Yes\nNo\n", description: 'version', name: 'version')])

pipeline {
    agent {
        docker { image "circleci/openjdk:8u212-jdk-stretch" + System.getenv("MY_VERSION") }
    }
    stages {
        stage('Test') {
            steps {
                sh 'mvn clean test'
            }
        }
    }
}