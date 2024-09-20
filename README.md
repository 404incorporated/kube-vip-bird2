# About
This image is supposed to run in the kube-vip daemonset. It looks at the IPs on an interface and advertises them with BGP.

Much of this OCI Image is inspired by [ncatelli/bird_examples_docker](https://github.com/ncatelli/bird_examples_docker)

# Usage

### Environment Variables
PEERS is a comma seperated list of IPs and AS numbers  
Example:  
`PEERS="192.168.100.11:64512,192.168.100.12:64512"`

WATCH_INTERFACE is the interface name to get IP addresses from that we will announce  
Example:  
`WATCH_INTERFACE="dummy0"`

### Config Generation Program
bird-gen-config is passed 2 args, first is the input tmpl path, second is the output path for the config.  
It uses the environment variables for generating the configuration.  