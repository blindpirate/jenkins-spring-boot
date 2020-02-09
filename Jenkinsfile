pipeline {
     agent any
     triggers {
          pollSCM('* * * * *')
     }
     stages {
        stage('Test') {
            agent { docker { image "circleci/openjdk:8u212-jdk-stretch" } }
            steps {
                sh 'mvn package'
            }
        }

        stage('Docker Build') {
           steps {
               echo 'Starting to build docker image'

                script {
                    def customImage = docker.build("192.168.0.104:5002/jenkins-test:${new Date().format('yyyy-MM-dd-HH-mm-ss')}")
                    customImage.push()
                }
           }
        }
     }
}
