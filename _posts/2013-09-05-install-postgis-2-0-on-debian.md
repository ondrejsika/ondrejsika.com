---
layout: post
title:  "Install PostGIS 2.0 on Debian"
date:   2013-09-05 00:00:00
categories: blog

lang: EN
---

### Install DEB package depences

``` bash
sudo apt-get install build-essential postgresql-9.1 postgresql-server-dev-9.1 libxml2-dev libproj-dev libjson0-dev xsltproc docbook-xsl docbook-mathml libgdal-dev
```


### Install GEOS

``` bash
wget http://download.osgeo.org/geos/geos-3.3.8.tar.bz2
tar xvfj geos-3.3.8.tar.bz2
cd geos-3.3.8
./configure
make
sudo make install
cd ..
```

### Install PostGIS

``` bash
wget http://download.osgeo.org/postgis/source/postgis-2.0.3.tar.gz
tar xfvz postgis-2.0.3.tar.gz
cd postgis-2.0.3

./configure
make
sudo make install
sudo ldconfig
sudo make comments-install

sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/shp2pgsql
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/pgsql2shp
sudo ln -sf /usr/share/postgresql-common/pg_wrapper /usr/local/bin/raster2pgsql
```

### Build PostGIS template

``` bash
sudo su postgres

createdb template_postgis
createlang plpgsql template_postgis

psql -d template_postgis -c "UPDATE pg_database SET datistemplate=true WHERE datname='template_postgis'"
psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql
psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis_comments.sql

psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/rtpostgis.sql
psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/raster_comments.sql

psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/topology.sql
psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-2.0/topology_comments.sql
```

Source <http://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS20Debian60src?format=txt>
