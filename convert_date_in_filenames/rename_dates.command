#!/usr/bin/env python3

# Copy this script in the same folder with the files to rename
# From Finder, just double click on the script to run it

import os
import re
import shutil
from datetime import datetime

# Define month mapping for 3 or 4 letter month names
month_map = {
    'sep': '09', 'sept': '09',
    'oct': '10', 'octo': '10',
    'nov': '11', 'nove': '11',
    'dec': '12', 'dece': '12',
    'jan': '01', 'janu': '01',
    'feb': '02', 'febr': '02',
    'mar': '03', 'marc': '03',
    'apr': '04', 'apri': '04',
    'may': '05',
    'jun': '06', 'june': '06',
    'jul': '07', 'july': '07',
    'aug': '08', 'augu': '08'
}

# Get the directory of the script
script_dir = os.path.dirname(os.path.abspath(__file__))

# Create 'orig' subfolder if it doesn't exist
orig_dir = os.path.join(script_dir, 'orig')
os.makedirs(orig_dir, exist_ok=True)

# Regular expression to match files like "xxxxxxx Sept 2023.pdf" or "xxxxxxx Sep 2023.pdf"
pattern = re.compile(r'(.+?)\s+(jan|janu|feb|febr|mar|marc|apr|apri|may|jun|june|jul|july|aug|augu|sep|sept|oct|octo|nov|nove|dec|dece)\s+(\d{4})\.pdf$', re.IGNORECASE)

# Iterate through files in the script's directory
for filename in os.listdir(script_dir):
    match = pattern.match(filename)
    if match:
        prefix, month, year = match.groups()
        month_key = month.lower()
        
        # Get the month number from the mapping
        if month_key in month_map:
            new_name = f"{prefix.strip()} {year}-{month_map[month_key]}.pdf"
            original_path = os.path.join(script_dir, filename)
            new_path = os.path.join(script_dir, new_name)
            orig_path = os.path.join(orig_dir, filename)
            
            # Create a copy with the new name
            shutil.copy2(original_path, new_path)
            
            # Move the original file to the 'orig' subfolder
            shutil.move(original_path, orig_path)
            print(f"Processed: {filename} -> {new_name}, original moved to 'orig'")
        else:
            print(f"Month not recognized in: {filename}")

print("Renaming complete.")