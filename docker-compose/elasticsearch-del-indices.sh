#!/bin/bash
# Use for elastic storage space manager

ll() {
	curl -u elastic:Kv9brHjotk3s -s -XGET http://localhost:9200/_cat/indices?v | awk 'NR>1{print $3}'
}

ls() {
	curl -u elastic:Kv9brHjotk3s -XGET http://localhost:9200/_cat/indices?v
}

echo '''
please input usage:
"ll" for list current indices
"ls" for list current specific indices'''
while true;do
    
    read -p "> " INPUT
    
    case ${INPUT} in 
    	ll)
    	    ll
    	    break;
    	;;
        ls)
    	    ls
    	    break;
    	;;
    	*)
    	    echo "wrong input, please retry."
    	;;
    esac
done
