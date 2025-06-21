sudo docker run -it --rm \
  -v "$(pwd)":/build/leo-cdp \
  --network docker-arangodb_net_leocdp \
  leo-cdp-free-edition:latest