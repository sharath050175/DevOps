# KUBERNETES

Kubernetes is a powerful container orchestration platform, and it’s crucial for modern application deployment, management, and scaling in cloud-native environments. Here's why we need Kubernetes:

### 1. Container Management at Scale
Automation: Kubernetes automates the deployment, scaling, and management of containerized applications. Without Kubernetes, managing large numbers of containers across multiple machines would be complex and error-prone.
Orchestration: It handles the scheduling and running of containers on clusters of machines, ensuring that they’re distributed, replicated, and running as expected.
### 2. Scalability
Horizontal Scaling: Kubernetes makes it easy to scale applications up and down based on demand. It automatically adjusts the number of running instances of a containerized application based on CPU or memory usage, or custom metrics.
Auto-scaling: Kubernetes supports both horizontal pod autoscaling (scaling the number of pods based on load) and vertical pod autoscaling (adjusting resources per pod).
### 3. Fault Tolerance & Self-Healing
High Availability: Kubernetes monitors the health of containers and nodes. If a container or node fails, Kubernetes can automatically reschedule workloads to healthy nodes, ensuring minimal downtime.

Self-Healing: Kubernetes can restart failed containers, replace containers, or reschedule them on different nodes without human intervention.
### 4. Declarative Configuration
Kubernetes uses declarative configuration to define the desired state of applications. You specify what you want (e.g., how many replicas of a pod), and Kubernetes ensures that the system matches this state. If something changes or goes wrong, Kubernetes works to bring the system back to the desired state automatically.
### 5. Environment Consistency
Kubernetes abstracts away underlying infrastructure details, meaning your application can run consistently across different environments—whether it's on-premises, in a public cloud, or a hybrid setup.
Developers and operators can define applications in YAML files, ensuring that the same configurations work across different environments without needing manual tweaks.
### 6. Infrastructure Abstraction
Kubernetes decouples application development from the underlying hardware or cloud infrastructure. This makes it easier to switch between cloud providers or data centers without a major impact on how applications are deployed and managed.
Multi-cloud & Hybrid-cloud Support: It allows you to run applications across different cloud environments and even on-premise systems without vendor lock-in.
### 7. Microservices & Distributed Systems
Kubernetes is designed to manage applications composed of multiple loosely coupled services (microservices). It facilitates communication between microservices, such as load balancing and service discovery, while also allowing them to scale independently.
Networking and Load Balancing: Kubernetes handles networking between services and load balancing traffic automatically. It ensures services can discover each other through a built-in DNS system.
### 8. Efficient Resource Utilization
Kubernetes optimizes resource usage by dynamically allocating CPU and memory resources. It allows you to run workloads on bare metal or virtualized infrastructure while ensuring that resources are distributed efficiently.
### 9. Version Control & Rollbacks
Kubernetes supports rolling updates and rollbacks. This allows for seamless deployment of new versions of applications without downtime. If a new version of the application fails, Kubernetes can automatically roll back to the previous stable version.
### 10. CI/CD Integration
Kubernetes integrates well with continuous integration and continuous delivery (CI/CD) pipelines. You can automate the deployment of new code, run tests, and deploy updates in a consistent and repeatable manner.
### 11. Security
Kubernetes provides mechanisms like Role-Based Access Control (RBAC) to secure access to resources and control what users can do within a cluster.
It also supports network policies for controlling communication between services and can run containerized applications with specific security profiles to limit risks.
### 12. Ecosystem and Extensibility
Kubernetes has a vibrant ecosystem and a wide array of open-source tools built around it, such as Helm for package management, Istio for service meshes, and Prometheus for monitoring.
Kubernetes supports custom resource definitions (CRDs), which allow you to extend its functionality to suit your specific use cases.
## In Summary:
Kubernetes is essential because it automates and optimizes the complex tasks involved in deploying and managing containerized applications at scale. It helps with scaling, failover, monitoring, resource management, and simplifying application deployment, making it a cornerstone of modern DevOps, CI/CD, and cloud-native architectures. Without Kubernetes or a similar orchestrator, managing large, complex containerized environments would be a logistical nightmare.


# KUBERNETES ARCHITECTURE

![img.png](img.png)

```commandline
07:16:00 manojkrishnappa@Manojs-MacBook-Pro uday → kubectl get pods -n kube-system -o wide
NAME                                                        READY   STATUS    RESTARTS   AGE   IP           NODE                                NOMINATED NODE   READINESS GATES
coredns-7c65d6cfc9-g6xl4                                    1/1     Running   0          38m   10.244.0.2   manoj-cka-cluster-1-control-plane   <none>           <none>
coredns-7c65d6cfc9-g7g8r                                    1/1     Running   0          38m   10.244.0.3   manoj-cka-cluster-1-control-plane   <none>           <none>
etcd-manoj-cka-cluster-1-control-plane                      1/1     Running   0          38m   172.18.0.5   manoj-cka-cluster-1-control-plane   <none>           <none>
kindnet-48dd6                                               1/1     Running   0          38m   172.18.0.4   manoj-cka-cluster-1-worker          <none>           <none>
kindnet-ppgk8                                               1/1     Running   0          38m   172.18.0.5   manoj-cka-cluster-1-control-plane   <none>           <none>
kindnet-sdxp9                                               1/1     Running   0          38m   172.18.0.3   manoj-cka-cluster-1-worker2         <none>           <none>
kindnet-zz6hk                                               1/1     Running   0          38m   172.18.0.2   manoj-cka-cluster-1-worker3         <none>           <none>
kube-apiserver-manoj-cka-cluster-1-control-plane            1/1     Running   0          38m   172.18.0.5   manoj-cka-cluster-1-control-plane   <none>           <none>
kube-controller-manager-manoj-cka-cluster-1-control-plane   1/1     Running   0          38m   172.18.0.5   manoj-cka-cluster-1-control-plane   <none>           <none>
kube-proxy-lkpss                                            1/1     Running   0          38m   172.18.0.5   manoj-cka-cluster-1-control-plane   <none>           <none>
kube-proxy-qcph4                                            1/1     Running   0          38m   172.18.0.2   manoj-cka-cluster-1-worker3         <none>           <none>
kube-proxy-qkmjw                                            1/1     Running   0          38m   172.18.0.3   manoj-cka-cluster-1-worker2         <none>           <none>
kube-proxy-w486t                                            1/1     Running   0          38m   172.18.0.4   manoj-cka-cluster-1-worker          <none>           <none>
kube-scheduler-manoj-cka-cluster-1-control-plane            1/1     Running   0          38m   172.18.0.5   manoj-cka-cluster-1-control-plane   <none>           <none>

```

