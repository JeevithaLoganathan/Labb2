
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
        echo 'Running Jacoco code coverage analysis'
        jacoco(
          execPattern: 'target/*.exec',
          classPattern: 'target/classes',
          sourcePattern: 'src/main/java',
          exclusionPattern: 'src/test*'
          )
          echo 'Jacoco code coverage analysis completed'
        junit '**/TEST*.xml'
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
