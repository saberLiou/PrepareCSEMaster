#!/bin/bash/env bash

echo "Use GNU bash, version ${BASH_VERSION} in ${BASH} to execute the script.";

BOOK="book.json";
ROOT_PWD=".variables";
SUMMARY="SUMMARY.md";
UNDER_CONSTRUCTION_STUB="{% hint style='danger' %}\n### Under Construction. 趕工中...\n{% endhint %}";

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
    subject_json_pwd=".${subject}";
    title=$(cat $BOOK | jq -r ${ROOT_PWD}${subject_json_pwd}'.title');

    subject_readme_md_file="${title//[[:space:]]/}/README.md";
    if [ ! -f $subject_readme_md_file ]; then	# touch subject_readme_md_file if not exist.
        touch $subject_readme_md_file;
    else
        : > $subject_readme_md_file;   # flush subject_readme_md_file.
    fi
    subject_readme="# {{ book${subject_json_pwd}.title }}\n<!-- notoc -->\n\n";

    content="${content}* [${title}](${subject_readme_md_file})\n";

    chapters=$(cat $BOOK | jq -r ${ROOT_PWD}${subject_json_pwd}' | with_entries(select(.key|match("chapter[0-9]+"))) | keys | .[]');
    if [ ${#chapters} -eq 0 ]; then
        subject_readme="${subject_readme}${UNDER_CONSTRUCTION_STUB}\n";
    else
        for chapter in ${chapters}
        do
            chapter_json_pwd="${subject_json_pwd}.${chapter}";
            chapter_title=$(cat $BOOK | jq -r ${ROOT_PWD}${chapter_json_pwd}'.title');

            chapter_number=${chapter:7};
            chapter_title_number=$([ ${#chapter_number} -lt 2 ] && echo -e "0${chapter_number}" || echo -e ${chapter_number});

            case ${subject} in
                "linear_algebra"|"discrete_mathematics")
                    subject_readme="${subject_readme}[{{ book${chapter_json_pwd}.title }}](Chapter${chapter_title_number}/README.md)  \n";

                    chapter_folder="${title//[[:space:]]/}/Chapter${chapter_title_number}";
                    if [ ! -d $chapter_folder ]; then   # mkdir chapter_folder if not exist.
                        mkdir $chapter_folder;
                    fi

                    chapter_readme_md_file="${chapter_folder}/README.md";
                    if [ ! -f $chapter_readme_md_file ]; then	# touch chapter_readme_md_file if not exist.
                        touch $chapter_readme_md_file;
                    else
                        : > $chapter_readme_md_file;   # flush chapter_readme_md_file.
                    fi

                    chapter_readme="# {{ book${chapter_json_pwd}.title }}\n<!-- notoc -->\n\n";

                    content="${content}\t* [${chapter_title}](${title//[[:space:]]/}/Chapter${chapter_title_number}/README.md)\n";

                    subchapters=$(cat $BOOK | jq -r ${ROOT_PWD}${chapter_json_pwd}' | with_entries(select(.key|startswith("'${chapter_number}'"))) | keys | .[]');
                    if [ ${#subchapters} -eq 0 ]; then
                        chapter_readme="${chapter_readme}${UNDER_CONSTRUCTION_STUB}\n";
                    else
                        for subchapter in ${subchapters}
                        do
                            subchapter_json_pwd="${chapter_json_pwd}[\"${subchapter}\"]"
                            subchapter_title=$(cat $BOOK | jq -r ${ROOT_PWD}${subchapter_json_pwd}'.title');

                            subchapter_number="$(cut -d'_' -f2 <<<${subchapter})";
                            subchapter_title_number=$([ ${#subchapter_number} -lt 2 ] && echo -e "0${subchapter_number}" || echo -e ${subchapter_number});

                            chapter_readme="${chapter_readme}[{{ book${chapter_json_pwd}.${subchapter}.title }}](${subchapter_title_number}.md)  \n";

                            md_file="${title//[[:space:]]/}/Chapter${chapter_title_number}/${subchapter_title_number}.md";
                            if [ ! -f $md_file ]; then	# touch markdown if not exist.
                                touch $md_file;
                                echo -e "# {{ book${chapter_json_pwd}.${subchapter}.title }}\n<!-- notoc -->\n\n${UNDER_CONSTRUCTION_STUB}\c" > $md_file;
                            fi

                            content="${content}\t\t* [${subchapter_title}](${title//[[:space:]]/}/Chapter${chapter_title_number}/${subchapter_title_number}.md)\n";
                        done
                    fi
                    
                    echo -e "${chapter_readme}\c" > $chapter_readme_md_file;
                    printf %s "$(cat ${chapter_readme_md_file})" > ${chapter_readme_md_file};   # remove last '\n' of the file.
                    ;;
                *)  # default
                    subject_readme="${subject_readme}[{{ book${chapter_json_pwd}.title }}](Chapter${chapter_title_number}.md)  \n";

                    md_file="${title//[[:space:]]/}/Chapter${chapter_title_number}.md";
                    if [ ! -f $md_file ]; then	# touch markdown if not exist.
                        touch $md_file;
                        echo -e "# {{ book${chapter_json_pwd}.title }}\n<!-- notoc -->\n\n${UNDER_CONSTRUCTION_STUB}\c" > $md_file;
                    fi

                    content="${content}\t* [${chapter_title}](${md_file})\n";
                    ;;
            esac
        done
    fi

    echo -e "${subject_readme}\c" > $subject_readme_md_file;
    printf %s "$(cat ${subject_readme_md_file})" > ${subject_readme_md_file};   # remove last '\n' of the file.
done

footer="\n---\n* [Author's Github](https://github.com/saberLiou)";

echo -e "${header}${content}${footer}\c" > $SUMMARY;