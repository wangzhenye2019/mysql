"""
---------------------------------------
# -*- coding: utf-8 -*-
# @Time : 2021/11/24 7:46 下午
# @Author : wangzhenye2019
# @Project_name : mysql
# @Filename : 参数文件.py
# @Software : PyCharm 
# @Github : https://github.com/wangzhenye2019/
---------------------------------------
"""
[client]
port=3306 # 设置mysql客户端连接服务端时默认使用的端口


[mysql]
no-beep
prompt="\u@mysqldb \R:\m:\s [\d]> "
#no-auto-rehash
auto-rehash
default-character-set=utf8 # 全局默认使用uft8字符集编码格式

[mysqld]
########basic settings########
server-id=3306
port=3306  # 设置3306端口
user = mysql # 操作MySQL的用户名为mysql
bind_address= 0.0.0.0

character-set-server=utf8
autocommit = 1
#skip_name_resolve = 1
max_connections = 800  # 允许最大连接数,设置Mysql的最大连接数；如果实际应用中，并发的连接数量比较大，可以适当的调高此参数，但是，也不是说越高越好，因为这牵涉到服务器的机器硬件的性能。
#有时候查看日志，会看到例如：“Error 1040 : Too many connections”这样的错误，导致这种错误出现的原因通常是由于该参数的值设置过小导致；

max_connect_errors = 1000 # 客户端连接服务器在没有成功时就被阻断了，累计后超过这个设置的值时，服务器将阻止该客户端后续的所有访问；
default-storage-engine=INNODB # 创建新表时将使用的默认存储引擎
transaction_isolation = READ-COMMITTED
explicit_defaults_for_timestamp = 1
sort_buffer_size = 32M # 通过增加该值的大小可以提高查询中使用“group by”和“order by”的性能；
join_buffer_size = 128M # 查询语句中如果较多次使用join查询时，可适当增大该参数，默认2M，如果几乎不怎么用join进行查询，可不予理会；
tmp_table_size = 72M # 设置临时内部堆积表(Heap)的大小；
max_allowed_packet = 16M # 设置一次消息传输的最大值；
#sql_mode ="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER"
interactive_timeout = 1800
wait_timeout = 1800 # 超时等待时间，单位秒，即一个connection在若干秒内无响应，则服务器切断与这个客户端的连接；
read_buffer_size = 16M # 设置服务器读缓冲区的大小；
read_rnd_buffer_size = 32M # 设置服务器随机读取缓冲区的大小；

#query_cache_type = 1
#query_cache_size=1M
table_open_cache=2000
thread_cache_size=768
myisam_max_sort_file_size=10G #
myisam_sort_buffer_size=135M  # 服务器重建索引时允许建立的最大临时文件的大小；
key_buffer_size=32M
read_buffer_size=8M
read_rnd_buffer_size=4M

back_log=1024
#flush_time=0
open_files_limit=65536 # 控制文件打开的个数；
table_definition_cache=1400
#binlog_row_event_max_size=8K
#sync_master_info=10000
#sync_relay_log=10000
#sync_relay_log_info=10000

########log settings########
log-output=FILE
general_log = 0
slow_query_log = ON
long_query_time=10


log_queries_not_using_indexes = 1
log_slow_admin_statements = 1
log_slow_slave_statements = 1
log_throttle_queries_not_using_indexes = 10
#expire_logs_days = 90
#binlog_expire_logs_seconds=2592000
binlog_expire_logs_seconds=604800
min_examined_row_limit = 100


binlog_format='ROW'
binlog_rows_query_log_events=on


innodb_io_capacity = 4000
innodb_io_capacity_max = 8000
innodb_buffer_pool_size = 500M
innodb_buffer_pool_instances = 8
innodb_buffer_pool_load_at_startup = 1
innodb_buffer_pool_dump_at_shutdown = 1
innodb_lru_scan_depth = 2000
innodb_lock_wait_timeout = 5
#innodb_flush_method = O_DIRECT

innodb_log_file_size = 200M
innodb_log_files_in_group = 2
innodb_log_buffer_size = 16M

#innodb_undo_logs = 128
innodb_undo_tablespaces = 3
innodb_undo_log_truncate = 1
innodb_max_undo_log_size = 2G

innodb_flush_neighbors = 1
innodb_purge_threads = 4
#innodb_large_prefix = 1
innodb_thread_concurrency = 64
innodb_print_all_deadlocks = 1
innodb_strict_mode = 1
innodb_sort_buffer_size = 64M
innodb_flush_log_at_trx_commit=1
innodb_autoextend_increment=64
innodb_concurrency_tickets=5000
innodb_old_blocks_time=1000
innodb_open_files=65536
innodb_stats_on_metadata=0
innodb_file_per_table=1
innodb_checksum_algorithm=0
innodb_data_file_path=ibdata1:200M;ibdata2:200M;ibdata3:200M:autoextend:max:5G
innodb_temp_data_file_path = ibtmp1:200M:autoextend:max:20G

innodb_buffer_pool_dump_pct = 40
innodb_page_cleaners = 4
innodb_purge_rseg_truncate_frequency = 128
binlog_gtid_simple_recovery=1
log_timestamps=system
#transaction_write_set_extraction=MURMUR32
default_authentication_plugin=mysql_native_password # 默认使用“mysql_native_password”插件认证
#default_authentication_plugin=caching_sha2_password
