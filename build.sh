docker pull skybro/ubuntu-cn:latest

docker run -it -d --name ubuntu -e PATH=/opt/maven/bin:/usr/lib/jvm/msopenjdk-21-amd64/bin:/opt/gradle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin -e M2_HOME=/opt/maven -e JAVA_HOME=/usr/lib/jvm/msopenjdk-21-amd64 -e GRADLE_HOME=/opt/gradle skybro/ubuntu-cn

docker ps
docker exec -it -e PATH=/opt/maven/bin:/usr/lib/jvm/msopenjdk-21-amd64/bin:/opt/gradle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin -e M2_HOME=/opt/maven -e JAVA_HOME=/usr/lib/jvm/msopenjdk-21-amd64 -e GRADLE_HOME=/opt/gradle ubuntu  /bin/bash


apt update

apt install wget -y
apt-get install -y lsb-release

ubuntu_release=$(lsb_release -rs)
wget -v https://packages.microsoft.com/config/ubuntu/${ubuntu_release}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

dpkg -i packages-microsoft-prod.deb


 apt-get install apt-transport-https -y
 apt-get update
 apt-get install msopenjdk-21 -y
 
 
 
 wget -v https://services.gradle.org/distributions/gradle-8.12-bin.zip
 
 apt-get install zip -y
  unzip gradle-8.12-bin.zip -d /opt/
 mv /opt/gradle-8.12 /opt/gradle


export GRADLE_HOME=/opt/gradle
export PATH=${GRADLE_HOME}/bin:${PATH}

java --version
gradle -v



export JAVA_HOME=/usr/lib/jvm/msopenjdk-21-amd64

export PATH=${JAVA_HOME}/bin:${PATH}


wget -v https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz


tar xzf apache-maven-3.9.9-bin.tar.gz -C /opt/
 mv /opt/apache-maven-3.9.9 /opt/maven
 
 export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}

mvn -version
printenv

apt clean
 rm -v ./*.gz ./*.zip ./*.deb

exit

docker commit ubuntu masx200/ubuntu-maven-gradle-msopenjdk

docker images


docker save masx200/ubuntu-maven-gradle-msopenjdk | gzip > ubuntu-maven-gradle-msopenjdk.image.tgz

docker save skybro/ubuntu-cn   | gzip > skybro.ubuntu-cn.image.tgz

docker stop ubuntu