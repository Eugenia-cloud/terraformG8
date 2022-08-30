pipeline{
    agent any
    tools {
  terraform 'terraformG8'
}
stages{
    stage('1.Git clone'){
        steps{
            git branch: 'main', url: 'https://github.com/Eugenia-cloud/terraformG8.git'
        }
    }
    stage('2.Terraform init'){
        steps{
            sh 'terraform init'
        }
    }
    stage('3.Terraform validate'){
        steps{
            sh 'terraform validate'
        }
    }
    stage('4.Terraform format'){
        steps{
            sh 'terraform fmt'
     }
    }
    stage('5.Terraform apply'){
    steps{
        sh 'terraform apply -auto-approve'
    }
  }
  stage('6.Terraform destroy'){
      steps{
          sh 'terraform destroy -auto-approve'
      }
   }
  }
}
