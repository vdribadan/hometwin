Homework V2
===================


This homework brings up to virtual machines  - central (10.10.10.3) and worker (10.10.10.2) with Vagrant and provisions them with ansible as local provisioner

----------

System requirements
-------------

* Vagrant 1.9.3
* Virtualbox 5.0

----------


Usage
-------------------

    vagrant up
    
----------


Result
-------------

On host **central** there will 4 Docker containers running:

 1. **Tomcat** server with servlet, which prints your "Hello World" and returns your IP address
 2. **2 Nginx ** reverse proxies, redirecting traffic to tomcat and terminating TLS
 3. **Haproxy** loadbalancer, which distributes traffic between nginx proxies
 4. **Postgres** database cluster with streaming replication to worker host

On host  **worker** there will be a running instance of Postgres acting as a backup for cluster on central

----------


Checks
--------------------

**WebApp**
: Open your browser and type 10.10.10.3 (or https://10.10.10.3). Add self-signed certificate security exception and you should see the following on your screen:

    **Hello World!**
    Your IP Address is: 10.10.10.1 
: 10.10.10.1 is your NAT IP, which you are using to connect to virtual machine from your host
: Scheme of the request: ```Your request -> Haproxy (rewrites http to https) -> Nginx (terminates TLS) -> Tomcat (knows it's being proxied from port 443)```

**Postgres**
: Ssh to central instance and try to login to database as user *twino* using password *twino*

    *vagrant ssh central*
    *sudo -u postgres psql -h 10.10.10.3 -d twino -U twino*
 
 : Try to list users, databases etc.
 

    *\du*
    *\l*
 
 : Create new table:
        
  

    *CREATE TABLE COMPANY(*
   *ID INT PRIMARY KEY     NOT NULL,*
   *NAME           TEXT    NOT NULL,*
   *AGE            INT     NOT NULL,*
   *ADDRESS        CHAR(50),*
   *SALARY         REAL*
*);*
    
 : Login to database on **worker** host to check if our table was replicated there:
 

    *sudo -u postgres psql -h 10.10.10.2 -d twino -U twino*
    *\d company*

: If you're able to see table description, then replication is working.
    
Enjoy using this setup at will.
