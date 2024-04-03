#!/bin/sh
set -e

# CD to dir of this file
cd "$(dirname "$0")"

RE_DOWNLOAD_DIR=regex_transform/input
mkdir -p $RE_DOWNLOAD_DIR
mkdir -p $RE_DOWNLOAD_DIR/../output

IN_DOWNLOAD_DIR=divide_input/input
mkdir -p $IN_DOWNLOAD_DIR
mkdir -p $IN_DOWNLOAD_DIR/../output


# URLs
PROTOMATA_RE=https://github.com/tjt7a/AutomataZoo/raw/master/Protomata/code/protomata_noslash.regex
PROTOMATA_IN=https://github.com/tjt7a/AutomataZoo/raw/master/Protomata/benchmarks/inputs/30k_prots.input

BRILL_RE=https://raw.githubusercontent.com/tjt7a/AutomataZoo/master/Brill/code/regex.txt
BRILL_IN=https://github.com/tjt7a/AutomataZoo/raw/master/Brill/code/input.txt

# download
wget -O $RE_DOWNLOAD_DIR/protomata.regex $PROTOMATA_RE
wget -O $IN_DOWNLOAD_DIR/protomata.input $PROTOMATA_IN
wget -O $RE_DOWNLOAD_DIR/brill.regex $BRILL_RE
wget -O $IN_DOWNLOAD_DIR/brill.input $BRILL_IN

# Preprocess RE
python3 regex_transform/script.py $RE_DOWNLOAD_DIR/protomata.regex $RE_DOWNLOAD_DIR/../output/protomata.regex
python3 regex_transform/for_brill.py $RE_DOWNLOAD_DIR/brill.regex $RE_DOWNLOAD_DIR/../output/brill.regex

# Generate the "4" version of the regexes
mkdir -p alternate_regexes/output/
python3 alternate_regexes/script.py $RE_DOWNLOAD_DIR/../output/protomata.regex alternate_regexes/output/protomata4.regex 200 4
python3 alternate_regexes/script.py $RE_DOWNLOAD_DIR/../output/brill.regex alternate_regexes/output/brill4.regex 200 4

# Preprocess IN
mkdir -p $IN_DOWNLOAD_DIR/../output/
python3 divide_input/script.py $IN_DOWNLOAD_DIR/protomata.input $IN_DOWNLOAD_DIR/../output/protomata.input 500 500
python3 divide_input/script.py $IN_DOWNLOAD_DIR/brill.input $IN_DOWNLOAD_DIR/../output/brill.input 500 500


# Output the paths to the files
echo "List of files downloaded and preprocessed:"
echo "--- Regexes ---"
echo "regex_transform/output/protomata.regex"
echo "regex_transform/output/brill.regex"
echo "alternate_regexes/output/protomata4.regex"
echo "alternate_regexes/output/brill4.regex"
echo "--- Inputs ---"
echo "divide_input/output/protomata.input"
echo "divide_input/output/brill.input"