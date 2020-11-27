attach() {	
    name=$1	
    if [ "${name:0:1}" = "r" ]; then	
        docker exec -it --user 1000 $name /bin/bash	
    else	
        lxc exec $name /bin/bash	
    fi	
}

add_nic() {
    ovs-docker add-port $1 eth$3 $2
    if [ $? != 0 ]; then
        add_nic $1 $2 $(($3+1))
    fi
}

connect() {    
    cn1=$1
    cn2=$2    
    ovs-vsctl add-br br-$1-$2 
    add_nic br-$1-$2 $1 10      
    add_nic br-$1-$2 $2 10  
}

reset_nic() {    
    ovs-docker del-ports dummy $1
}

add_server() {
    router_name=$1
    container_name=$2
    lxc network create br-$router_name-server
    lxc network set br-$router_name-server bridge.driver openvswitch
    ovs-docker add-port br-$router_name-server eth100 $router_name
    lxc launch ubuntu:20.04 $container_name --network=br-${router_name}-server --config=user.network-config="version: 1
config:
  - type: veth
    name: eth0
    link: br-${router_name}-server
"
}

nic_full_reset() {
    docker start $(docker ps -qa)
    
    seq 1 6 | xargs -I XXX docker exec rXXX bash -c "echo '127.0.0.1 rXXX' >> /etc/hosts"
    docker exec rEX bash -c "echo '127.0.0.1 rEX' >> /etc/hosts"
    
    reset_nic r1
    reset_nic r2
    reset_nic r3
    reset_nic r4
    reset_nic r5
    reset_nic r6
    reset_nic rEX    

    connect r1 r6
    connect r1 r2
    connect r2 r3
    connect r2 r5
    connect r3 r4
    connect r4 r5
    connect r5 r6
    connect r1 rEX
    connect r6 rEX
    
    add_nic br-r4-server r4 100
    add_nic br-rEX-server rEX 100
}

full_reset() {
    docker ps -qa | xargs docker rm -f
    docker network prune
    lxc delete -f $(lxc list --format=csv --columns=n)

    seq 1 6 | xargs -IXXX docker run -d --name rXXX --hostname=rXXX --net=none --privileged -v /lib/modules:/lib/modules 2stacks/vyos:latest /sbin/init
    docker run -d --name rEX --hostname=rEX --net=host --privileged -v /lib/modules:/lib/modules 2stacks/vyos:latest /sbin/init

    nic_full_reset
    add_server r4 s1
    add_server r4 s2
    add_server r4 s3
    add_server rEX sEX
}
