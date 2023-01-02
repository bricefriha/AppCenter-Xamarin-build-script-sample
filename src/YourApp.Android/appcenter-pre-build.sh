#!/usr/bin/env bash
# AN IMPORTANT THING: FOR THIS SAMPLE YOU NEED DECLARE SECRET ENVIRONMENT VARIABLE IN APP CENTER BUILD CONFIGURATION.
echo "Launching ios pre-build script"
if [ -z "$SECRET" ]
then
    echo "You need define the SECRET variable in App Center"
    exit
fi

APP_CONSTANT_FILE=$APPCENTER_SOURCE_DIRECTORY/YourApp/YourApp/Config/AppConstant.cs

if [ -e "$APP_CONSTANT_FILE" ]
then
    echo "Updating AppConstant.cs"
    echo "---"
    echo "ClientSecret = "$Secret
    sed -i '' 's#Secret = Environment.GetEnvironmentVariable("Secret")#Secret = "'$SECRET'"#g' $APP_CONSTANT_FILE

    echo "File content:"
    cat $APP_CONSTANT_FILE
else
    echo "Incorrect file: "$APP_CONSTANT_FILE
    exit
fi