## Kubernetes Architecture Overview
Kubernetes is a container orchestration platform designed to automate the deployment, scaling, and operation of application containers. It has a complex yet well-defined architecture that is composed of several key components that work together to provide a scalable, reliable, and flexible platform for managing containerized applications.
Let’s break down the Kubernetes architecture into its key components:
### 1. Cluster Components
A Kubernetes cluster consists of two main parts: the control plane (responsible for managing the cluster) and the worker nodes (where your applications run).
### Control Plane
The control plane is responsible for the overall management of the Kubernetes cluster, making global decisions about scheduling, managing the state of the cluster, and responding to events (e.g., starting or stopping containers).
Key Components of the Control Plane:
### API Server (kube-apiserver):
•	The API server is the central management entity of Kubernetes, and it serves as the gateway to communicate with the cluster. It exposes the Kubernetes API, which is the interface that administrators and clients use to interact with Kubernetes (e.g., using kubectl, other Kubernetes services, or applications).
•	It is responsible for validating and processing REST requests, making decisions (such as scheduling) and updating resources in the etcd database.
•	All Kubernetes components communicate with each other via the API server.

### etcd:
•	etcd is a distributed key-value store used to store all cluster data, including configuration data, the state of the cluster, and metadata about the applications running in the cluster.
•	It ensures that the cluster is highly available and can quickly recover its state in case of failure. etcd is crucial for maintaining the consistency of the cluster.
•	For example, if you deploy a new pod or update a service, the state of the change is saved in etcd.
	
### Controller Manager (kube-controller-manager):
•	The controller manager runs a set of controllers, which are responsible for regulating the state of the cluster. Each controller is a process that watches the state of the cluster (through the API server) and ensures that the actual state matches the desired state.
•	For example, the Replication Controller ensures that the desired number of replicas for a pod is maintained. If a pod fails, the controller will create a new one.
•	There are various controllers for managing different Kubernetes resources, such as nodes, namespaces, deployments, and more.
### Scheduler (kube-scheduler):
•	The scheduler is responsible for selecting which node in the cluster will run a newly created pod. The decision is based on resource requirements (CPU, memory), policies (affinity/anti-affinity), constraints, and available resources in the cluster.
•	Once the scheduler decides on a node, it binds the pod to the selected node. The scheduler’s role is crucial for optimizing the performance and resource utilization of the cluster.

## Worker Nodes
Worker nodes are the machines (virtual or physical) where the actual applications (in the form of containers) run. A Kubernetes cluster can have many worker nodes, depending on the scale of the application.
### Key Components of a Worker Node:
###	Kubelet:
•	The kubelet is an agent that runs on each worker node. It ensures that the containers described in Kubernetes pod specifications are running and healthy on the node.
•	The kubelet constantly checks the status of the containers and reports back to the API server. It also interacts with container runtimes to start, stop, and maintain containers as per the pod specifications.
•	If a pod is not running or healthy, the kubelet will try to restart it based on the defined policies (e.g., restart policies).
### Kube Proxy:
•	The kube-proxy is responsible for maintaining network rules on nodes. These rules allow for communication between pods within the cluster and external clients.
•	It can manage services (load balancing), providing a stable IP address for a set of pods that might change over time due to scaling operations.
•	Kube Proxy uses either iptables or ipvs to forward traffic to the appropriate backend pods, ensuring that services remain accessible even as pods come and go.
###	Container Runtime:
•	The container runtime is the software responsible for running containers on a node. Kubernetes supports multiple container runtimes, such as Docker, containerd, and CRI-O.
•	The container runtime interacts with the kubelet to start and stop containers and manage the container lifecycle.


## KUBERNETES OBJECTS:
----

1) POD
2) REPLICASET
3) REPLICATION CONTROLLER
4) DEPLOYMENT
5) NAMESPACE
6) SERVICES
7) CONFIGMAP AND SECRET
8) STATEFULL SET
9) DEMONSET
10) PV AND PVC
11) PROBES


# POD

A pod is the smallest and simplest unit of deployment in kuberenets
it represents the single instance of the running process in the clsuter

**We can create a pod in two different ways** 

![img_1.png](img_1.png)


## Imperative 

```commandline
07:17:12 manojkrishnappa@Manojs-MacBook-Pro uday → kubectl get pods
No resources found in default namespace.

07:35:32 manojkrishnappa@Manojs-MacBook-Pro uday → kubectl run nginx --image=nginx
pod/nginx created

07:35:47 manojkrishnappa@Manojs-MacBook-Pro uday → kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          44s

```

## Declarative 

### pod.yml

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-test-decl
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
```




```commandline
07:37:44 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → ls
img.png         img_1.png       introduction.md pod.yml
07:38:01 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME    READY   STATUS    RESTARTS   AGE
nginx   1/1     Running   0          2m18s
07:38:05 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl apply -f pod.yml 
pod/nginx-test-decl created
07:38:09 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME              READY   STATUS              RESTARTS   AGE
nginx             1/1     Running             0          2m24s
nginx-test-decl   0/1     ContainerCreating   0          2s

