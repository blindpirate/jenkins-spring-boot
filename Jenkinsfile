pipeline {
     agent any
     triggers {
          pollSCM('* * * * *')
     }
     stages {
           stage('Example') {
                input {
                    message "Should we continue?"
                    ok "Yes, we should."
                    submitter "alice,bob"
                    parameters {
                        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                    }
                }
                steps {
                    echo "Hello, ${PERSON}, nice to meet you."
                }
            }

        stage('Test') {
            agent { docker { image "circleci/openjdk:8u212-jdk-stretch" } }
            steps {
                sh 'mvn package'
            }
        }
     }
}
