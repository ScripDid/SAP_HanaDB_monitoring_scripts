#!/bin/bash

error(){ 
    echo "ERREUR : invalid or missing parameters !" >&2 
    echo "Use option -h to get help" >&2
    exit 1 
}

usage(){ 
    echo "Usage: ./script.sh [options]" 
    echo -e "-s <SQL script>\tRun <SQL script>" 
}

# Missing parameters
[[ $# -lt 1 ]] && error 

while getopts ":d:s:m:n:h" option; do 
    case "$option" in 
	d) dimension=$OPTARG ;;
        s) script_path=$OPTARG ;; 
        :) error ;; # il manque une valeur ($option = 's' ici) 
        m) metric_name=$OPTARG ;;
	n) namespace=$OPTARG ;;
	u) hdbstore_user=$OPTARG ;;
        h) usage ;; 
        *) error ;;
#	\? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
#        *  ) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
    esac 
done

echo -e "Dimension=$dimension\nscrpit=$script_path\nmetric=$metric_name\nNamespace=$namespace\nValue=$value"

./hdbsql -U $hdbstore_user -I ~/hana_scripts/Get-Hana-Backup_HOURS_LAST_SUCCESSFUL_BACKUP.sql
