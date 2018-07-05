#!/bin/bash
declare -A REPO
WDIR="/opt"
TDIR="tools/deployment/multinode"
DELAY=30
TASKS=(
    '010-setup-client'
    '020-ingress'
    '020-lma-nfs-provisioner'
    '040-prometheus'
    '050-alertmanager'
    '060-kube-state-metrics'
    '070-node-exporter'
    '030-ceph'
    '040-ceph-ns-activate'
    '050-mariadb'
    '060-rabbitmq'
    '070-memcached'
    '080-keystone'
    '090-ceph-radosgateway'
    '080-openstack-exporter'
    '100-glance'
    '110-cinder'
    '120-openvswitch'
    '130-libvirt'
    '140-compute-kit'
    '150-heat'
    '160-barbican'
    '120-fluent-logging')
REPO['010-setup-client']='openstack-helm'
REPO['020-ingress']='openstack-helm'
REPO['030-ceph']='openstack-helm'
REPO['040-ceph-ns-activate']='openstack-helm'
REPO['050-mariadb']='openstack-helm'
REPO['060-rabbitmq']='openstack-helm'
REPO['070-memcached']='openstack-helm'
REPO['080-keystone']='openstack-helm'
REPO['090-ceph-radosgateway']='openstack-helm'
REPO['100-glance']='openstack-helm'
REPO['110-cinder']='openstack-helm'
REPO['120-openvswitch']='openstack-helm'
REPO['130-libvirt']='openstack-helm'
REPO['140-compute-kit']='openstack-helm'
REPO['150-heat']='openstack-helm'
REPO['160-barbican']='openstack-helm'
REPO['020-lma-nfs-provisioner']='openstack-helm-infra'
REPO['040-prometheus']='openstack-helm-infra'
REPO['050-alertmanager']='openstack-helm-infra'
REPO['060-kube-state-metrics']='openstack-helm-infra'
REPO['070-node-exporter']='openstack-helm-infra'
REPO['080-openstack-exporter']='openstack-helm-infra'
REPO['120-fluent-logging']='openstack-helm-infra'
for task in "${TASKS[@]}" ; do
    cd "${WDIR}/${REPO[${task}]}" && bash "${TDIR}/${task}.sh"
    sleep $DELAY
done
