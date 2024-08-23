pipeline {
    agent any
    environment {
        appversion=""
    }
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    stages{
        stage('clone'){
            steps{
                echo "The Jenkins file is in same code folder so no need of git checkout"
            }
        }
        stage('getversion'){
            steps{
                script {

                    def Jsonfile = readJSON file: 'package.json' 
                    appversion = Jsonfile.version
                    echo "appversion : $appversion"  
                }             
            }
        }
    //     stage('deploy'){
    //         when {
    //             expression { "${params.ENVIRONMENT}" == "DEV" }
    //         }
    //         input {
    //             message "Should we continue?"
    //             ok "Yes, we should."
    //         }
    //         steps{

    //             echo "Deployed the code in ${params.ENVIRONMENT} ${app} server"
    //         }
    //     }
    // }
    }
    post {

        success{
            echo " Your pipeline job is success "
        }
        failure{
            echo " Your pipeline job is failure "
        }
    }
}