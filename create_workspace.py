import json
import optparse
from pathlib import Path

SOURCE_PATH = 'lua_defs'
WORKSPACE_PATH = 'kcd2-cheat.code-workspace'

def create_workspace_data(source_path, source_is_library):
    workspace = {
	"folders": [
		{
			"path": "."
		}
	],
	"settings": {
		"powershell.cwd": "kcd2-cheat",
		"Lua.diagnostics.libraryFiles": "Disable",
		"Lua.runtime.plugin": ""
	}
    }
    if source_is_library:
        workspace["settings"]["Lua.workspace.library"] = [source_path]
    else:
        workspace["folders"].append(source_path)
    
    return workspace

def create_workspace(source_path=SOURCE_PATH, workspace_path=WORKSPACE_PATH, source_is_library=True):
    if source_is_library is None:
        source_is_library = True
    workspace_data = create_workspace_data(str(Path(source_path).absolute()), source_is_library)
    with open(workspace_path,'w') as file:
        json.dump(workspace_data, file)


def main():
    parser = optparse.OptionParser()
    parser.add_option('-l', dest='source_is_library', action='store_true')
    parser.add_option('-f', dest='source_is_library', action='store_false')
    opts, args = parser.parse_args()
    create_workspace(*args, source_is_library=opts.source_is_library)

if __name__ == "__main__":
    main()
