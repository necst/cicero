# Generate the bitstreams for each configuration, extract static metrics
# regarding the configuration into a CSV file and pack the bitstreams
# into a ZIP.

# CD to dir of this file
cd "$(dirname "$0")"

# Generate the bitstreams
echo "-- [1/3] Generating bitstreams"
python3 ../synth/synth.py True True

# Extract metrics
echo "-- [2/3] Extracting metrics from bitstreams into cicero_confs_usage_power.csv"
python3 ../synth/extract_usage_and_timings.py ../../builds/* cicero_confs_usage_power.csv

# Pack the bitstreams
echo "-- [3/3] Packing bitstreams into cicero_ae_bitstreams.zip"
python3 ../synth/extract_bitstreams.py ../../builds/* cicero_ae_bitstreams.zip

echo 'Done.'
echo 'Metrics extraceted in cicero_confs_usage_power.csv'
echo 'Bitstreams packed in cicero_ae_bitstreams.zip'