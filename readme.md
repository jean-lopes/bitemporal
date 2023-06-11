
# Table of Contents

1.  [Bitemporal](#org361bf34)
    1.  [Roadmap](#orga029d02)
        1.  [save for simple tables (no FK)](#org07c3230)
        2.  [remove for simple tables (no FK)](#orgbf18f9a)
        3.  [foreign keys](#org10e238a)
        4.  [system-time stuff](#org481adf4)
        5.  [code generator](#org87ef34e)
    2.  [Points of Interest (POI)](#orgb46c144)


<a id="org361bf34"></a>

# Bitemporal


<a id="orga029d02"></a>

## Roadmap


<a id="org07c3230"></a>

### DONE save for simple tables (no FK)


<a id="orgbf18f9a"></a>

### DONE remove for simple tables (no FK)


<a id="org10e238a"></a>

### DONE foreign keys


<a id="org481adf4"></a>

### DONE system-time stuff


<a id="org87ef34e"></a>

### TODO code generator

1.  TODO bitemporal.diagnostics

    1.  TODO list bitemporal tables
    
    2.  TODO list ignored tables with reason
    
    3.  TODO list bitemporal tables missing exclude constraints

2.  TODO bitemporal.ignore<sub>tables</sub>(regclass): exclude this tables from code generation

3.  TODO system-time procedures

4.  TODO system-time triggers

5.  TODO valid-time triggers

6.  TODO valid-time procedures


<a id="orgb46c144"></a>

## Points of Interest (POI)

this type of constraint: `exclude using gist(s_id with =, id with =, state with =, valid_period with -|-)`

<https://www.postgresql.org/docs/current/rangetypes.html>

<https://www.postgresql.org/docs/current/sql-createfunction.html>

-   leakproof
-   parallel, on non integer ranges it seems we can do parallel functions

