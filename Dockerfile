FROM mcr.microsoft.com/dotnet/aspnet:10.0 as base
WORKDIR /app
COPY . .
ENTRYPOINT ["dotnet","SampleApi.dll"]