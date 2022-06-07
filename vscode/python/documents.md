1. file headers
    1. click code > Preferences > User Snippets
    2. choose python.json 
    3. add 
        ```
        "File Header Description": {
		"prefix": "pyheader_notes",
		"body": [
                "#!/usr/bin/env python",
                "# -*- encoding: utf-8 -*-",
                "\"\"\"",
                "@Project : $WORKSPACE_NAME", 
                "@File    : $TM_FILENAME",
                "@Author  : db",
                "@Date    : $CURRENT_YEAR/$CURRENT_MONTH/$CURRENT_DATE $CURRENT_HOUR:$CURRENT_MINUTE:$CURRENT_SECOND", 
                "@Description : ",
                "\"\"\""
            ]
        }
        ```
2. extensions `autoDocstring - Python Docstring Generator`