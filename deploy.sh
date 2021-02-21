docker build -t shumyk/multi-client:latest -t shumyk/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t shumyk/multi-server:latest -t shumyk/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shumyk/multi-worker:latest -t shumyk/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push shumyk/multi-client:latest
docker push shumyk/multi-server:latest
docker push shumyk/multi-worker:latest

docker push shumyk/multi-client:$SHA
docker push shumyk/multi-server:$SHA
docker push shumyk/multi-worker:$SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=shumyk/multi-server:$SHA
kubectl set image deployments/client-deployment client=shumyk/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=shumyk/multi-worker:$SHA