07:38:21 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME              READY   STATUS    RESTARTS   AGE
nginx             1/1     Running   0          3m23s
nginx-test-decl   1/1     Running   0          61s
```


# REPLICASET

A Replica set is a kubernetes resource used to maintain stable set of pod
running at any given time 
Replica set ensure that specific number pods are always running 

```yaml
apiVersion:  apps/v1
kind:  ReplicaSet
metadata:
  name: my-rs-set
  labels:
    app: myapp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```
```commandline
08:01:56 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl apply -f replicaset.yml 
replicaset.apps/my-rs-set created
08:03:20 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME              READY   STATUS    RESTARTS   AGE
my-rs-set-4vsfn   1/1     Running   0          6s
my-rs-set-lkffv   1/1     Running   0          6s
08:03:26 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl delete pod my-rs-set-4vsfn
pod "my-rs-set-4vsfn" deleted
08:03:38 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME              READY   STATUS              RESTARTS   AGE
my-rs-set-87r5q   0/1     ContainerCreating   0          2s
my-rs-set-lkffv   1/1     Running             0          20s
08:03:40 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME              READY   STATUS    RESTARTS   AGE
my-rs-set-87r5q   1/1     Running   0          6s
my-rs-set-lkffv   1/1     Running   0          24s
```

```commandline
acBook-Pro 01-INTRODUCTION → kubectl describe pod rs my-rs-set-87r5q
Name:             my-rs-set-87r5q
Namespace:        default
Priority:         0
Service Account:  default
Node:             manoj-cka-cluster-1-worker3/172.18.0.3
Start Time:       Tue, 17 Dec 2024 08:03:38 +0530
Labels:           app=myapp
Annotations:      <none>
Status:           Running
IP:               10.244.2.4
IPs:
  IP:           10.244.2.4
