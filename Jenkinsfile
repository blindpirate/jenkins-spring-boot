def responseJson = new URL("http://192.168.0.104:5002/v2/jenkins-test/tags/list")
        .getText(requestProperties: ['Content-Type': "application/json"]);

println(responseJson)

// {name:xxx,tags:[tag1,tag2,...]}
Map response = new groovy.json.JsonSlurperClassic().parseText(responseJson) as Map;

def versionsStr = response.tags.join('\n');

pipeline {
     agent any

     stages {
        stage('Test') {
            input {
                message "Choose a version"
                ok "Deploy"
                parameters {
                    choice(choices: versionsStr, description: 'version', name: 'version')
                }
            }
            steps {
                sh "ssh zhb@192.168.0.104 '/usr/local/bin/docker rm -f jenkins-test'"
                sh "ssh zhb@192.168.0.104 '/usr/local/bin/docker run --name jenkins-test -p 8081:8080 192.168.0.104:5052/jenkins-test:${version}'"
            }
        }
     }
}
