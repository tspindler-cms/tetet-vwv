for png in *png
do
  dds=$(basename "$png" .png).dds
  /mnt/c/Program\ Files/NVIDIA\ Corporation/NVIDIA\ Texture\ Tools/nvtt_export.exe "$png" -o "$dds" -f bc7
done
