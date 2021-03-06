REM -- BOOST ENVIRONMENT VARIABLES --
set BOOST_INCLUDE=D:\Dvlp\_Libs\Boost\1_57\include
set BOOST_LIB=D:\Dvlp\_Libs\Boost\1_57\lib_shared
set BOOST_LIB_SERIALIZATION_DEBUG=boost_serialization-vc100-mt-gd-1_57
set BOOST_LIB_SERIALIZATION_RELEASE=boost_serialization-vc100-mt-1_57
set BOOST_LIB_WIDE_SERIALIZATION_DEBUG=boost_wserialization-vc100-mt-gd-1_57
set BOOST_LIB_WIDE_SERIALIZATION_RELEASE=boost_wserialization-vc100-mt-1_57
REM -- LOAD MSVC ENVIRONMENT VARIABLES --
CALL "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86
SET CL=/MP
CD "..\"
REM -- BUILD QXORM LIBRARY --
msbuild ".\QxOrm.sln" /p:Configuration=Release /t:build /nologo /v:detailed
IF NOT EXIST ".\lib\QxOrm.dll" GOTO END
REM -- BUILD TEST DLL SAMPLE --
msbuild ".\test\qxDllSample\test.sln" /p:Configuration=Release /t:build /nologo /v:detailed
IF NOT EXIST ".\test\_bin\exe.exe" GOTO END
REM -- BUILD TEST QXBLOG --
msbuild ".\test\qxBlog\qxBlog.sln" /p:Configuration=Release /t:build /nologo /v:detailed
IF NOT EXIST ".\test\_bin\qxBlog.exe" GOTO END
REM -- BUILD TEST QXBLOG COMPOSITE KEY --
msbuild ".\test\qxBlogCompositeKey\qxBlog.sln" /p:Configuration=Release /t:build /nologo /v:detailed
IF NOT EXIST ".\test\_bin\qxBlogCompositeKey.exe" GOTO END
REM -- BUILD TEST QXCLIENTSERVER --
msbuild ".\test\qxClientServer\qxClient\qxClient.sln" /p:Configuration=Release /t:build /nologo /v:detailed
IF NOT EXIST ".\test\_bin\qxClient.exe" GOTO END
msbuild ".\test\qxClientServer\qxServer\qxServer.sln" /p:Configuration=Release /t:build /nologo /v:detailed
IF NOT EXIST ".\test\_bin\qxServer.exe" GOTO END
:END
PAUSE
