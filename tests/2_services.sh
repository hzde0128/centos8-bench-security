#!/bin/env bash

check_2() {
  info           "2       - Services"
  info           "2.1     - inetd Services"
  test_wrapper 0 "2.1.1   - Ensure xinetd is not installed (Scored)" test_service_disable xinetd

  info           "2.2     - Special Purpose Services"
  info           "2.2.1   - Time Synchronization"
  test_wrapper 0 "2.2.1.1 - Ensure time synchronization is in use (Not Scored)" test_time_sync_services_enabled
  test_wrapper 0 "2.2.1.2 - Ensure chrony is configured (Scored)" test_chrony_cfg
  test_wrapper 0 "2.2.2   - Ensure X Window System is not installed (Scored)" test_rpm_not_installed 'xorg-x11*'
  test_wrapper 0 "2.2.3   - Ensure rsync service is not enabled (Scored)" test_service_disable rsyncd
  test_wrapper 0 "2.2.4   - Ensure Avahi Server is not enabled (Scored)" test_service_disable avahi-daemon
  test_wrapper 0 "2.2.5   - Ensure SNMP Server is not enabled (Scored)" test_service_disable snmpd
  test_wrapper 0 "2.2.6   - Ensure HTTP Proxy Server is not enabled (Scored)" test_service_disable squid
  test_wrapper 0 "2.2.7   - Ensure Samba is not enabled (Scored)" test_service_disable smb
  test_wrapper 0 "2.2.8   - Ensure IMAP and POP3 server is not enabled (Scored)" test_service_disable dovecot
  test_wrapper 0 "2.2.9   - Ensure HTTP server is not enabled (Scored)" test_service_disable httpd
  test_wrapper 0 "2.2.10  - Ensure FTP Server is not enabled (Scored)" test_service_disable vsftpd
  test_wrapper 0 "2.2.11  - Ensure DNS Server is not enabled (Scored)" test_service_disable named
  test_wrapper 0 "2.2.12  - Ensure NFS and RPC are not enabled (Scored)" test_nfs_rpcbind_services_disabled
  todo           "2.2.13  - Ensure RPC is not enabled (Scored)"
  test_wrapper 0 "2.2.14  - Ensure LDAP server is not enabled (Scored)" test_service_disable slapd
  test_wrapper 0 "2.2.15  - Ensure DHCP Server is not enabled (Scored)" test_service_disable dhcpd
  test_wrapper 0 "2.2.16  - Ensure CUPS is not enabled (Scored)" test_service_disable cups
  test_wrapper 0 "2.2.17  - Ensure NIS Server is not enabled (Scored)" test_service_disable ypserv
  test_wrapper 0 "2.2.18  - Ensure mail transfer agent is configured for local-only mode (Scored)" test_mta_local_only
  
  info           "2.3     - Service Clients"
  test_wrapper 0 "2.3.1   - Ensure NIS Client is not installed (Scored)" test_rpm_not_installed ypbind
  test_wrapper 0 "2.3.2   - Ensure telnet client is not installed (Scored)" test_rpm_not_installed telnet
  test_wrapper 0 "2.3.3   - Ensure LDAP client is not installed (Scored)" test_rpm_not_installed openldap-clients
}