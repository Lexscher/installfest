# Don't ask questions
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y mailutils

Subject="Log Report"
Receipients="phlco@ga.co"
Message_Success="Done"
Path_Log_file="$HOME/.wdi/install.log"

{ echo -e "$Message_Success\n\n" ; cat $Path_Log_file ; } | mail -s "$Subject" "$Recipients"

# FIXME (phlco) this reports broken pipe
# run exec $SHELL at end?
# atom . doesn't work.
# subl . works
