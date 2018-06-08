### Addition to springboot-helloworld by Ahmet
- deploy folder added which includes following:
 * docker-compose.yml(creating container via docker-compose is easier)
 * Dockerfile(neccesseary to build an image)
 * playbook.yml(neccesseray for ansible to deploy appservervm from jenkinsvm)
 * run.sh(executed by pipeline groovy file in jenkins job)
 * hosts(it contains appservervm inventory)
- maven manifest added into pom.xml
```
<build>
  <plugins>
    <plugin>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-maven-plugin</artifactId>
    </plugin>
  </plugins>
</build>

```
