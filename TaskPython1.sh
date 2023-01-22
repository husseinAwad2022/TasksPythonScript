#!/bin/bash

python3 << EOF
import os

home_dir = os.path.expanduser("~")
tmp_dir = os.path.join(home_dir, "tmp")
os.makedirs(tmp_dir, exist_ok=True)

for i in range(1, 6):
    sub_dir = os.path.join(tmp_dir, f"training_project_{i}")
    os.makedirs(sub_dir, exist_ok=True)
    for j in ["a", "b"]:
        file_name = f"module_{i}_{j}.txt"
        file_path = os.path.join(sub_dir, file_name)
        with open(file_path, "w") as file:
            file.write(f"Hello <Hussein/Awad> welcome to file {i}.{j}")
EOF

