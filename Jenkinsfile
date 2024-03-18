
pipeline {
  agent any 
  
  stages {  
    stage('Build') {
      steps {
        dir('C:/Users/ls930499/.jenkins/workspace/Jeevitha/trailrunner') {
        bat "mvn compile"
        }
      }
    } 
    stage('Test') {
      steps {
        dir('C:/Users/ls930499/.jenkins/workspace/Jeevitha/trailrunner') {
        bat "mvn test"
        }
      }
     post {
      always {
        jacoco(
          execPattern: 'target/*.exec',
          classPattern: 'target/classes',
          sourcePattern: 'src/main/java',
          exclusionPattern: 'src/test*'
          ) 
        junit '**/TEST*.xml'
     }
     }
    }

    stage('Run Robot Tests'){
       steps{
            script{
           bat 'python -m robot C:/Git/RobotFramework_Lab/test.robot'
           }

       }
        post {
    always {
        robot (
            outputPath: 'C:/Git/RobotFramework_Lab/log.html',
            passThreshold: 80.0,
            unstable: true
                )
            }
            }
        }
  }
}