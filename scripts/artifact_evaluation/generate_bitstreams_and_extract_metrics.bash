# Generate the bitstreams for each configuration, extract static metrics
# regarding the configuration into a CSV file and pack the bitstreams
# into a ZIP.

# CD to dir of this file
cd "$(dirname "$0")"

# Generate the bitstreams
echo "-- [1/4] Generating bitstreams"
python3 ../synth/synth.py True True

# Extract metrics
echo "-- [2/4] Extracting metrics from bitstreams into cicero_confs_usage_power.CSV"
python3 ../synth/extract_usage_and_timings.py "../../builds/*" ../../bitstreams/cicero_confs_usage_power.CSV

# Pack the bitstreams
echo "-- [3/4] Packing bitstreams into cicero_ae_bitstreams.zip"
python3 ../synth/extract_bitstreams.py "../../builds/*" cicero_ae_bitstreams.zip

echo "-- [4/4] Extracting bitstreams into ../../bitstreams"
unzip -o cicero_ae_bitstreams.zip -d ../../bitstreams
