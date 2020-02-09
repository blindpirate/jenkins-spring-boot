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
                    choice(name: 'VERSION', choices: versionsStr, description: 'version', name: 'version')
                }
            }
            steps {
                echo "${VERSION}"
            }
        }
     }
}
