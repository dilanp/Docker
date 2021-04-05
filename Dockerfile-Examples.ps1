#Always try to use smallest base images.
#Windows NANOSERVER images are the most compact and has .NET Core.
#Windows SERVERCORE images are bigger and has .NET Framework.

#Using multi-stage builds helps creating smaller docker images.
#It's OK to use larger images for the intermediate builds.
#Build steps need to be labelled first with "AS" keyword.
FROM mcr.microsoft.com/dotnet/core/sdk:2.1-nanoserver-sac2016 AS build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

#Use the SMALLEST possible image for the end image creation.
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
FROM mcr.microsoft.com/dotnet/core/runtime:2.1-nanoserver-sac2016

#Then copy the build result from the previous builds.
COPY --from=build-env /app/out .
COPY --from=build C:\\app\\bin\\Release\\netcoreapp2.1\\hello.exe \
  C:\\app\\bin\\Release\\netcoreapp2.1\\hello.dll \
  C:\\app\\bin\\Release\\netcoreapp2.1\\hello.runtimeconfig.json /app/

