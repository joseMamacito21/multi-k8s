docker build -t josemelendezbolanos21/multi-client:latest -t josemelendezbolanos21/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t josemelendezbolanos21/multi-server:latest -t josemelendezbolanos21/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t josemelendezbolanos21/multi-worker:latest -t josemelendezbolanos21/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push josemelendezbolanos21/multi-client:latest
docker push josemelendezbolanos21/multi-client:$SHA
docker push josemelendezbolanos21/multi-server:latest
docker push josemelendezbolanos21/multi-server:$SHA
docker push josemelendezbolanos21/multi-worker:latest
docker push josemelendezbolanos21/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=josemelendezbolanos21/multi-server:$SHA
kubectl set image deployments/client-deployment client=josemelendezbolanos21/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=josemelendezbolanos21/multi-worker:$SHA