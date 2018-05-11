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

while getopts ":d:s:m:n:u:h" option; do 
    case "$option" in 
	d) dimension=$OPTARG ;;
        s) script_path=$OPTARG ;; 
        :) error ;; # il manque une valeur ($option = 's' ici) 
        m) metric_name=$OPTARG ;;
	n) namespace=$OPTARG ;;
	t) unit=$OPTARG ;;
	u) hdbstore_user=$OPTARG ;;
        h) usage ;; 
        *) error ;;
#	\? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
#        *  ) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
    esac 
done

result=$(./hdbsql -U $hdbstore_user -I $script_path)

value="${result##*$'\n'}"

if [ -z $unit ]; then
	unit="None"
fi

echo -e "Dimension=$dimension\nScript=$script_path\nMetric=$metric_name\nNamespace=$namespace\nValue=$value"
aws cloudwatch put-metric-data --metric-name $metric_name --namespace $namespace --unit $unit --value $value --dimensions $dimension
