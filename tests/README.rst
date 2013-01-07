Running Tests
=============

Prerequisits on Ubuntu (before running pip):

    sudo apt-get build-dep lxml
    sudo apt-get install postgresql
    sudo apt-get install postgresql-server-dev-all
    sudo apt-get install postgresql-9.1-postgis
    sudo apt-get build-dep python-psycopg2

Install the requirements:
    (sudo) pip install -r tests/requirements.txt

Change postgresql authentication type:
    sudo vi /etc/postgresql/9.1/main/pg_hba.conf
Change authentication methods from 'ident' to 'trust', or use some other more secure authentication.

In addition, create a postgres user with your OS username:
    createuser -a -d -e -U postgres <username>

And build a postgis template
    createdb template_postgis
    createlang plpgsql template_postgis 
    psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
    psql -d template_postgis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql

Run the tests:
    cd tests
    ./run_all_tests.sh

Running tox from the project diretory:
    (sudo) pip install tox
    tox