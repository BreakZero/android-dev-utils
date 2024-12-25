#!/bin/bash

# 设置默认的 properties 文件路径
DEFAULT_PROPERTIES_FILE="./config.properties"

if [ "$#" -eq 2 ]; then
    PROPERTIES_FILE=$DEFAULT_PROPERTIES_FILE
    KEY=$1
    VALUE=$2
else
    PROPERTIES_FILE=$1
    KEY=$2
    VALUE=$3
fi

# 检查参数个数
if [ -z "$KEY" ] || [ -z "$VALUE" ]; then
    echo "Usage: $0 [<properties_file>] <key> <value>"
    exit 1
fi

# 检查文件是否存在
if [ ! -f "$PROPERTIES_FILE" ]; then
    echo "Error: File '$PROPERTIES_FILE' does not exist."
    exit 1
fi

if [[ "$VALUE" =~ ^https?:// ]]; then
    VALUE=$(echo "$VALUE" | sed 's/[&/\]/\\&/g')
fi

if grep -q "^$KEY=" "$PROPERTIES_FILE"; then
    # Replace if exist
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS:  -i ''
        sed -i '' "s/^$KEY=.*/$KEY=$VALUE/" "$PROPERTIES_FILE"
    else
        # Linux: -i
        sed -i "s/^$KEY=.*/$KEY=$VALUE/" "$PROPERTIES_FILE"
    fi
    echo "Updated $KEY in $PROPERTIES_FILE"
else
    # Added if not exist
    echo "$KEY=$VALUE" >> "$PROPERTIES_FILE"
    echo "Added $KEY=$VALUE to $PROPERTIES_FILE"
fi
