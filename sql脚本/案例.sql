
案例 2：其它会话：
SQL> conn itpux/itpux
Connected.
select sid from v$mystat where rownum=1;
--  149
select sid,serial# from v$session where sid=149;
--149        467
SQL> conn /as sysdba
SQL> select sid,serial#,username from v$session where username is not null;

       SID    SERIAL# USERNAME
---------- ---------- ------------------------------
        14        999 SYS
        15        381 ITPUX
        19        557 SYS
        24        887 ITPUX
        25         59 ITPUX
       140        605 ITPUX
       141        503 ITPUX
       144       1337 ITPUX
       149        467 ITPUX

9 rows selected.

SQL> exec dbms_system.set_ev(149,467,10046,12,'ITPUX');
SQL> exec dbms_system.set_sql_trace_in_session(149,467,true);

--其它 会话执行：
SQL> select id,name from itpux_member where name='itpux1004612';
        ID NAME
---------- --------------------
   1004612 itpux1004612

SQL> conn /as sysdba
SQL> exec dbms_system.set_sql_trace_in_session(149,467,false);
SQL> exec dbms_system.set_ev(149,467,10046,0,'ITPUX');

--在被跟踪端执行
SQL> select * from v$diag_info where name like 'Default Trace File';
/oracle/app/oracle/diag/rdbms/itpuxdb/itpuxdb/trace/itpuxdb_ora_14124.trc