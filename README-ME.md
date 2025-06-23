sudo docker build -t leo-cdp-free-edition:latest .

sudo docker run -it --rm \
  -v "$(pwd)":/build/leo-cdp \
  --network leo-cdp-free-edition_net_leocdp \
  leo-cdp-free-edition:latest