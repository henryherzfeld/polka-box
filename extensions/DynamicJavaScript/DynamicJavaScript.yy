{
    "id": "4471a41f-3eb9-46c6-a697-5bd13e1bad12",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "DynamicJavaScript",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 32,
    "date": "2020-03-26 02:01:02",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "71cdb86c-5bf6-4237-ad40-3e55d94c46a7",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "djs.js",
            "final": "",
            "functions": [
                {
                    "id": "02216e66-e1ed-43f5-ab5a-3522b2a2c8ff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "dj_init",
                    "help": "dj_init() : Initializes extension and wipes currently stored functions",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_init",
                    "returnType": 2
                },
                {
                    "id": "fd79431a-2acc-4875-9d03-c30b6e01f30c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "dj_add",
                    "help": "dj_add(index, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add",
                    "returnType": 2
                },
                {
                    "id": "6ef39057-934f-49af-8065-db04cd7e74b2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "dj_call",
                    "help": "dj_call(index) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call",
                    "returnType": 2
                },
                {
                    "id": "fc0af1f5-c915-44d0-8da3-3e4662118ee6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "dj_exists",
                    "help": "dj_exists(index) : Returns if function with given index exists",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_exists",
                    "returnType": 2
                },
                {
                    "id": "e9885651-c0e0-4ef9-9257-af8dc45172a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "dj_count",
                    "help": "dj_count() : Returns total number of functions loaded",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_count",
                    "returnType": 2
                },
                {
                    "id": "908f2aed-263d-4972-a764-bd09ae96f2d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add1",
                    "help": "dj_add1(index, a1, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add1",
                    "returnType": 2
                },
                {
                    "id": "d3e70d32-52d1-4580-8dfc-fb3f372a3a33",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "dj_call1",
                    "help": "dj_call1(index, a1) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call1",
                    "returnType": 2
                },
                {
                    "id": "1daf7216-b771-4a63-9511-88e6c666f794",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add2",
                    "help": "dj_add2(index, a1, a2, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add2",
                    "returnType": 2
                },
                {
                    "id": "35cd2dec-7651-4406-927a-f3247172f98e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call2",
                    "help": "dj_call2(index, a1, a2) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call2",
                    "returnType": 2
                },
                {
                    "id": "ea7bb621-be3f-43c9-940d-59ea1c046093",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add3",
                    "help": "dj_add3(index, a1, a2, a3, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add3",
                    "returnType": 2
                },
                {
                    "id": "e88acda7-4d20-4917-952a-fe7586a6bb0c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call3",
                    "help": "dj_call3(index, a1, a2, a3) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call3",
                    "returnType": 2
                },
                {
                    "id": "81a75cb0-3d79-4862-9db9-db7cc37f5353",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 6,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add4",
                    "help": "dj_add4(index, a1, a2, a3, a4, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add4",
                    "returnType": 2
                },
                {
                    "id": "dfedefd9-6f42-4b66-9dfb-dee1f8272561",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call4",
                    "help": "dj_call4(index, a1, a2, a3, a4) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call4",
                    "returnType": 2
                },
                {
                    "id": "c7d9fd6a-db33-46d2-8a34-427f5e30bd07",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 7,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add5",
                    "help": "dj_add5(index, a1, a2, a3, a4, a5, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add5",
                    "returnType": 2
                },
                {
                    "id": "7826c582-53bf-4ba7-ba62-05c0203be094",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 6,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call5",
                    "help": "dj_call5(index, a1, a2, a3, a4, a5) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call5",
                    "returnType": 2
                },
                {
                    "id": "aaaf34d0-9663-438e-b771-b7fea56a72bb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 8,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add6",
                    "help": "dj_add6(index, a1, a2, a3, a4, a5, a6, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add6",
                    "returnType": 2
                },
                {
                    "id": "27857fcb-c856-45ed-88b2-453abeb7b49c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 7,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call6",
                    "help": "dj_call6(index, a1, a2, a3, a4, a5, a6) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call6",
                    "returnType": 2
                },
                {
                    "id": "0c42487e-1950-441b-8873-cedc8dbb5fc4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 9,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add7",
                    "help": "dj_add7(index, a1, a2, a3, a4, a5, a6, a7, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add7",
                    "returnType": 2
                },
                {
                    "id": "f02e4013-f1bb-4ec0-ba9f-1d40d6ed31a3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 8,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call7",
                    "help": "dj_call7(index, a1, a2, a3, a4, a5, a6, a7) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call7",
                    "returnType": 2
                },
                {
                    "id": "2467d9a5-ad42-4d4e-ba7f-7fefb4a6098f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 10,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add8",
                    "help": "dj_add8(index, a1, a2, a3, a4, a5, a6, a7, a8, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add8",
                    "returnType": 2
                },
                {
                    "id": "84040b0a-8115-40f1-888d-8d1c8d503907",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 9,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call8",
                    "help": "dj_call8(index, a1, a2, a3, a4, a5, a6, a7, a8) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call8",
                    "returnType": 2
                },
                {
                    "id": "3653891d-4f1d-40fe-b12e-38f25ccb2f22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 11,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add9",
                    "help": "dj_add9(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add9",
                    "returnType": 2
                },
                {
                    "id": "000c8d21-582c-43cb-b89a-49ccfa582d17",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 10,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call9",
                    "help": "dj_call9(index, a1, a2, a3, a4, a5, a6, a7, a8, a9) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call9",
                    "returnType": 2
                },
                {
                    "id": "592904e0-f4d9-4d7c-9773-b4c2dea307dd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 12,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add10",
                    "help": "dj_add10(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add10",
                    "returnType": 2
                },
                {
                    "id": "ddd0c37c-4147-4fba-9d56-5af47e127f99",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 11,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call10",
                    "help": "dj_call10(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call10",
                    "returnType": 2
                },
                {
                    "id": "c4294b58-4f9a-4764-b61b-50f87732b63b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 13,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add11",
                    "help": "dj_add11(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add11",
                    "returnType": 2
                },
                {
                    "id": "7c918b78-5be1-4e0d-bb21-6ef10da62881",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 12,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call11",
                    "help": "dj_call11(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call11",
                    "returnType": 2
                },
                {
                    "id": "699a8bde-9ae7-430f-b4b9-6dc59798635f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 14,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add12",
                    "help": "dj_add12(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add12",
                    "returnType": 2
                },
                {
                    "id": "67a505da-b0a2-4065-be31-7f8395b0c4cf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 13,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call12",
                    "help": "dj_call12(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call12",
                    "returnType": 2
                },
                {
                    "id": "32fc7b7a-ecd4-4d39-84f9-5c08dd1ff9bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 15,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add13",
                    "help": "dj_add13(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add13",
                    "returnType": 2
                },
                {
                    "id": "b7016241-eeea-49e9-b90f-2820a4d6a848",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 14,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call13",
                    "help": "dj_call13(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call13",
                    "returnType": 2
                },
                {
                    "id": "dd16b2db-39bc-42ae-a299-d6ae37387d5e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 16,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_add14",
                    "help": "dj_add14(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_add14",
                    "returnType": 2
                },
                {
                    "id": "956b259a-d01b-4bb3-aa93-ca9b01cce7c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 15,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "dj_call14",
                    "help": "dj_call14(index, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_call14",
                    "returnType": 2
                },
                {
                    "id": "1f55eeb3-8862-493f-9494-f11d856670df",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "dj_run",
                    "help": "dj_run(code) : Executes piece of code without storing it anywhere",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_run",
                    "returnType": 2
                },
                {
                    "id": "2759b137-e008-41d1-b4fe-5d9bd1a61788",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "dj_run",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "js",
                    "returnType": 2
                },
                {
                    "id": "7a927cf2-0e89-448d-b152-bece34bbd566",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "dj_var_def",
                    "help": "dj_var_def(expr, name)",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_var_def",
                    "returnType": 2
                },
                {
                    "id": "878ee27a-251d-42db-b12b-d4442f5f4d17",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "dj_var_set",
                    "help": "dj_var_set(name, value)",
                    "hidden": false,
                    "kind": 11,
                    "name": "dj_var_set",
                    "returnType": 2
                },
                {
                    "id": "7f1f81e1-eeb2-44a4-a322-adfa0f02effc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "dji",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "dji",
                    "returnType": 2
                }
            ],
            "init": "dj_init",
            "kind": 5,
            "order": [
                
            ],
            "origname": "extensions\\djs.js",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": 32,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}