#!/bin/bash

#git clone https://github.com/MSWSS-EOSC/DataVerse_plugin

GALAXY_DIRECTORY="/home/export/galaxy-central"
MSWSS_DIRECTORY="${GALAXY_DIRECTORY}/tools_mswss"
PLUGIN_DIRECTORY="${MSWSS_DIRECTORY}/dataverse"

mkdir $PLUGIN_DIRECTORY


#sudo apt install xmlstarlet
#xmlstarlet ed --inplace -s '//toolbox' -t elem -n section -v " " -a //section -t attr -n id -v "dataverse" -a //section -t attr -n name -v "DataVerse plugin" -a //toolbox -t elem -n tool -a /tool -t attr -n file -v "dataverse/dataverse_download.xml" -m /tool /toolbox/section -a //toolbox -t elem -n tool -a /tool -t attr -n file -v "dataverse/dataverse_upload.xml" -m /tool /toolbox/section ${GALAXY_DIRECTORY}/config/tool_conf.xml

/home/export/galaxy_venv/bin/pip install pyDataverse


mv  -v ./source/* $PLUGIN_DIRECTORY/
chmod u=rwx,g=rwx,o=rwx -R $PLUGIN_DIRECTORY/

#echo 'tool_config_file: tool_conf.xml' >> ${GALAXY_DIRECTORY}/config/galaxy.yml
#echo 'library_import_dir: /home/export/ftp' >> ${GALAXY_DIRECTORY}/config/galaxy.yml

#docker restart galaxy
docker exec galaxy supervisorctl restart galaxy:
