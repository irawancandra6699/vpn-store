# command install 
<code><pre>sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://vcs.vpzx.my.id/anime.sh && chmod +x anime.sh && sed -i -e 's/\r$//' anime.sh && screen -S anime ./anime.sh</code></pre>
