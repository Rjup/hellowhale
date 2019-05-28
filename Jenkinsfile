pipeline {
  agent any
  stages {
    stage('docker') {
      steps {
        sh '''docker build . -t hellowhale
docker images
docker run -d -p28080:80 --name HelloWhale hellowhale
'''
      }
    }
    stage('kubectl') {
      steps {
        withKubeConfig(clusterName: 'fpt-box', contextName: 'fpt-box', credentialsId: 'kubeconfig-u-rr6x6:kp9fqgbpsz875clrg29n25dmbw2mgz8mdbkmd2tj5mbzvmzs97dcjh', serverUrl: 'https://rancher.platform.tdsltestbed.test') {
          sh 'kubectl get all'
        }

      }
    }
  }
}