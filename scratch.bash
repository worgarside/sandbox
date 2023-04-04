export GITHUB_HEAD_REF="release/2.34.0"

new_release_number=$(echo $GITHUB_HEAD_REF | cut -d'/' -f2)
latest_release=$(git tag -l | grep -E "^[0-9]{1,2}\.[0-9]{1,4}\.[0-9]{1,4}\$" | sort -V | tail -1)

# Compare the new release number to the latest release and determine the release label (major, minor, patch)

if [ "${new_release_number%%.*}" != "${latest_release%%.*}" ]
then
    release_label="major"
else
    new_release_minor ="$( echo $new_release_number | cut -d '.' -f2 )"
elif [ != $( echo $latest_release | cut -d '.' -f2 ) ]
then
    release_label="minor"
elif [ "${new_release_number##*.}" != "${latest_release##*.}" ]
then
    release_label="patch"
fi





echo "new_release_number is $new_release_number"
echo "latest_release is $latest_release"
echo "release_label is $release_label"

echo $new_release_number | cut -d '.' -f2
echo $latest_release | cut -d '.' -f2 

echo $($( echo $new_release_number | cut -d '.' -f2 ) != $( echo $latest_release | cut -d '.' -f2 ))