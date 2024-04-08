#!/bin/bash

# Navigate to the root directory of your Maven project
cd /home/rsf2p/eclipse-workspace/Runescape

# Generate the HTML header
cat << EOF > project_structure.html
<!DOCTYPE html>
<html>
<head>
  <title>Project Structure</title>
  <style>
    body {
        font-family: Arial, sans-serif;
    }
    .directory {
        margin-left: 20px;
    }
    .file {
        margin-left: 40px;
    }
  </style>
</head>
<body>
<h1>Project Structure</h1>
<ul>
EOF

# Function to recursively print file structure
print_structure() {
    local path="$1"
    local indent="$2"

    # Iterate through files and directories
    for item in "$path"/*; do
        local name=$(basename "$item")

        # Check if it's a directory
        if [ -d "$item" ]; then
            echo "$indent<li class='directory'>$name</li>" >> project_structure.html
            # Recursively call the function for subdirectories
            print_structure "$item" "$indent&nbsp;&nbsp;"
        else
            echo "$indent<li class='file'>$name</li>" >> project_structure.html
        fi
    done
}

# Call function to print structure starting from the root directory
print_structure . ""

# Close HTML tags
echo "</ul></body></html>" >> project_structure.html

echo "HTML file 'project_structure.html' generated successfully."
