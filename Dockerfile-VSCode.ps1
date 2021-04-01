#Install Docker plugin on VS Code (C# plugin is a prerequisite).

#Press Ctr+Shift+P to bring up the command pallette.

#In Command Pallette type "docker add" and select "Add Docker files to Workspace".

#Select the project type, platform, port options and etc.

#Note that this doesn't set the port! You will have to add it in...
FROM base AS final
ENV ASPNETCORE_URLS=http://*5000 #Like this!
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DemoProject.dll"]