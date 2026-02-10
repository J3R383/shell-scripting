#!/bin/bash
#Configuring Variables
ASSIGNMENT_NAME="Assignment_01"
BACKUP_DIR="$HOME/backups"
SUBMISSION_DIR="$HOME/submissions"

echo "---Starting organisation and backup---"

#1. Create a directory for organisation.
mkdir -p "$ASSIGNMENT_NAME"

#2. Copy files into the directory.
if [ -e "$ASSIGNMENT_NAME" ]; then
		cp "$ASSIGNMENT_NAME" "$ASSIGNMENT_NAME/"
		echo "Organised: $ASSIGNMENT_NAME"
	else
		echo "Warning: $ASSIGNMENT_NAME not found."
	fi

#3. Compress the folder.
tar -czf "${ASSIGNMENT_NAME}.tar.gz" "$ASSIGNMENT_NAME"
echo "Compressed into ${ASSIGNMENT_NAME}.tar.gz"

#4. Backup.
mkdir -p "$BACKUP_DIR"
cp "${ASSIGNMENT_NAME}.tar.gz" "$BACKUP_DIR/"
echo "Backup saved to "$BACKUP_DIR""

#5. Submit
mkdir -p "$SUBMISSION_DIR"
if cp "${ASSIGNMENT_NAME}.tar.gz" "$SUBMISSION_DIR/"; then
	echo "Submitted to $SUBMISSION_DIR"
else
	echo "Error: Submission failed. Please check path."

