#!/usr/bin/env python3

import subprocess

subprocess.call(["python3", "TaskPython3.py", "--first_name", "value1", "--last_name", "value2", "--cap"])

import os
import argparse

# Create arguemnt parser
parser = argparse.ArgumentParser()

# Add first_name argument as mandatory
parser.add_argument("--first_name", help="first_name is mandatory", type=str, required=True)

# Add last_name argument as optional
parser.add_argument("--last_name", help="last_name is optional", type=str, default="")

# Add -cap argument for printing names in capital letters
parser.add_argument("--cap", help="Prints names in capital letters", action="store_true")

# Parse the arguments
args = parser.parse_args()

first_name = args.first_name
last_name = args.last_name
cap = args.cap

# Create a tmp dir in home dir if it doesn't exist
# Create a tmp dir in the home directory
home_dir = os.path.expanduser("~")
tmp_dir = os.path.join(home_dir, "tmp")
os.makedirs(tmp_dir, exist_ok=True)


# Create 5 sub dirs in tmp dir
for i in range(1, 6):
    sub_dir = os.path.join(tmp_dir, f"training_project_{i}")
    os.makedirs(sub_dir, exist_ok=True)

    for j in ["a", "b"]:
        file_name = f"module_{i}_{j}.txt"
        file_path = os.path.join(sub_dir, file_name)
        with open(file_path, "w") as file:
            if cap:
                file.write(f"echo “Hello {first_name.upper()} {last_name.upper()} welcome to file {i}.{j}”")
            else:
                file.write(f"echo “Hello {first_name} {last_name} welcome to file {i}.{j}”")
