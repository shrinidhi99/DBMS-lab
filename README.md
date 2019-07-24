# DBMS-lab


__Lab programs done in DBMS lab__


`Semester V Lab Course`


>MySQL is the language used to design, manipulate database and for any query.
---------------------------------------------------------------------------
### Step 1 - Installing MySQL
```java

    sudo apt-get update
    sudo apt-get install mysql-server
```

### Step 2 — Configuring MySQL
```java
    mysql_secure_installation

```
### Step 3 — Testing MySQL
```java
    systemctl status mysql.service
```
>If MySQL isn't running, you can start it with `sudo systemctl start mysql`.

### Finally
```java
    mysqladmin -p -u root version
    or
    mysql -u root -p` if you are in root directory
    or
    sudo mysql -u root -p
```
