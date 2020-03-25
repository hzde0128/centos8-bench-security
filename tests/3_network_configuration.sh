#!/bin/env bash

check_3() {
  info           "3       - Network Configuration"
  info           "3.1     - Network Parameters (Host Only)"
  test_wrapper 0 "3.1.1   - Ensure IP forwarding is disabled (Scored)" test_sysctl net.ipv4.ip_forward 0
  test_wrapper 0 "3.1.2   - Ensure packet redirect sending is disabled (Scored)" test_net_ipv4_conf_all_default send_redirects 0
  
  info           "3.2     - Network Parameters (Host and Router)"
  test_wrapper 0 "3.2.1   - Ensure source routed packets are not accepted (Scored)" test_net_ipv4_conf_all_default accept_source_route 0
  test_wrapper 0 "3.2.2   - Ensure ICMP redirects are not accepted (Scored)" test_net_ipv4_conf_all_default accept_redirects 0
  test_wrapper 0 "3.2.3   - Ensure secure ICMP redirects are not accepted (Scored)" test_net_ipv4_conf_all_default secure_redirects 0
  test_wrapper 0 "3.2.4   - Ensure suspicious packets are logged (Scored)" test_net_ipv4_conf_all_default log_martians 1
  test_wrapper 0 "3.2.5   - Ensure broadcast ICMP requests are ignored (Scored)" test_sysctl net.ipv4.icmp_echo_ignore_broadcasts 1
  test_wrapper 0 "3.2.6   - Ensure bogus ICMP responses are ignored (Scored)" test_sysctl net.ipv4.icmp_ignore_bogus_error_responses 1
  test_wrapper 0 "3.2.7   - Ensure Reverse Path Filtering is enabled (Scored)" test_net_ipv4_conf_all_default rp_filter 1
  test_wrapper 0 "3.2.8   - Ensure TCP SYN Cookies is enabled (Scored)" test_sysctl net.ipv4.tcp_syncookies 1
  test_wrapper 0 "3.2.9   - Ensure IPv6 router advertisements are not accepted (Scored)" test_net_ipv6_conf_all_default accept_ra 0

  info           "3.3 Uncommon Network Protocols"
  test_wrapper 0 "3.3.1   - Ensure DCCP is disabled (Scored)" test_module_disabled dccp
  test_wrapper 0 "3.3.2   - Ensure SCTP is disabled (Scored)" test_module_disabled sctp
  test_wrapper 0 "3.3.3   - Ensure RDS is disabled (Scored)" test_module_disabled rds
  test_wrapper 0 "3.3.4   - Ensure TIPC is disabled (Scored)" test_module_disabled tipc

  info           "3.4     - Firewall Configuration"
  info           "3.4.1   - Ensure Firewalld software is installed"
  todo           "3.4.1.1 - Ensure a Firewalld package is installed (Scored)"

  info           "3.4.2   - Configure firewalld"
  todo           "3.4.2.1 - Ensure firewalld service is enabled and running (Scored)"
  todo           "3.4.2.2 - Ensure nftables is not enabled (Scored)"
  todo           "3.4.2.3 - Ensure default zone is set (Scored)"
  todo           "3.4.2.4 - Ensure network interfaces are assigned to appropriate zone (Not Scored)"
  todo           "3.4.2.5 - Ensure unnecessary services and ports are not accepted (Not Scored)"
  todo           "3.4.2.6 - Ensure iptables is not enabled (Scored)"
  info           "3.4.3 Configure nftables"
  todo           "3.4.3.1 - Ensure iptables are flushed (Not Scored)"
  todo           "3.4.3.2 - Ensure a table exists (Scored)"
  todo           "3.4.3.3 - Ensure base chains exists (Scored)"
  todo           "3.4.3.4 - Ensure loopback traffic is configured (Scored)"
  todo           "3.4.3.5 - Ensure outbound and established connections are configured (Not Scored)"
  todo           "3.4.3.6 - Ensure default deny firewall policy (Scored)"
  todo           "3.4.3.7 - Ensure nftables service is enabled (Scored)"
  todo           "3.4.3.8 - Ensure nftables rules are permanent (Scored)"

  info           "3.4.4   - Configure iptables"
  test_wrapper 0 "3.4.4.1.1 - Ensure default deny firewall policy (Scored)" test_firewall_policy
  test_wrapper 0 "3.4.4.1.2 - Ensure loopback traffic is configured (Scored)" test_loopback_traffic_conf
  todo           "3.4.4.1.3 - Ensure outbound and established connections are configured (Not Scored)"
  todo           "3.4.4.1.4 - Ensure firewall rules exist for all open ports (Scored)"
  todo           "3.4.4.2.1 - Ensure IPv6 default deny firewall policy (Scored)"
  todo           "3.4.4.2.2 - Ensure IPv6 loopback traffic is configured (Scored)"
  todo           "3.4.4.2.3 - Ensure IPv6 outbound and established connections are configured (Not Scored)"
  todo           "3.4.4.2.4 - Ensure IPv6 firewall rules exist for all open ports (Not Scored)"

  test_wrapper 0 "3.5     - Ensure wireless interfaces are disabled (Scored)" test_wireless_if_disabled
  todo           "3.6     - Disable IPv6 (Not Scored)"
}
