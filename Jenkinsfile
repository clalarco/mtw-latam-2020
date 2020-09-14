pipeline {
  agent {
    docker {
        image 'spacyexample-test'
    }
  }
  stages {
    stage('Run Tests') {
      steps {
          sh 'pytest --junit-xml results.xml test_1.py test_long.py'
      }
    }
  }
  post {
    always {
      junit 'results.xml'
    }
  }
}
