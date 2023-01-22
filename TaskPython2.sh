#!/bin/bash

python3 << EOF
import os

os.environ['FIRST_NAME'] = 'Hussein'
os.environ['LAST_NAME'] = 'Awad'
# Get first name and last name from environment variables
first_name = os.environ.get("FIRST_NAME")
last_name = os.environ.get("LAST_NAME")

# Create a tmp dir in the home directory
home_dir = os.path.expanduser("~")
tmp_dir = os.path.join(home_dir, "tmp")
os.makedirs(tmp_dir, exist_ok=True)

# Create 5 subdirectories in tmp
for i in range(1, 6):
    sub_dir = os.path.join(tmp_dir, f"training_project_{i}")
    os.makedirs(sub_dir, exist_ok=True)
    
    for j in ["a", "b"]:
        file_name = f"module_{i}_{j}.txt"
        file_path = os.path.join(sub_dir, file_name)
        with open(file_path, "w") as file:
            file.write(f"echo “Hello {first_name} {last_name} welcome to file {i}.{j}”")
EOF
