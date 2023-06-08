# Table of Contents

1.  [PostgreSQL Temporal Extension](#orga32017f)
    1.  [Roadmap](#org8d2ade6)
        1.  [save for simple tables (no FK)](#orgdd3be36)
        2.  [remove for simple tables (no FK)](#org512e618)
        3.  [foreign keys](#org778cb09)
        4.  [system-time stuff](#orgd45cf8d)
        5.  [code generator](#orgab40781)
        6.  [Points of Interest (POI)](#orgf80d1f8)


<a id="orga32017f"></a>

# PostgreSQL Temporal Extension


<a id="org8d2ade6"></a>

## Roadmap


<a id="orgdd3be36"></a>

### DONE save for simple tables (no FK)


<a id="org512e618"></a>

### DONE remove for simple tables (no FK)


<a id="org778cb09"></a>

### DONE foreign keys


<a id="orgd45cf8d"></a>

### TODO system-time stuff


<a id="orgab40781"></a>

### TODO code generator


<a id="orgf80d1f8"></a>

### Points of Interest (POI)

this type of constraint: `exclude using gist(s_id with =, id with =, state with =, valid_period with -|-) );`
