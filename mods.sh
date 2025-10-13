#!/bin/bash -ex

sudo apt -y update
sudo apt -y install p7zip-full

function displayModInfo() {
    echo "MOD_NAME        = ${MOD_NAME}"
    echo "MOD_DESC        = ${MOD_DESC}"
    echo "MOD_AUTHOR      = ${MOD_AUTHOR}"
    echo "MOD_VERSION     = ${MOD_VERSION}"
    echo "MOD_SOURCE_DIR  = ${MOD_SOURCE_DIR}"
    echo "MOD_BUILD_DIR   = ${MOD_BUILD_DIR}"
}

function build() {
    # source in the mod specific properties
    MOD_FILE=$1
    if [[ ! -f "${MOD_FILE}" ]]; then
        echo "ERROR: Missing mod file."
        exit 1
    else
        source "${MOD_FILE}"
        displayModInfo
    fi

    # remake build dir
    if [[ -d "${MOD_BUILD_DIR}" ]]; then
        rm -rf "${MOD_BUILD_DIR}"
    fi
    mkdir -p "${MOD_BUILD_DIR}"

    # clone source dir to build dir
    cp -r -v "${MOD_SOURCE_DIR}"/* "${MOD_BUILD_DIR}/"

    # release the version number
    sed -i "s|__VERSION__|${MOD_VERSION}|" "${MOD_BUILD_DIR}/data/scripts/mods/${MOD_NAME}.lua"
    
    # create pak file of build dir data/ folder
    7z a -tzip -r -mtm=off -mtc=off -mta=off "${MOD_BUILD_DIR}/${MOD_NAME}.pak" $(find "${MOD_BUILD_DIR}/data/" -mindepth 1 -maxdepth 1)

    # delete build data/ folder
    rm -rf "${MOD_BUILD_DIR}/data"

    # move pack under data/ folder
    mkdir -p "${MOD_BUILD_DIR}/data"
    mv "${MOD_BUILD_DIR}/${MOD_NAME}.pak" "${MOD_BUILD_DIR}/data/"

    # create mod manifest file in build dir
    cat << EOF > "${MOD_BUILD_DIR}/mod.manifest"
<?xml version="1.0" encoding="utf-8"?>
<kcd_mod>
  <info>
    <name>$MOD_NAME</name>
    <description>$MOD_DESC</description>
    <author>$MOD_AUTHOR</author>
    <version>$MOD_VERSION</version>
    <created_on>$(date)</created_on>
    <dependencies></dependencies>
  </info>
</kcd_mod>
EOF

    # zip mod
    7z a -tzip -r -mtm=off -mtc=off -mta=off "./build/${MOD_NAME}-${MOD_VERSION}.zip" "${MOD_BUILD_DIR}"

    echo "Build [${MOD_NAME}] Done"
}

function install() {
    # source in the mod specific properties
    MOD_FILE=$1
    if [[ ! -f "${MOD_FILE}" ]]; then
        echo "ERROR: Missing mod file."
        exit 1
    else
        source "${MOD_FILE}"

        # source in env specific properties
        ENV_FILE="env.properties"
        if [[ ! -f "${ENV_FILE}" ]]; then
            echo "ERROR: Missing env file."
            echo "Creating env.properties file, you need to edit this file with your path to KCD2."
            echo "MOD_INSTALL_DIR=\"/mnt/d/Games/SteamLibrary/steamapps/common/KingdomComeDeliverance2/Mods\"" > env.properties
            exit 1
        else
            source "${ENV_FILE}"
        fi

        displayModInfo
        echo "MOD_INSTALL_DIR = ${MOD_INSTALL_DIR}"
    fi

    # install mod in kcd
    if [[ ! -d "${MOD_INSTALL_DIR}" ]]; then
        mkdir -p "${MOD_INSTALL_DIR}"
    fi

    if [[ -d "${MOD_INSTALL_DIR}/${MOD_NAME}" ]]; then
        rm -rf "${MOD_INSTALL_DIR}/${MOD_NAME}"
    fi

    # without sudo we get an error
    # ERROR: Cannot set file attribute : errno=1 : Operation not permitted
    sudo 7z x "./build/${MOD_NAME}-${MOD_VERSION}.zip" -o"${MOD_INSTALL_DIR}"

    echo "Install [${MOD_NAME}] Done"
}

function run() {
    # Launch KCD2
    cmd.exe /C start steam://rungameid/1771300
    exit 0
}

MODS="mods/cheat/release.properties mods/cheat-autoexec/release.properties mods/cheat-keys/release.properties mods/cheat-quest/release.properties"
COMMANDS="${1:-build install run}"

for MOD in ${MODS}; do
    for COMMAND in ${COMMANDS}; do
        "${COMMAND}" "${MOD}"
    done
done

echo "Done"