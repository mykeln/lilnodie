#!/bin/bash

# initializing npm instance
npm init

# Use Python to combine package.json and example_package.json
python3 - <<END
import json

def merge_dicts(d1, d2):
    """Merge two dictionaries."""
    merged = d1.copy()
    merged.update(d2)
    return merged

try:
    # Read package.json
    with open("package.json", "r") as f:
        package_json = json.load(f)
except json.JSONDecodeError as e:
    print(f"Error decoding package.json: {e}")
    exit(1)

try:
    # Read example_package.json
    with open("example_package.json", "r") as f:
        example_package_json = json.load(f)
except json.JSONDecodeError as e:
    print(f"Error decoding example_package.json: {e}")
    exit(1)

# Merge main dictionaries
combined_json = merge_dicts(package_json, example_package_json)

# Combine "scripts" objects
if "scripts" in package_json and "scripts" in example_package_json:
    combined_json["scripts"] = merge_dicts(package_json["scripts"], example_package_json["scripts"])

# Combine "dependencies" objects
if "dependencies" in package_json and "dependencies" in example_package_json:
    combined_json["dependencies"] = merge_dicts(package_json["dependencies"], example_package_json["dependencies"])

# Combine "devDependencies" objects
if "devDependencies" in package_json and "devDependencies" in example_package_json:
    combined_json["devDependencies"] = merge_dicts(package_json["devDependencies"], example_package_json["devDependencies"])

# Write the combined JSON to a new file
with open("combined_package.json", "w") as f:
    json.dump(combined_json, f, indent=2)
END


# renaming the merged file
cat combined_package.json > package.json
rm -rf combined_package.json

npm install
npm run build-css