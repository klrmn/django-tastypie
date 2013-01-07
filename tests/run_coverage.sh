#!/bin/bash

PYTHONPATH=$PWD:$PWD/..${PYTHONPATH:+:$PYTHONPATH}
export PYTHONPATH

DJADMIN=`which django-admin.py`

coverage erase

echo '**core**'
coverage run -a $DJADMIN test core --settings=settings_core
echo '**basic**'
coverage run -a $DJADMIN test basic --settings=settings_basic
# echo '**complex**'
#coverage run -a /home/klrmn/envs/tastypie/bin/django-admin.py test complex --settings=settings_complex
echo '**alphanumeric**'
coverage run -a $DJADMIN test alphanumeric --settings=settings_alphanumeric
echo '**slashless**'
coverage run -a $DJADMIN test slashless --settings=settings_slashless
echo '**namespaced**'
coverage run -a $DJADMIN test namespaced --settings=settings_namespaced
echo '**related**'
coverage run -a $DJADMIN test related_resource --settings=settings_related
echo '**validation**'
coverage run -a $DJADMIN test validation --settings=settings_validation
echo '**gfk**'
coverage run -a $DJADMIN test content_gfk --settings=settings_content_gfk
echo '**gis**'
createdb -T template_postgis tastypie.db
coverage run -a $DJADMIN test gis --settings=settings_gis
dropdb tastypie.db

echo '***processing report***'
coverage combine
coverage html
coverage report
