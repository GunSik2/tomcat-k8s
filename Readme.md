


## Build and Run
```
docker build -t cgshome2/tomcat-k8s:9.0.41 . 
docker run -p 8080:8080 -d --rm --name tomcat-k8s cgshome2/tomcat-k8s:9.0.41
docker ps -a

docker push cgshome2/tomcat-k8s:9.0.41
```

## Run in k8s

```
kubectl create -f k8s/serviceaccount.yml
kubectl create -f k8s/deployment.yml
```

## Reference
- https://tomcat.apache.org/tomcat-9.0-doc/api/org/apache/catalina/tribes/membership/cloud/DNSMembershipProvider.html
- https://github.com/apache/tomcat/blob/master/java/org/apache/catalina/tribes/membership/cloud/KubernetesMembershipProvider.java
- https://github.com/apache/tomcat/blob/630adb6272beb02cd709465441e841f2d362b6fb/java/org/apache/catalina/tribes/membership/cloud/CloudMembershipProvider.java#L90
