
if [ -f /opt/miniconda3/etc/profile.d/conda.sh ];then
    source /opt/miniconda3/etc/profile.d/conda.sh
else
    echo "Make sure miniconda is installed."
fi
