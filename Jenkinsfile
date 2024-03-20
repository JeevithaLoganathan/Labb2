
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
    }
    stage('Post Test'){
      steps{
     post {
      always {
        dir('C:/Users/ls930499/.jenkins/workspace/Jeevitha/trailrunner') {
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
     }
    }
   
    stage('Run Robot Tests'){
       steps{
          script{
           bat 'python -m robot C:/Users/ls930499/.jenkins/workspace/Jeevitha/Selenium' 
           }
       }
    }
    stage('Post Robot'){
      steps{
        post {
          always {
            robot (
            outputPath: 'C:/Users/ls930499/.jenkins/workspace/Jeevitha/Selenium',
            passThreshold: 80.0
            )
          }
        }
      } 
    }
  }
}