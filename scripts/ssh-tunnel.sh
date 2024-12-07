while true; do 
    ssh -p1495 -ND 9999 malcolm@24.28.1.246 -i /home/malcolm/.ssh/id_ed25519; 
    sleep 10; 
done
