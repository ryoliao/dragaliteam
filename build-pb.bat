@echo off
SET PROJ_DIR=%~dp0
SET PROTO_DIR=%PROJ_DIR%protobuf\
SET OUT_DIR=%PROJ_DIR%lib\proto\
protoc -I=%PROTO_DIR% --dart_out=%OUT_DIR% %PROTO_DIR%*.proto