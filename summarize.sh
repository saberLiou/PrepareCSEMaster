#!/bin/bash

BOOK="book.json";
SUMMARY="SUMMARY.md";

if [ ! -f $SUMMARY ]; then	# touch SUMMARY if not exist.
    touch $SUMMARY;
else
    : > $SUMMARY;   # flush SUMMARY.
fi

header="# Summary\n\n* [Introduction](INTRODUCTION.md)\n\n## Subjects\n";

content="\n";

subjects=("linear_algebra discrete_mathematics data_structure algorithm operating_system computer_organization");
for subject in ${subjects}
do
    subject_folder=".variables.${subject}";
    title=$(cat $BOOK | jq -r ${subject_folder}'.title');
    content="${content}* [${title}](${title//[[:space:]]/}/README.md)\n";

    chapters=$(cat $BOOK | jq -r ${subject_folder}' | with_entries(select(.key|match("chapter[0-9]+"))) | keys | .[]');
    for chapter in ${chapters}
    do
        chapter_folder="${subject_folder}.${chapter}";
        chapter_title=$(cat $BOOK | jq -r ${chapter_folder}'.title');

        chapter_number=${chapter:7};
        chapter_title_number=$([ ${#chapter_number} -lt 2 ] && echo "0${chapter_number}" || echo ${chapter_number});

        case ${subject} in
            "linear_algebra"|"discrete_mathematics")
                content="${content}\t* [${chapter_title}](${title//[[:space:]]/}/Chapter${chapter_title_number}/README.md)\n";

                subchapters=$(cat $BOOK | jq -r ${chapter_folder}' | with_entries(select(.key|startswith("'${chapter_number}'"))) | keys | .[]');
                for subchapter in ${subchapters}
                do
                    subchapter_folder="${chapter_folder}[\"${subchapter}\"]"
                    subchapter_title=$(cat $BOOK | jq -r ${subchapter_folder}'.title');

                    subchapter_number="$(cut -d'_' -f2 <<<${subchapter})";
                    subchapter_title_number=$([ ${#subchapter_number} -lt 2 ] && echo "0${subchapter_number}" || echo ${subchapter_number});

                    content="${content}\t\t* [${subchapter_title}](${title//[[:space:]]/}/Chapter${chapter_title_number}/${subchapter_title_number}.md)\n";
                done
                ;;
            *)  # default
                content="${content}\t* [${chapter_title}](${title//[[:space:]]/}/Chapter${chapter_title_number}.md)\n";
                ;;
        esac
    done
done

footer="\n---\n* [Author's Github](https://github.com/saberLiou)";

echo "${header}${content}${footer}\c" > $SUMMARY;