pipeline {
     agent any

     stages {
        input {
            def responseJson = new URL("http://192.168.0.104:5002/v2/jenkins-test/tags/list")
                    .getText(requestProperties: ['Content-Type': "application/json"]);

            println(responseJson)

            // {name:xxx,tags:[tag1,tag2,...]}
            Map response = new groovy.json.JsonSlurperClassic().parseText(responseJson) as Map;

            def versionsStr = response.tags.join('\n');

            message "Should we continue?"
            ok "Deploy"
            parameters {
                choice(choices: versionsStr, description: 'version', name: 'version')
            }
        }

        stage('Test') {
            steps {
                sh ''
            }
        }
     }
}
