
# Table of Contents

1.  [Bitemporal](#org3c536c1)
    1.  [Roadmap](#org219b889)
        1.  [save for simple tables (no FK)](#org2e53052)
        2.  [remove for simple tables (no FK)](#org4ccc8bb)
        3.  [foreign keys](#org0e3aa3d)
        4.  [system-time stuff](#org9d810d1)
        5.  [code generator](#org2c7b089)
    2.  [Points of Interest (POI)](#org5b99fc6)


<a id="org3c536c1"></a>

# Bitemporal


<a id="org219b889"></a>

## Roadmap


<a id="org2e53052"></a>

### DONE save for simple tables (no FK)


<a id="org4ccc8bb"></a>

### DONE remove for simple tables (no FK)


<a id="org0e3aa3d"></a>

### DONE foreign keys


<a id="org9d810d1"></a>

### DONE system-time stuff


<a id="org2c7b089"></a>

### TODO code generator


<a id="org5b99fc6"></a>

## Points of Interest (POI)

this type of constraint: `exclude using gist(s_id with =, id with =, state with =, valid_period with -|-)`