Controlled By:  ReplicaSet/my-rs-set
Containers:
  nginx:
    Container ID:   containerd://2bcaed57301171d633d99c12d839fed676d531375ae1824a4c8935798d18f3ab
    Image:          nginx
    Image ID:       docker.io/library/nginx@sha256:fb197595ebe76b9c0c14ab68159fd3c08bd067ec62300583543f0ebda353b5be
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Tue, 17 Dec 2024 08:03:40 +0530
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-kr54x (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  kube-api-access-kr54x:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  4m3s  default-scheduler  Successfully assigned default/my-rs-set-87r5q to manoj-cka-cluster-1-worker3
  Normal  Pulling    4m3s  kubelet            Pulling image "nginx"
  Normal  Pulled     4m1s  kubelet            Successfully pulled image "nginx" in 1.787s (1.787s including waiting). Image size: 68524740 bytes.
  Normal  Created    4m1s  kubelet            Created container nginx
  Normal  Started    4m1s  kubelet            Started container nginx
```

# Deployments:
A Deployment manages a set of Pods to run an application workload, usually one that doesn't maintain state.
A Deployment provides declarative updates for Pods and ReplicaSets.

Use Case
The following are typical use cases for Deployments:

1.  Create a Deployment to rollout a ReplicaSet. The ReplicaSet creates Pods in the background. Check the status of the rollout to see if it succeeds or not.
   2.  Declare the new state of the Pods by updating the PodTemplateSpec of the Deployment. A new ReplicaSet is created and the Deployment manages moving the Pods from the old ReplicaSet to the new one at a controlled rate. Each new ReplicaSet updates the revision of the Deployment.
   3.  Rollback to an earlier Deployment revision if the current state of the Deployment is not stable. Each rollback updates the revision of the Deployment.
   4.  Scale up the Deployment to facilitate more load.
   5.  Pause the rollout of a Deployment to apply multiple fixes to its PodTemplateSpec and then resume it to start a new rollout.
   6.  Use the status of the Deployment as an indicator that a rollout has stuck.
   7.  Clean up older ReplicaSets that you don't need anymore.

REF: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

**deployment.yml**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.25
        ports:
        - containerPort: 80
```

```commandline
08:21:46 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
No resources found in default namespace.
08:22:00 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl apply -f deployment.yml 
deployment.apps/my-deployment created
08:22:08 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl rollout status deployment my-deployment 
Waiting for deployment "my-deployment" rollout to finish: 0 of 2 updated replicas are available...
Waiting for deployment "my-deployment" rollout to finish: 1 of 2 updated replicas are available...
deployment "my-deployment" successfully rolled out
08:22:39 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME                             READY   STATUS    RESTARTS   AGE
my-deployment-68489c4b5d-896qd   1/1     Running   0          38s
my-deployment-68489c4b5d-f7dqb   1/1     Running   0          38s
```

```commandline
08:23:49 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get deployment
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
my-deployment   2/2     2            2           2m5s
08:24:13 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl describe deployment my-deployment
Name:                   my-deployment
Namespace:              default
CreationTimestamp:      Tue, 17 Dec 2024 08:22:08 +0530
Labels:                 app=nginx
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=nginx
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   nginx:
    Image:         nginx:1.25
    Port:          80/TCP
    Host Port:     0/TCP
    Environment:   <none>
    Mounts:        <none>
  Volumes:         <none>
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   my-deployment-68489c4b5d (2/2 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  2m14s  deployment-controller  Scaled up replica set my-deployment-68489c4b5d to 2

```
## ROLLING UPDATE STARTERGY

![img_4.png](img_4.png)

![img_3.png](img_3.png)

```commandline
08:26:15 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME                             READY   STATUS    RESTARTS   AGE
my-deployment-68489c4b5d-896qd   1/1     Running   0          4m15s
my-deployment-68489c4b5d-f7dqb   1/1     Running   0          4m15s
08:26:23 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get deployment
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
my-deployment   2/2     2            2           10m
08:32:10 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl edit deployment my-deployment
deployment.apps/my-deployment edited

```
###  we have to replicas to 10 and also image to 1.26 version

```
08:33:12 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl rollout status deployment my-deployment 
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 7 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 7 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 7 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 7 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 8 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 8 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 8 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 9 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 9 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 9 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 9 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 9 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 3 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 3 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 3 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 8 of 10 updated replicas are available...
Waiting for deployment "my-deployment" rollout to finish: 9 of 10 updated replicas are available...
deployment "my-deployment" successfully rolled out
```
```commandline
08:34:02 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME                             READY   STATUS    RESTARTS   AGE
my-deployment-75578ddfcc-8gfk6   1/1     Running   0          74s
my-deployment-75578ddfcc-dql4l   1/1     Running   0          109s
my-deployment-75578ddfcc-fk52x   1/1     Running   0          109s
my-deployment-75578ddfcc-gmpx8   1/1     Running   0          109s
my-deployment-75578ddfcc-lfhmq   1/1     Running   0          109s
my-deployment-75578ddfcc-lqwj6   1/1     Running   0          82s
my-deployment-75578ddfcc-nhcx4   1/1     Running   0          109s
my-deployment-75578ddfcc-p2lj7   1/1     Running   0          80s
my-deployment-75578ddfcc-vxcvq   1/1     Running   0          75s
my-deployment-75578ddfcc-xj5wt   1/1     Running   0          79s


08:35:01 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl describe pod my-deployment-75578ddfcc-8gfk6  | grep -i "image"
    Image:          nginx:1.26
    Image ID:       docker.io/library/nginx@sha256:54b2f7b04062caecedd055427c58c43edf314a45fa6f7cee9d9d69e900bb9799
  Normal  Pulled     101s  kubelet            Container image "nginx:1.26" already present on machine
```

## Testing with wrong image 

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  labels:
    app: nginx
spec:
  replicas: 10
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.27.test
        ports:
        - containerPort: 80
```

```commandline
08:35:29 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl apply -f deployment.yml 
deployment.apps/my-deployment configured

08:36:48 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl rollout status deployment my-deployment 
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...

```

```commandline
08:37:22 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME                             READY   STATUS         RESTARTS   AGE
my-deployment-74fcbb4474-26ljf   0/1     ErrImagePull   0          38s
my-deployment-74fcbb4474-6k4m5   0/1     ErrImagePull   0          38s
my-deployment-74fcbb4474-knk45   0/1     ErrImagePull   0          38s
my-deployment-74fcbb4474-qc9vt   0/1     ErrImagePull   0          38s
my-deployment-74fcbb4474-x2f2f   0/1     ErrImagePull   0          38s
my-deployment-75578ddfcc-8gfk6   1/1     Running        0          3m39s
my-deployment-75578ddfcc-dql4l   1/1     Running        0          4m14s
my-deployment-75578ddfcc-fk52x   1/1     Running        0          4m14s
my-deployment-75578ddfcc-gmpx8   1/1     Running        0          4m14s
my-deployment-75578ddfcc-lqwj6   1/1     Running        0          3m47s
my-deployment-75578ddfcc-nhcx4   1/1     Running        0          4m14s
my-deployment-75578ddfcc-p2lj7   1/1     Running        0          3m45s
my-deployment-75578ddfcc-xj5wt   1/1     Running        0          3m44s

```
```commandline
08:37:26 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl describe pod my-deployment-74fcbb4474-26ljf  | grep -i "image"
    Image:          nginx:1.27.test
    Image ID:       
      Reason:       ImagePullBackOff
  Normal   BackOff    27s (x4 over 99s)   kubelet            Back-off pulling image "nginx:1.27.test"
  Warning  Failed     27s (x4 over 99s)   kubelet            Error: ImagePullBackOff
  Normal   Pulling    13s (x4 over 101s)  kubelet            Pulling image "nginx:1.27.test"
  Warning  Failed     10s (x4 over 99s)   kubelet            Failed to pull image "nginx:1.27.test": rpc error: code = NotFound desc = failed to pull and unpack image "docker.io/library/nginx:1.27.test": failed to resolve reference "docker.io/library/nginx:1.27.test": docker.io/library/nginx:1.27.test: not found
  Warning  Failed     10s (x4 over 99s)   kubelet            Error: ErrImagePull

```

```commandline
08:39:26 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl rollout undo deployment my-deployment
deployment.apps/my-deployment rolled back

08:39:32 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl rollout status deployment my-deployment 
deployment "my-deployment" successfully rolled out

NAME                             READY   STATUS    RESTARTS   AGE
my-deployment-75578ddfcc-8gfk6   1/1     Running   0          6m8s
my-deployment-75578ddfcc-dql4l   1/1     Running   0          6m43s
my-deployment-75578ddfcc-fk52x   1/1     Running   0          6m43s
my-deployment-75578ddfcc-gmpx8   1/1     Running   0          6m43s
my-deployment-75578ddfcc-lqwj6   1/1     Running   0          6m16s
my-deployment-75578ddfcc-m5vt5   1/1     Running   0          23s
my-deployment-75578ddfcc-nhcx4   1/1     Running   0          6m43s
my-deployment-75578ddfcc-nzm92   1/1     Running   0          23s
my-deployment-75578ddfcc-p2lj7   1/1     Running   0          6m14s
my-deployment-75578ddfcc-xj5wt   1/1     Running   0          6m13s

```

## updating with correct image tag

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  labels:
    app: nginx
spec:
  replicas: 10
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.27
        ports:
        - containerPort: 80
```
```commandline
08:39:55 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl apply -f deployment.yml 
deployment.apps/my-deployment configured
08:40:26 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl rollout status deployment my-deployment 
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 5 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 8 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 8 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 8 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 8 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 9 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 9 out of 10 new replicas have been updated...
Waiting for deployment "my-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "my-deployment" rollout to finish: 9 of 10 updated replicas are available...
deployment "my-deployment" successfully rolled out


08:40:33 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
my-deployment-87cdd7684-2xjst   1/1     Running   0          49s
my-deployment-87cdd7684-4z87v   1/1     Running   0          45s
my-deployment-87cdd7684-8bmpv   1/1     Running   0          49s
my-deployment-87cdd7684-bd5h9   1/1     Running   0          45s
my-deployment-87cdd7684-d89x5   1/1     Running   0          45s
my-deployment-87cdd7684-jhx77   1/1     Running   0          49s
my-deployment-87cdd7684-nwcpn   1/1     Running   0          49s
my-deployment-87cdd7684-ptgx8   1/1     Running   0          49s
my-deployment-87cdd7684-w8ztt   1/1     Running   0          44s
my-deployment-87cdd7684-wlbzr   1/1     Running   0          44s

08:41:15 manojkrishnappa@Manojs-MacBook-Pro 01-INTRODUCTION → kubectl describe pod my-deployment-87cdd7684-2xjst | grep -i "image"
    Image:          nginx:1.27
    Image ID:       docker.io/library/nginx@sha256:fb197595ebe76b9c0c14ab68159fd3c08bd067ec62300583543f0ebda353b5be
  Normal  Pulling    70s   kubelet            Pulling image "nginx:1.27"
  Normal  Pulled     68s   kubelet            Successfully pulled image "nginx:1.27" in 2.028s (2.028s including waiting). Image size: 68524740 bytes.

```

# SERVICES IN KUBERNETES
---
Services that enables communication between different componensts/ objects 
pods/externel clients/ in a k8 cluster 

## Types of services in kubernetes:
1. Cluster IP
2. Node Port
3. LoadBlancer


Services are an abstraction that define a logical set of Pods and a policy to access them. They provide stable IP addresses and DNS names for accessing these Pods, and they can also offer load balancing, service discovery, and access control.

### 1. ClusterIP
Definition: The default type of Service in Kubernetes. A ClusterIP service exposes the service on an internal IP address within the cluster, making it reachable only from within the cluster.
Use Case: Typically used for internal communication between Pods in the same Kubernetes cluster.
#### How It Works:
A virtual IP (known as the ClusterIP) is assigned to the service.
Kubernetes uses iptables or IPVS (depending on your setup) to route traffic from the service’s IP to the Pods backing the service.
Not accessible from outside the cluster unless you have other means like kubectl port-forward or exposing the service externally via NodePort or LoadBalancer.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: ClusterIP

```

### 2. NodePort
Definition: A type of Kubernetes Service that exposes the service on a static port on each node's IP address. This allows external traffic to access the service by connecting to any node's IP on the specified port.
Use Case: Useful for exposing services to external clients or for use in development environments where you need to quickly expose a service externally without configuring an external load balancer.
#### How It Works:
Kubernetes allocates a port in the range of 30000-32767 (default range) on each node in the cluster.
Traffic directed to NodeIP:NodePort will be forwarded to the appropriate Pod.
It's a simple way to expose a service, but it has limitations compared to LoadBalancer, especially for production-grade environments.
External access can be done by accessing any node's IP and port.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
      nodePort: 30007
  type: NodePort

```
### 3. LoadBalancer
Definition: A type of Kubernetes Service that provisions an external load balancer (typically provided by the cloud provider) to distribute incoming traffic to the service. This type is mainly used in cloud environments.
Use Case: Ideal for production environments where you want to expose your service to external traffic with automatic load balancing and high availability.
#### How It Works:
When you create a LoadBalancer service, Kubernetes communicates with the cloud provider's API to create an external load balancer.
The cloud provider assigns a public IP address to the load balancer.
Traffic coming to that public IP is automatically forwarded to the service and distributed across the Pods.
Useful for web applications, APIs, and other services that require external access with built-in load balancing and scaling.
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: LoadBalancer

```
## Summary:
**ClusterIP:** Exposes the service internally within the Kubernetes cluster (default, not accessible externally).

**NodePort:** Exposes the service on a static port across all cluster nodes, making it accessible externally by connecting to NodeIP:NodePort.

**LoadBalancer:** Creates an external load balancer (typically in cloud environments) to distribute traffic across Pods, providing external access with automatic load balancing.

![img_5.png](img_5.png)




example:

deployment.yml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  labels:
    app: nginx
spec:
  replicas: 10
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.27
        ports:
        - containerPort: 80
```
service.yml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-nodeport
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80  #this is within cluster
      targetPort: 80 #port on container
      nodePort: 30010 #exposed port
  type: NodePort
```


```commandline
root@ip-172-31-20-191:~# kubectl apply -f deployment.yml 
deployment.apps/my-deployment created

root@ip-172-31-20-191:~# kubectl get pods
NAME                            READY   STATUS    RESTARTS   AGE
my-deployment-87cdd7684-2p95t   1/1     Running   0          29s
my-deployment-87cdd7684-7trzw   1/1     Running   0          29s
my-deployment-87cdd7684-8zvwc   1/1     Running   0          29s
my-deployment-87cdd7684-9f5zh   1/1     Running   0          29s
my-deployment-87cdd7684-b8xlh   1/1     Running   0          29s
my-deployment-87cdd7684-bflc2   1/1     Running   0          29s
my-deployment-87cdd7684-f86hx   1/1     Running   0          29s
my-deployment-87cdd7684-mttvr   1/1     Running   0          29s
my-deployment-87cdd7684-smt6l   1/1     Running   0          29s
my-deployment-87cdd7684-vzg6p   1/1     Running   0          29s

root@ip-172-31-20-191:~# kubectl apply -f service.yml 
service/nginx-nodeport created
root@ip-172-31-20-191:~# kubectl get svc
NAME             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes       ClusterIP   10.152.183.1     <none>        443/TCP        37m
nginx-nodeport   NodePort    10.152.183.182   <none>        80:30010/TCP   9s
root@ip-172-31-20-191:~# kubectl get deployments
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
my-deployment   10/10   10           10          6m43s
```
![img_6.png](img_6.png)

# NAMESPACE
LOGICAL SEPARTAION OF YOUR PHYSICAL SERVER

![img_7.png](img_7.png)

## Default namespaces in kubernetes

* default: The deault namespace where resource are created if no namespaces is specified
* kube-system: the namespace which includes all the static pod/ control or worker node compnonets
* kube-public: to enable to read-only mode for pods we are using kube-public
* kube-node-lease: used to track the node heartbeat 


```commandline
root@ip-172-31-16-37:~# kubectl get ns
NAME              STATUS   AGE
default           Active   54s
kube-node-lease   Active   54s
kube-public       Active   54s
kube-system       Active   54s
```

```commandline
root@ip-172-31-16-37:~# kubectl get pods
No resources found in default namespace.
root@ip-172-31-16-37:~# kubectl get pods -n kube-public
No resources found in kube-public namespace.
root@ip-172-31-16-37:~# kubectl get pods -n kube-system
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-759cd8b574-86shz   1/1     Running   0          2m35s
calico-node-xv6vg                          1/1     Running   0          2m36s
coredns-7896dbf49-qns9t                    1/1     Running   0          2m35s
root@ip-172-31-16-37:~# kubectl get pods -n kube-node-lease
No resources found in kube-node-lease namespace.
```
### IMPARATIVE WAY CREATING NAMESPACE

```commandline
root@ip-172-31-16-37:~# kubectl create ns uday
namespace/uday created
root@ip-172-31-16-37:~# kubectl get ns
NAME              STATUS   AGE
default           Active   4m46s
kube-node-lease   Active   4m46s
kube-public       Active   4m46s
kube-system       Active   4m46s
uday              Active   6s
```


### Declartive way creating ns
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: sindhu
```

```commandline
root@ip-172-31-16-37:~# vi ns.yml
root@ip-172-31-16-37:~# kubectl apply -f ns.yml
namespace/sindhu created

root@ip-172-31-16-37:~# kubectl get ns
NAME              STATUS   AGE
default           Active   7m19s
kube-node-lease   Active   7m19s
kube-public       Active   7m19s
kube-system       Active   7m19s
sindhu            Active   13s
uday              Active   2m39s
```
## DECLARING POD 
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: cka-pod
spec:
  containers:
    - name: my-container
      image: nginx
```
```commandline
root@ip-172-31-16-37:~# vi pod.yml
root@ip-172-31-16-37:~# kubectl apply -f pod.yml
pod/cka-pod created
root@ip-172-31-16-37:~# kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
cka-pod   1/1     Running   0          11s
root@ip-172-31-16-37:~# kubectl apply -f pod.yml  -n uday
pod/cka-pod created
root@ip-172-31-16-37:~# kubectl get pods -n uday
NAME      READY   STATUS    RESTARTS   AGE
cka-pod   1/1     Running   0          5s
```


## DECLARING POD USING NAMESPACE
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: cka-pod
  namespace: sindhu
spec:
  containers:
    - name: my-container
      image: nginx
```

```commandline
root@ip-172-31-16-37:~# vi pod.yml
root@ip-172-31-16-37:~# kubectl delete pod cka-pod
pod "cka-pod" deleted
root@ip-172-31-16-37:~# kubectl get pods
No resources found in default namespace.
root@ip-172-31-16-37:~# kubectl apply -f pod.yml
pod/cka-pod created
root@ip-172-31-16-37:~# kubectl get pods
No resources found in default namespace.
root@ip-172-31-16-37:~# kubectl get pods -n sindhu
NAME      READY   STATUS    RESTARTS   AGE
cka-pod   1/1     Running   0          10s
```

## ESTABLISHING THE COMMUNICATION BETWEEN NAMESPACE

```commandline
root@ip-172-31-16-37:~# kubectl get pods -o wide -n uday
NAME      READY   STATUS    RESTARTS   AGE    IP             NODE              NOMINATED NODE   READINESS GATES
cka-pod   1/1     Running   0          4m9s   10.1.204.132   ip-172-31-16-37   <none>           <none>
root@ip-172-31-16-37:~# kubectl get pods -o wide -n sindhu
NAME      READY   STATUS    RESTARTS   AGE    IP             NODE              NOMINATED NODE   READINESS GATES
cka-pod   1/1     Running   0          112s   10.1.204.133   ip-172-31-16-37   <none>           <none>
root@ip-172-31-16-37:~# kubectl exec -it cka-pod -n uday -- bash
root@cka-pod:/# curl -v 10.1.204.133
*   Trying 10.1.204.133:80...
* Connected to 10.1.204.133 (10.1.204.133) port 80 (#0)
> GET / HTTP/1.1
> Host: 10.1.204.133
> User-Agent: curl/7.88.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: nginx/1.27.3
< Date: Mon, 30 Dec 2024 08:53:37 GMT
< Content-Type: text/html
< Content-Length: 615
< Last-Modified: Tue, 26 Nov 2024 15:55:00 GMT
< Connection: keep-alive
< ETag: "6745ef54-267"
< Accept-Ranges: bytes
<
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
* Connection #0 to host 10.1.204.133 left intact
```


DNS RESOLVING 

DEPLOYMENT.YML
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.27
        ports:
        - containerPort: 80
```

service.yml
```commandline
root@ip-172-31-16-37:~# cat service.yml
apiVersion: v1
kind: Service
metadata:
  name: nginx-nodeport-uday
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80  #this is within cluster
      targetPort: 80 #port on container
  type: NodePort
```

Create in  both namespace

```commandline
root@ip-172-31-16-37:~# vi service.yml
root@ip-172-31-16-37:~# kubectl apply -f service.yml -n uday
service/nginx-nodeport-uday created
root@ip-172-31-16-37:~# kubectl get svc
NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.152.183.1   <none>        443/TCP   51m
root@ip-172-31-16-37:~# kubectl get svc -n uday
NAME                  TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
nginx-nodeport-uday   NodePort   10.152.183.122   <none>        80:30168/TCP   10s
root@ip-172-31-16-37:~# kubectl get pods -n uday
NAME                            READY   STATUS    RESTARTS   AGE
cka-pod                         1/1     Running   0          39m
my-deployment-87cdd7684-z66m9   1/1     Running   0          45s
root@ip-172-31-16-37:~# kubectl exec -it my-deployment-87cdd7684-z66m9 -n uday -- bash
root@my-deployment-87cdd7684-z66m9:/# curl nginx-nodeport
curl: (6) Could not resolve host: nginx-nodeport
root@my-deployment-87cdd7684-z66m9:/# curl svc-nginx-nodeport
curl: (6) Could not resolve host: svc-nginx-nodeport
root@my-deployment-87cdd7684-z66m9:/# curl nginx-nodeport.sindhu.svc.cluster.local
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

from sindhu namespace:
```commandline
root@ip-172-31-16-37:~# vi deployment.yml
root@ip-172-31-16-37:~# kubectl apply -f deployment.yml
deployment.apps/my-deployment created
root@ip-172-31-16-37:~# kubectl apply -f deployment.yml -n sindhu
deployment.apps/my-deployment created
root@ip-172-31-16-37:~# vi service.yml
root@ip-172-31-16-37:~# kubectl apply -f service.yml -n sindhu
service/nginx-nodeport created
root@ip-172-31-16-37:~# kubectl get svc -n sindhu
NAME             TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
nginx-nodeport   NodePort   10.152.183.77   <none>        80:30010/TCP   9s
root@ip-172-31-16-37:~# kubectl get pods -n sindhu
NAME                            READY   STATUS    RESTARTS   AGE
cka-pod                         1/1     Running   0          37m
my-deployment-87cdd7684-js226   1/1     Running   0          3m49s
root@ip-172-31-16-37:~# kubectl exec -it my-deployment-87cdd7684-js226 -n sindhu -- bash
root@my-deployment-87cdd7684-js226:/# cat /etc/resolv.conf
search sindhu.svc.cluster.local svc.cluster.local cluster.local ec2.internal
nameserver 10.152.183.10
options ndots:5
root@my-deployment-87cdd7684-js226:/# curl nginx-nodeport-uday.uday.svc.cluster.local
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

## command to resolve
```commandline
<service-name>.<namespace>.<svc.cluster.local>
```
```commandline
curl nginx-nodeport-uday.uday.svc.cluster.local
```

![img_9.png](img_9.png)


# MULTICONTAINER PODS
Multicontainer pod container two or more containers that run on same host/node
A pod is a group of containers that are scheduled onto the same host. 
Pods serve as units of scheduling, deployment, and horizontal scaling/replication. Pods share fate, and share some resources, such as storage volumes and IP addresses.

![img_10.png](img_10.png)

Whenever user reaches to pod first request goes to init container and then it reaches nginx-app container

**What are Multi-container Pods?**
A multi-container pod contains two or more containers that run on the same node in a Kubernetes cluster. These containers share certain resources like:

1.Networking: All containers in the pod share the same IP address and port space. This means they can communicate with each other over localhost (127.0.0.1), using the same internal network.

2.Storage: Multi-container pods can use the same storage volumes, which makes it easier to share data between containers. This is often used to pass information between containers or store logs and configuration data.

3.The main benefit of multi-container pods is that they allow containers that need to work together to share resources in a way that wouldn't be possible if they were in separate pods.

**Exmaple to describe multicontainer pod**

```commandline
apiVersion: v1
kind: Pod
metadata:
  name: myapp
  labels:
    name: myapp-pod
spec:
  containers:
    - name: myapp-container
      image: busybox:1.28 # here its generic image which maintained by kubernetes which does some specif task
      command: ['sh', '-c', 'echo app is running && sleep 3600'] ## here we can add args and command together also if we want to separate you can look for init containers
      env:
        - name: FIRSTNAME
          value: "Manoj"
## adding multiple containers
  initContainers:
    - name: init-myservice
      image: busybox:1.28
      command: ['sh', '-c']
      args: ['until nslookup myservice.default.svc.cluster.local; do echo "waiting for service to be up" && sleep 2; done'] ## here NSlookup command works only when service working fine and look for service

```
```commandline
12:18:19 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl apply -f pod.yml 
pod/myapp created
12:18:27 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME    READY   STATUS     RESTARTS   AGE
myapp   0/1     Init:0/1   0          3s
12:18:30 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME    READY   STATUS     RESTARTS   AGE
myapp   0/1     Init:0/1   0          5s
```
Look for logs 

```commandline
12:18:31 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl logs -f myapp
Defaulted container "myapp-container" out of: myapp-container, init-myservice (init)
Error from server (BadRequest): container "myapp-container" in pod "myapp" is waiting to start: PodInitializing


Looking for init container pods 
12:19:29 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl logs -f myapp -c init-myservice
nslookup: can't resolve 'myservice.default.svc.cluster.local'
Server:    10.96.0.10
Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local

waiting for service to be up
Server:    10.96.0.10
Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local

```

Now in order resolve this lets create deployment and service file to initilise the init containers

```commandline
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
  labels:
    name: myapp-pod
spec:
  replicas: 1
  selector:
    matchLabels:
      name: myapp-pod
  template:
    metadata:
      labels:
        name: myapp-pod
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```

```commandline
12:21:33 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl apply -f deployment.yml 
deployment.apps/nginx-deploy created

12:28:12 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS     RESTARTS   AGE
myapp                          0/1     Init:0/1   0          9m55s
nginx-deploy-5b4fcd577-qzfs2   1/1     Running    0          24s
12:28:21 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS     RESTARTS   AGE
myapp                          0/1     Init:0/1   0          9m57s
nginx-deploy-5b4fcd577-qzfs2   1/1     Running    0          26s
```

**CREATING THE SERVICE**
```commandline
apiVersion: v1
kind: Service
metadata:
  name: myservice
spec:
  selector:
    app.kubernetes.io/name: myapp
  ports:
    - protocol: TCP
      port: 80
```
```commandline
12:29:00 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl apply -f service.yml 
service/myservice created
12:32:57 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS     RESTARTS   AGE
myapp                          0/1     Init:0/1   0          14m
nginx-deploy-5b4fcd577-qzfs2   1/1     Running    0          5m3s
12:33:01 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS     RESTARTS   AGE
myapp                          0/1     Init:0/1   0          14m
nginx-deploy-5b4fcd577-qzfs2   1/1     Running    0          5m7s

12:33:11 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS    RESTARTS   AGE
myapp                          1/1     Running   0          15m
nginx-deploy-5b4fcd577-qzfs2   1/1     Running   0          5m48s

```
Now all the init containers are up and running 

check the the logs of init container below it started resolving the hostname

```commandline
kubectl logs -f myapp -c init-myservice

waiting for service to be up
nslookup: can't resolve 'myservice.default.svc.cluster.local'
Server:    10.96.0.10
Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local

Name:      myservice.default.svc.cluster.local
Address 1: 10.96.96.227 myservice.default.svc.cluster.local
```
**TO PRINT ALL THE ENV VALUES OF THE CONTAINER**

```commandline
12:35:21 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl exec -it myapp -- printenv
Defaulted container "myapp-container" out of: myapp-container, init-myservice (init)
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=myapp
FIRSTNAME=Manoj
MYSERVICE_SERVICE_PORT=80
MYSERVICE_PORT_80_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
MYSERVICE_PORT_80_TCP=tcp://10.96.96.227:80
MYSERVICE_PORT_80_TCP_PORT=80
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
MYSERVICE_PORT=tcp://10.96.96.227:80
MYSERVICE_SERVICE_HOST=10.96.96.227
MYSERVICE_PORT_80_TCP_ADDR=10.96.96.227
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
TERM=xterm
HOME=/root
```

**NOW CREATING THE MULTIPLE INIT CONTAINERS**

```commandline
apiVersion: v1
kind: Pod
metadata:
  name: myapp
  labels:
    name: myapp-pod
spec:
  containers:
    - name: myapp-container
      image: busybox:1.28 # here its generic image which maintained by kubernetes which does some specif task
      command: ['sh', '-c', 'echo app is running && sleep 3600'] ## here we can add args and command together also if we want to separate you can look for init containers
      env:
        - name: FIRSTNAME
          value: "Manoj"
## adding multiple containers
  initContainers:
    - name: init-myservice
      image: busybox:1.28
      command: ['sh', '-c']
      args: ['until nslookup myservice.default.svc.cluster.local; do echo "waiting for service to be up" && sleep 2; done'] ## here NSlookup command works only when service working fine and look for service

    - name: init-mydb
      image: busybox:1.28
      command: ['sh', '-c']
      args: ['until nslookup mydb.default.svc.cluster.local; do echo "waiting for service to be up" && sleep 2; done'] ## here NSlookup command works only when service working fine and look for service
apiVersion: v1
kind: Pod
metadata:
  name: myapp
  labels:
    name: myapp-pod
spec:
  containers:
    - name: myapp-container
      image: busybox:1.28 # here its generic image which maintained by kubernetes which does some specif task
      command: ['sh', '-c', 'echo app is running && sleep 3600'] ## here we can add args and command together also if we want to separate you can look for init containers
      env:
        - name: FIRSTNAME
          value: "Manoj"
## adding multiple containers
  initContainers:
    - name: init-myservice
      image: busybox:1.28
      command: ['sh', '-c']
      args: ['until nslookup myservice.default.svc.cluster.local; do echo "waiting for service to be up" && sleep 2; done'] ## here NSlookup command works only when service working fine and look for service

    - name: init-mydb
      image: busybox:1.28
      command: ['sh', '-c']
      args: ['until nslookup mydb.default.svc.cluster.local; do echo "waiting for service to be up" && sleep 2; done'] ## here NSlookup command works only when service working fine and look for service
```

```commandline
12:42:30 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl apply -f multiple-init-container.yml
pod/myapp created
12:42:43 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS     RESTARTS   AGE
myapp                          0/1     Init:0/2   0          5s
nginx-deploy-5b4fcd577-qzfs2   1/1     Running    0          14m
12:42:48 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS     RESTARTS   AGE
myapp                          0/1     Init:1/2   0          22s
nginx-deploy-5b4fcd577-qzfs2   1/1     Running    0          15m

```

Because here we need to add one more service of DB

here we can create in imparative way also 
```commandline
12:44:25 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl create deploy mydb --image redis --port 80
deployment.apps/mydb created

12:45:20 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl expose deploy mydb --name mydb --port 80
service/mydb exposed
```
```commandline
12:45:36 manojkrishnappa@Manojs-MacBook-Pro 11-Multicontainer-pod → kubectl get pods
NAME                           READY   STATUS    RESTARTS   AGE
myapp                          1/1     Running   0          3m12s
mydb-5b56d6fb4b-gvf2z          1/1     Running   0          69s
nginx-deploy-5b4fcd577-qzfs2   1/1     Running   0          17m
```

Now all the pods are up and running 
