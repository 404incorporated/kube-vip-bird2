# About
This image is supposed to run in the kube-vip daemonset. It looks at the IPs in the `lo` interface and advertises them with BGP.

Much of this OCI Image is inspired by [ncatelli/bird_examples_docker](https://github.com/ncatelli/bird_examples_docker)