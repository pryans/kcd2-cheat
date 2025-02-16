$MOD_NAME = "cheat"
$MOD_DESC = "KCD2 Cheat Mod https://www.nexusmods.com/kingdomcomedeliverance2/mods/114"
$MOD_AUTHOR = "Othiden"
$MOD_VERSION = "2.12"
$BUILD_DIR = "build"
$PROPERTIES_FILE = "release.properties"
$DEFAULT_KCD_MODS_DIR = "E:/Games/SteamLibrary/steamapps/common/KingdomComeDeliverance2/Mods"

# Check if release.properties exists, create with default if not
if (!(Test-Path -Path $PROPERTIES_FILE)) {
  Write-Warning "Warning: '$PROPERTIES_FILE' not found. Creating it with default KCD_MODS_DIR."
  New-Item -ItemType File -Path $PROPERTIES_FILE -Force | Out-Null
  @"
KCD_MODS_DIR=$DEFAULT_KCD_MODS_DIR
"@ | Set-Content -Path $PROPERTIES_FILE -Encoding UTF8
}

# Read KCD_MODS_DIR from release.properties
$Properties = Get-Content -Path $PROPERTIES_FILE | ConvertFrom-StringData
if ($Properties.KCD_MODS_DIR) {
  $KCD_MODS_DIR = $Properties.KCD_MODS_DIR
}
else {
  Write-Warning "Warning: KCD_MODS_DIR property not found in '$PROPERTIES_FILE'. Using default."
  $KCD_MODS_DIR = $DEFAULT_KCD_MODS_DIR
}
$KCD_MOD_DIR = "${KCD_MODS_DIR}/${MOD_NAME}"

# remake build/
if ( Test-Path -PathType Container "${BUILD_DIR}" ) {
  Remove-Item -LiteralPath "${BUILD_DIR}" -Force -Recurse
}
New-Item -ItemType Directory -Path "${BUILD_DIR}" -Force | Out-Null

# clone mods/ to build/
Copy-Item -Path "mods" -Destination "${BUILD_DIR}" -Recurse -Force

# replace version
(Get-Content -Path "mods/${MOD_NAME}/data/scripts/mods/cheat.lua" -Raw) -replace "__VERSION__", "${MOD_VERSION}" | Set-Content -Path "build/mods/${MOD_NAME}/data/scripts/mods/cheat.lua"

# create pak file of data/*
Compress-Archive -Force -Path "build/mods/${MOD_NAME}/data/*" -DestinationPath "build/mods/${MOD_NAME}/data/${MOD_NAME}.zip" -CompressionLevel Fastest
Rename-Item -Path "build/mods/${MOD_NAME}/data/${MOD_NAME}.zip" -NewName "${MOD_NAME}.pak"
Remove-Item -LiteralPath "build/mods/${MOD_NAME}/data/scripts" -Recurse -Force
Remove-Item -LiteralPath "build/mods/${MOD_NAME}/data/libs" -Recurse -Force

# create manifest file
@"
<?xml version="1.0" encoding="utf-8"?>
<kcd_mod>
  <info>
    <name>$MOD_NAME</name>
    <description>$MOD_DESC</description>
    <author>$MOD_AUTHOR</author>
    <version>$MOD_VERSION</version>
    <created_on>$(Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")</created_on>
    <dependencies></dependencies>
  </info>
</kcd_mod>
"@ | Out-File -FilePath "build/mods/${MOD_NAME}/mod.manifest" -Encoding UTF8

# zip mod
Compress-Archive -Force -Path "build/mods/${MOD_NAME}" -DestinationPath "build/mods/${MOD_NAME}-${MOD_VERSION}.zip" -CompressionLevel Fastest

# install mod in kcd
if ( Test-Path -PathType Container "${KCD_MOD_DIR}" ) {
  Remove-Item -LiteralPath "${KCD_MOD_DIR}" -Recurse -Force
}
Expand-Archive -Force -Path "build/mods/${MOD_NAME}-${MOD_VERSION}.zip" -DestinationPath "${KCD_MODS_DIR}"

# DONE
Write-Host "Done"