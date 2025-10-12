#!/bin/bash -ex

./build.sh

function releaseMod() {
    # source in the mod specific properties
    MOD_FILE=$1
    if [[ ! -f "${MOD_FILE}" ]]; then
        echo "ERROR: Missing mod file."
        exit 1
    else
        source "${MOD_FILE}"
    fi

    # source in env specific properties
    ENV_FILE=$2
    if [[ ! -f "${ENV_FILE}" ]]; then
        echo "ERROR: Missing env file."
        echo "Creating env.properties file, you need to edit this file with your path to KCD2."
        echo "MOD_INSTALL_DIR=\"/mnt/e/Games/SteamLibrary/steamapps/common/KingdomComeDeliverance2/Mods\"" > env.properties
        exit 1
    else
        source "${ENV_FILE}"
    fi

    echo "MOD_NAME        = ${MOD_NAME}"
    echo "MOD_VERSION     = ${MOD_VERSION}"
    echo "MOD_BUILD_DIR   = ${MOD_BUILD_DIR}"
    echo "MOD_INSTALL_DIR = ${MOD_INSTALL_DIR}"

    if [[ ! -d "${MOD_BUILD_DIR}" ]]; then
	echo "${MOD_BUILD_DIR} doesn't exist"
	exit 1
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

    echo "Release [${MOD_NAME}] Done"
}

releaseMod mods/cheat/release.properties env.properties
releaseMod mods/cheat-autoexec/release.properties env.properties
releaseMod mods/cheat-keys/release.properties env.properties
releaseMod mods/cheat-quest/release.properties env.properties

# Launch KCD2
cmd.exe /C start steam://rungameid/1771300

echo "Done"