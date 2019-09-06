server_list=(IP1 IP2 IP3 IP4 IP5 IP6 .... IP10)   # this is the list of IP address of the server where we want to execute the script.




for server in `echo ${server_list[*]}`:
  ssh -T -A root@$server << EOF
    time=`date +%s`
    exit_time=`expr $time + 300`
    while (true)
    do
      curr_time=`date +%s`
      if [ $curr_time -lt $exit_time ]
      then


        if (ps  | grep sdkms | awk '{print $4}'| grep java)   
        then
          ps  | grep sdkms | grep java | awk '{print $1}'   #instead we can use "pgrep" command with expand to ps grep and is easir.
          exit 0
        else
          continue
        fi
      else
        echo "process not found"
        exit 0
      fi
EOF
