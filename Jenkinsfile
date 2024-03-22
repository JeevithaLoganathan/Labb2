
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
        script{
          dir('C:/Users/ls930499/.jenkins/workspace/Jeevitha'){
        jacoco(
          execPattern: 'C:/Users/ls930499/.jenkins/workspace/Jeevitha/target/*.exec',
          classPattern: 'C:/Users/ls930499/.jenkins/workspace/Jeevitha/target/classes',
          sourcePattern: 'C:/Users/ls930499/.jenkins/workspace/Jeevitha/src/main/java',
          exclusionPattern: 'C:/Users/ls930499/.jenkins/workspace/Jeevitha/src/test*'
          ) 
        junit '**/TEST*.xml'
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
        post {
          always {
            robot (
            outputPath: 'C:/Users/ls930499/.jenkins/workspace/Jeevitha',
            passThreshold: 80.0, unstableThreshold: 70.0, onlyCritical: false
            )
          }
        }
      } 
    }
  }
