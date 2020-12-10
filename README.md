# tomcat-k8s
Tomcat Cluster in K8S 

## Build and Run
```
docker build -t cgshome2/tomcat-k8s:9.0.41 . 
docker run -p 8080:8080 -d --rm --name tomcat-k8s cgshome2/tomcat-k8s:9.0.41
docker ps -a

docker push cgshome2/tomcat-k8s:9.0.41
```
## Configure
```
# cat k8s/deployment.yml
apiVersion: extensions/v1beta1
kind: Ingress
spec:
  rules:
  - host: tomcat-k8s.default.14.49.44.246.xip.io # <-- change domain name 
```

## Run in k8s

```
kubectl create -f k8s/serviceaccount.yml
kubectl create -f k8s/deployment.yml
```

## Test
- Access : 
  - http://tomcat-k8s.default.14.49.44.246.xip.io:8888/session.jsp
  - http://tomcat-k8s.default.14.49.44.246.xip.io:8888/index.jsp

![](https://user-images.githubusercontent.com/11453229/101763878-b7973900-3b22-11eb-93dc-273e59482217.png)


## Reference
- https://tomcat.apache.org/tomcat-9.0-doc/api/org/apache/catalina/tribes/membership/cloud/DNSMembershipProvider.html
- https://github.com/apache/tomcat/blob/master/java/org/apache/catalina/tribes/membership/cloud/KubernetesMembershipProvider.java
- http://mlab.run/2020/01/04/k8s-ha-1/
