
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
           bat 'python -m robot C:/Users/ls930499/.jenkins/workspace/Jeevitha/Selenium' //change the path to github so that it will be easy to recognize the branch 
           }

       }
    }
    stage('Post Robot'){
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