# Use .NET 10 runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080

# Use .NET 10 SDK for build
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["SampleApi.csproj", "./"]
RUN dotnet restore "./SampleApi.csproj"
COPY . .
RUN dotnet publish "SampleApi.csproj" -c Release -o /app/publish

# Final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "SampleApi.dll"]