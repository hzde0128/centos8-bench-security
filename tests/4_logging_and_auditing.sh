#!/bin/env bash

check_4() {
  info           "4       - Logging and Auditing"
  info           "4.1     - Configure System Accounting (auditd)"
  info           "4.1.1   - Ensure audit is enabled"
  todo           "4.1.1.1 - Ensure auditd service is installed (Scored)"
  test_wrapper 0 "4.1.1.2 - Ensure auditd service is enabled (Scored)" test_service_enabled auditd
  test_wrapper 0 "4.1.1.3 - Ensure auditing for processes that start prior to auditd is enabled (Scored)" test_audit_procs_prior_2_auditd
  todo           "4.1.1.4 - Ensure audit_backlog_limit is sufficient (Scored)"

  info           "4.1.2   - Configure Data Retention"
  test_wrapper 0 "4.1.2.1 - Ensure audit log storage size is configured (Scored)" test_audit_log_storage_size
  test_wrapper 0 "4.1.2.2 - Ensure audit logs are not automatically deleted (Scored)" test_keep_all_audit_info
  test_wrapper 0 "4.1.2.3 - Ensure system is disabled when audit logs are full (Scored)" test_dis_on_audit_log_full
  test_wrapper 0 "4.1.3   - Ensure changes to system administration scope (sudoers) is collected (Scored)" test_coll_chg2_sysadm_scope
  test_wrapper 0 "4.1.4   - Ensure login and logout events are collected (Scored)" test_audit_logins_logouts
  test_wrapper 0 "4.1.5   - Ensure session initiation information is collected (Scored)" test_audit_session_init
  test_wrapper 0 "4.1.6   - Ensure events that modify date and time information are collected (Scored)" test_audit_date_time
  test_wrapper 0 "4.1.7   - Ensure events that modify the system's Mandatory Access Controls are collected (Scored)" test_audit_sys_mac
  test_wrapper 0 "4.1.8   - Ensure events that modify the system's network environment are collected (Scored)" test_audit_network_env
  test_wrapper 0 "4.1.9   - Ensure discretionary access control permission modification events are collected (Scored)" test_audit_dac_perm_mod_events
  test_wrapper 0 "4.1.10  - Ensure unsuccessful unauthorized file access attempts are collected (Scored)" test_unsuc_unauth_acc_attempts
  test_wrapper 0 "4.1.11  - Ensure events that modify user/group information are collected (Scored)" test_audit_user_group
  test_wrapper 0 "4.1.12  - Ensure successful file system mounts are collected (Scored)" test_coll_suc_fs_mnts
  test_wrapper 0 "4.1.13  - Ensure use of privileged commands is collected (Scored)" test_coll_priv_cmds
  test_wrapper 0 "4.1.14  - Ensure file deletion events by users are collected (Scored)" test_coll_file_del_events
  test_wrapper 0 "4.1.15  - Ensure kernel module loading and unloading is collected (Scored)" test_kmod_lod_unlod
  test_wrapper 0 "4.1.16  - Ensure system administrator actions (sudolog) are collected (Scored)" test_coll_sysadm_actions
  test_wrapper 0 "4.1.17  - Ensure the audit configuration is immutable (Scored)" test_audit_cfg_immut
  
  info "4.2     - Configure Logging"
  test_rpm_installed rsyslog
  local do_skip_rsyslog=$?
  info           "4.2.1   - Configure rsyslog"
  todo           "4.2.1.1 - Ensure rsyslog is installed (Scored)" 
  test_wrapper 0 "4.2.1.2 - Ensure rsyslog Service is enabled (Scored)" test_service_enabled rsyslog
  test_wrapper 0 "4.2.1.3 - Ensure rsyslog default file permissions configured (Scored)" test_rsyslog_file_perssion
  todo           "4.2.1.4 - Ensure logging is configured (Not Scored)"
  test_wrapper $do_skip_rsyslog "4.2.1.5 - Ensure rsyslog is configured to send logs to a remote log host (Scored)" test_rsyslog_content
  todo           "4.2.1.6 - Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)"
  test_rpm_installed syslog-ng
  local do_skip_syslogng=$?
  info           "4.2.2   - Configure journald"
  todo           "4.2.2.1 - Ensure journald is configured to send logs to rsyslog (Scored)"
  todo           "4.2.2.2 - Ensure journald is configured to compress large log files (Scored)"
  todo           "4.2.2.3 - Ensure journald is configured to write logfiles to persistent disk (Scored)"
 

  test_wrapper 0 "4.2.3   - Ensure permissions on all logfiles are configured (Scored)" test_var_log_files_permissions
  todo           "4.3     - Ensure logrotate is configured (Not Scored)"
}
