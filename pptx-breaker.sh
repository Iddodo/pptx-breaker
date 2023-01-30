#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <pptx_file>"
  exit 1
fi

file="$1"
res_file="${file%.*}_CrAcKeD_WaReZ_GALIL_TEAM.pptx"
tmpdir=".tmp_$1"
xml_file="ppt/presentation.xml"
tag_name="p:modifyVerifier"

if [ ! -f "$file" ]; then
  echo "Error: file '$1' does not exist"
fi


# Check file extension
if [ "${file##*.}" != "pptx" ]; then
  echo "Error: only pptx files are supported."
  exit 1
fi


# Unzip pptx contents
echo "Create temporary directory '$tmpdir'..."
mkdir "$tmpdir"

echo "Unzipping pptx to '$tmpdir/file'..."
cp "$file" "$tmpdir/$file"
cd "$tmpdir"
unzip "$file" > /dev/null
rm "$file"

echo "Removing evil XML tag..."
# Remove read-only mechanism
#sed "s#<${tag_name}.*/>##g" "${xml_file}" > "${xml_file}.tmp"
sed "s/<$tag_name [^>]*\/>//g" "${xml_file}" > "${xml_file}.tmp"
mv "${xml_file}.tmp" "${xml_file}"


echo "Wrapping things up..."
# Zip result file
zip -r "../$res_file" . > /dev/null

# Delete temporary directory
cd ..
rm -rf "$tmpdir"

echo "Success, output file is '$res_file'."
